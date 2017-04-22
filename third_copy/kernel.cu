#include "headerfile.h"
#include "getvariables.h"
#include "initialise_and_addnoise.h"
#include "cudafiles_1.h"
#include "cudafiles_2.h"
#include "graph_terms.h"
// #include "diffusion.cuh"


int main(){

//set the initial latice spacing. 
latice_spacing_z = 1.0; 
previous_latice_spacing_z = latice_spacing_z;

//collect variables
getvariables();

//allocate memory on the machine
phi_A = (double*) malloc(volume*sizeof(double));
phi_B = (double*) malloc(volume*sizeof(double));
phi_C = (double*) malloc(volume*sizeof(double));

delta_phi_A_delta_tau = (double*) malloc(volume*sizeof(double));
delta_phi_B_delta_tau = (double*) malloc(volume*sizeof(double));
delta_phi_C_delta_tau = (double*) malloc(volume*sizeof(double));



phi_z = (double*) malloc(length_z*sizeof(double));
	    

//create grid				
initialise();

// gives percentage of a or b polymer at each grid point
addnoise();


//initialise_solvent();
//this function adds the solvent to the system
		
//start calculation of system
phi_diffusion_calc();

//confirm completion
cout << "  " << endl;
cout << "Finished. Press enter to close window" << endl;

// pause
cin.get();

//end
}

