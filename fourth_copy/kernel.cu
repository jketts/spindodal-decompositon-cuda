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


lattice_height = (double*) malloc(volume*sizeof(double));


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
	cudaMalloc((void **) &device_deltas, volume*sizeof(double));
	cudaMalloc((void **) &device_lattice_height, volume*sizeof(double));



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


	//load variables that will run time estimation can be made
	time_t start,end;
    double dif;
	double timesofar = 0;
	double runtime;
	double percentcomplete;
	 
	//apply solvent to entire system
	initialise_solvent <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, solvent); 

	//give each point a delta_z value depending on its solvent concentration
	make_deltas <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(delta_x, device_phi_A, device_phi_B, device_deltas, solvent);

	//find the height of each point using the delta_z values
	//WARNING!!! THIS BIT OF CODE IS INEFFICIENT
	find_z_height <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_deltas, device_lattice_height);
	

	//copy array from GPU to CPU
	cudaMemcpy(phi_A, device_phi_A, volume*sizeof(double), cudaMemcpyDeviceToHost);
    cudaMemcpy(phi_B, device_phi_B, volume*sizeof(double), cudaMemcpyDeviceToHost);
	

	//copy lattice heights from GPU to CPU
	cudaMemcpy(lattice_height, device_lattice_height, volume*sizeof(double), cudaMemcpyDeviceToHost);
	
	//store the initital data to files and subfolders
	store_data();
	new_store_data();
	check_data();
	//store_minimum_data();


	//begin the main loop 

	for (counter = counter_start+1; counter < countmax; counter++)
	{  
		
		//record time so time estimation can be made
		time (&start);
		
		
		//begin inner loop that iterates the system between each data output
		for (int loop_counter = 0; loop_counter < num_saves; loop_counter++)
		{   


			//remove a small amount of solvent from the top layer					 
			remove_top_solvent <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_phi_A, device_phi_B, evaporation);
		
			//give each point a delta_z value depending on its solvent concentration
	        make_deltas <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(delta_x, device_phi_A, device_phi_B, device_deltas, solvent);

			//employ surface conditions on the system
			phi_surf <<< phi_surface_grid, phi_surface_threads, 0 >>>(device_phi_A, device_phi_B, device_deltas); 

			//calcualte the mu values		
			mu_calc <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>
				   (device_phi_A,
				    device_phi_B,
					device_mu1_A,
					device_mu2_A,
					device_mu1_B,
					device_mu2_B,
					delta_x,
					delta_y,
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
					device_deltas
					);
	
		

			//employ surface conditions on the mu array to match the system
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
					h_lower
					);
	    
	 	 
			//begin the diffusion calculation
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
									delta_t,
									mobility,
									pbc_x,
									pbc_y,
									pbc_z,
									kappa,
									device_deltas
									);


		    //finish the diffusion calculation
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
									delta_t,
									mobility,
									pbc_x,
									pbc_y,
									pbc_z,
									kappa,
									device_delta_phi_A_delta_tau,
									device_delta_phi_B_delta_tau,
									device_deltas
						            );
		    
			//find the height of each lattice point 
			find_z_height <<< phi_diffusion_grid, phi_diffusion_threads, 0 >>>(device_deltas, device_lattice_height);
		    
			//put the new array into the interpolated array
			
		}


		// copy the phi matrix values back from the device to the host
		cudaMemcpy(phi_A, device_phi_A, volume*sizeof(double), cudaMemcpyDeviceToHost);
        cudaMemcpy(phi_B, device_phi_B, volume*sizeof(double), cudaMemcpyDeviceToHost);

		
		// copy lattice height values back from the device to the host
		cudaMemcpy(lattice_height, device_lattice_height, volume*sizeof(double), cudaMemcpyDeviceToHost);

		
		//store the initital data to files and subfolders 
	    store_data();
		new_store_data();
		check_data();
		//store_minimum_data();

		
		
		/*
		//this code outputs the can between each output values and is useful for debugging.
		cudaMemcpy(delta_phi_A_delta_tau, device_delta_phi_A_delta_tau, volume*sizeof(double), cudaMemcpyDeviceToHost);
		cudaMemcpy(delta_phi_B_delta_tau, device_delta_phi_B_delta_tau, volume*sizeof(double), cudaMemcpyDeviceToHost);
		store_deltas();
		*/
						
		
		
		//work out time estimation
		time (&end);
        dif = difftime (end,start) / 60;
		runtime = dif*(countmax-1);
		timesofar += dif;
		percentcomplete = 100 * timesofar/runtime;

		
		//print time estimation to screen
		cout << "loop " << counter << " of " << countmax-1 << " took " << dif <<" minutes." << endl;
		cout << "times run so far is " << timesofar << " minutes of a estimated time of " << runtime << " minutes." << endl;
		cout << percentcomplete << "% complete..." << endl;


     //end the outer loop
   	}

   	
	//free the memory on the GPU
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
	cudaFree(device_deltas);


	//free the allocted memory on the host
	free(phi_A);
	free(phi_B);
	free(phi_C);

	free(array_delta_z);
	free(lattice_height);
	
	//thats the end
}