void phi_diffusion_calc()
{   


	cudaSetDevice(0);

    // allocate memory on the device
	cudaMalloc((void **) &device_phi_A, volume*sizeof(double));
	cudaMalloc((void **) &device_phi_B, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_A, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_A, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_B, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_B, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_A_grad_lambda_x, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_A_grad_lambda_x, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_B_grad_lambda_x, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_B_grad_lambda_x, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_A_grad_lambda_y, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_A_grad_lambda_y, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_B_grad_lambda_y, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_B_grad_lambda_y, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_A_grad_lambda_z, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_A_grad_lambda_z, volume*sizeof(double));
	cudaMalloc((void **) &device_mu1_B_grad_lambda_z, volume*sizeof(double));
	cudaMalloc((void **) &device_mu2_B_grad_lambda_z, volume*sizeof(double));

	cudaMalloc((void **) &device_delta_phi_A_delta_tau, volume*sizeof(double));
	cudaMalloc((void **) &device_delta_phi_B_delta_tau, volume*sizeof(double));

	cudaMalloc((void **) &device_phisum2d_A, length_y*length_z*sizeof(double));
	cudaMalloc((void **) &device_phisum2d_B, length_y*length_z*sizeof(double));
	cudaMalloc((void **) &device_phisum1d_A, length_z*sizeof(double));
	cudaMalloc((void **) &device_phisum1d_B, length_z*sizeof(double));


	cudaMalloc((void **) &device_delta_z, length_z*sizeof(double));


    // copy phi matrice from the host to the device
    cudaMemcpy(device_phi_A, phi_A, volume*sizeof(double), cudaMemcpyHostToDevice);
    cudaMemcpy(device_phi_B, phi_B, volume*sizeof(double), cudaMemcpyHostToDevice);

    // defines the number of grids and threads to be used in the parallel computation
    // both grids and threads can have 3 dimensions, but number of threads is limited to 512
    // so best to use two block dimensions of size length each and one thread dimension of size length

	
	dim3 phi_diffusion_grid(phi_diffusion_num_blocks_x, phi_diffusion_num_blocks_y, 1);
	dim3 phi_diffusion_threads(phi_diffusion_num_threads_x, 1, 1);   
	dim3 phi_surface_grid(phi_diffusion_num_blocks_x, 1, 1);
	dim3 phi_surface_threads(phi_diffusion_num_threads_x, 1, 1);
	
	dim3 two_d_threads(phi_diffusion_num_blocks_x, 1, 1);
	dim3 two_d_blocks(phi_diffusion_num_blocks_y, 1, 1);


	time_t start,end;
    double dif;
	double timesofar = 0;
	double runtime;
	double percentcomplete;
	 

	initialise_solvent <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, solvent); 

	phi_sum2d <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, device_phisum2d_A, device_phisum2d_B);
	phi_sum1d <<< two_d_blocks, two_d_threads, 0 >>>(device_phisum1d_A, device_phisum1d_B, device_phisum2d_A, device_phisum2d_B, device_delta_z);


	cudaMemcpy(phi_A, device_phi_A, volume*sizeof(double), cudaMemcpyDeviceToHost);
    cudaMemcpy(phi_B, device_phi_B, volume*sizeof(double), cudaMemcpyDeviceToHost);
	
	//store_minimum_data();
	store_data();
	check_data();

	
	array_delta_z = (double*) malloc(length_z*sizeof(double));

	cudaMemcpy(array_delta_z, device_delta_z, length_z*sizeof(double), cudaMemcpyDeviceToHost);
	print_values_z();
	
	


	for (counter = counter_start+1; counter < countmax; counter++)
	{  
		
		time (&start);
		
			   
		for (int loop_counter = 0; loop_counter < num_saves; loop_counter++)
		{   


			// kenrel invocation
       
			//phi_surf <<< phi_surface_grid, phi_surface_threads, 0 >>>(device_phi_A, device_phi_B, device_delta_z); 
	   
					 
			remove_top_solvent <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, evaporation);
		
		
			phi_sum2d <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, device_phisum2d_A, device_phisum2d_B);
		
		
			phi_sum1d <<< two_d_blocks, two_d_threads, 0 >>>(device_phisum1d_A, device_phisum1d_B, device_phisum2d_A, device_phisum2d_B, device_delta_z);


			phi_surf <<< phi_surface_grid, phi_surface_threads, 0 >>>(device_phi_A, device_phi_B, device_delta_z); 

			//kernel invocation
		
			mu_calc <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>
				   (device_phi_A,
				    device_phi_B,
					device_mu1_A,
					device_mu2_A,
					device_mu1_B,
					device_mu2_B,
					delta_x,
					delta_y,
				//	delta_z,
					kappa,
					chi_scale,
					pbc_x,
					pbc_y,
					pbc_z,
					deg_polyA,
					deg_polyB,
					deg_polyC,
					kappa,
					kai_AB,
					kai_AC,
					kai_BC,
					device_delta_z);
	
		

       
			mu_surf <<< phi_surface_grid, phi_surface_threads, 0 >>>
				    (device_phi_A,
					device_phi_B,
					device_mu1_A,
					device_mu2_A,
					device_mu1_B,
					device_mu2_B,
					g_upper,
					h_upper,
					g_lower,
					h_lower);
	    


	 	 
			new_phi_diffusion_1 <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>
				                   (device_phi_A,
								    device_phi_B,
									device_mu1_A,
									device_mu2_A,
									device_mu1_B,
									device_mu2_B,
									device_mu1_A_grad_lambda_x,
									device_mu2_A_grad_lambda_x,
									device_mu1_B_grad_lambda_x,
									device_mu2_B_grad_lambda_x,
									device_mu1_A_grad_lambda_y,
									device_mu2_A_grad_lambda_y,
									device_mu1_B_grad_lambda_y,
									device_mu2_B_grad_lambda_y,
									device_mu1_A_grad_lambda_z,
									device_mu2_A_grad_lambda_z,
									device_mu1_B_grad_lambda_z,
									device_mu2_B_grad_lambda_z,
									delta_x,
									delta_y,
								//	delta_z,
									delta_t,
									mobility,
									pbc_x,
									pbc_y,
									pbc_z,
									kappa,
									device_delta_z
									);


		
			new_phi_diffusion_2 <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>
		
		                           (device_phi_A,
								    device_phi_B,
									device_mu1_A_grad_lambda_x,
									device_mu2_A_grad_lambda_x,
									device_mu1_B_grad_lambda_x,
									device_mu2_B_grad_lambda_x,
									device_mu1_A_grad_lambda_y,
									device_mu2_A_grad_lambda_y,
									device_mu1_B_grad_lambda_y,
									device_mu2_B_grad_lambda_y,
									device_mu1_A_grad_lambda_z,
									device_mu2_A_grad_lambda_z,
									device_mu1_B_grad_lambda_z,
									device_mu2_B_grad_lambda_z,
									delta_x,
									delta_y,
								//	delta_z,
									delta_t,
									mobility,
									pbc_x,
									pbc_y,
									pbc_z,
									kappa,
									device_delta_phi_A_delta_tau,
									device_delta_phi_B_delta_tau,
									device_delta_z
						            );
		
		}


		// copy the phi matrix values back from the device to the host
		cudaMemcpy(phi_A, device_phi_A, volume*sizeof(double), cudaMemcpyDeviceToHost);
        cudaMemcpy(phi_B, device_phi_B, volume*sizeof(double), cudaMemcpyDeviceToHost);

		

		//printf("stopped");
		//cin.get();

	    // graphplot_text();
		// graphplot_visual();
		// areaplot_text();

	    store_data();
		
		check_data();
		//store_minimum_data();

		
		/*

		cudaMemcpy(delta_phi_A_delta_tau, device_delta_phi_A_delta_tau, volume*sizeof(double), cudaMemcpyDeviceToHost);
		cudaMemcpy(delta_phi_B_delta_tau, device_delta_phi_B_delta_tau, volume*sizeof(double), cudaMemcpyDeviceToHost);
		//store_deltas();

		cudaMemcpy(array_delta_z, device_delta_z, length_z*sizeof(double), cudaMemcpyDeviceToHost);
	    print_values_z();
				
		*/
		

		time (&end);
        dif = difftime (end,start) / 60;
		runtime = dif*(countmax-1);
		timesofar += dif;
		percentcomplete = 100 * timesofar/runtime;

		

		cout << "loop " << counter << " of " << countmax-1 << " took " << dif <<" minutes." << endl;
		cout << "times run so far is " << timesofar << " minutes of a estimated time of " << runtime << " minutes." << endl;
		cout << percentcomplete << "% complete..." << endl;


   	}
   	
	cudaFree(device_phi_A);
	cudaFree(device_phi_B);
	cudaFree(device_mu1_A);
	cudaFree(device_mu2_A);
	cudaFree(device_mu1_B);
	cudaFree(device_mu2_B);
	
	cudaFree(device_mu1_A_grad_lambda_x);
	cudaFree(device_mu2_A_grad_lambda_x);
	cudaFree(device_mu1_B_grad_lambda_x);
	cudaFree(device_mu2_B_grad_lambda_x);
	cudaFree(device_mu1_A_grad_lambda_y);
	cudaFree(device_mu2_A_grad_lambda_y);
	cudaFree(device_mu1_B_grad_lambda_y);
	cudaFree(device_mu2_B_grad_lambda_y);
	cudaFree(device_mu1_A_grad_lambda_z);
	cudaFree(device_mu2_A_grad_lambda_z);
	cudaFree(device_mu1_B_grad_lambda_z);
	cudaFree(device_mu2_B_grad_lambda_z);

	cudaFree(device_phisum2d_A);
	cudaFree(device_phisum2d_B);
	cudaFree(device_phisum1d_A);
	cudaFree(device_phisum1d_B);


	cudaFree(device_delta_z);

	free(phi_A);
	free(phi_B);
	free(phi_C);
	free(phi_z);


	free(array_delta_z);
}





