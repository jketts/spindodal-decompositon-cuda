


// no flux boundary conditions top and bottom
// define kernel

__global__ void phi_surf(double *g_device_phi_A, double *g_device_phi_B, double *g_device_deltas)
{
	
    //define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 
	//^ last line is not needed so has been commented out.

	//boundry conditions
	unsigned int ks_lower = 0; 
	unsigned int ks_upper = length_z-1;

	
	unsigned int area = length_x * length_y;

	//is this line correct? yes!
	unsigned int index0 = is+js*length_y+ks_lower*area;
	unsigned int index1 = is+js*length_y+(ks_lower+1)*area;
	unsigned int index2 = is+js*length_y+(ks_lower+3)*area;
	unsigned int index3 = is+js*length_y+(ks_lower+4)*area;

	unsigned int index4 = is+js*length_y+ks_upper*area;
	unsigned int index5 = is+js*length_y+(ks_upper-1)*area;
	unsigned int index6 = is+js*length_y+(ks_upper-3)*area;
	unsigned int index7 = is+js*length_y+(ks_upper-4)*area;


	g_device_phi_A[index0] = g_device_phi_A[index3];
	g_device_phi_A[index1] = g_device_phi_A[index2];

	g_device_phi_A[index4] = g_device_phi_A[index7];
	g_device_phi_A[index5] = g_device_phi_A[index6];

	g_device_phi_B[index0] = g_device_phi_B[index3];
	g_device_phi_B[index1] = g_device_phi_B[index2];

	g_device_phi_B[index4] = g_device_phi_B[index7];
	g_device_phi_B[index5] = g_device_phi_B[index6];

	//set the values of delta z to match the boundry conditions 
	g_device_deltas[ks_lower] = g_device_deltas[ks_lower+4];
	g_device_deltas[ks_lower+1] = g_device_deltas[ks_lower+3];

	g_device_deltas[ks_upper] = g_device_deltas[ks_upper-4];
	g_device_deltas[ks_upper-1] = g_device_deltas[ks_upper-3];



	__syncthreads();

}





// define kernel
__global__ void mu_calc(double *g_device_phi_A,
	                double *g_device_phi_B,
					double *g_device_mu1_A,
					double *g_device_mu2_A,
					double *g_device_mu1_B,
					double *g_device_mu2_B,
					double g_delta_x,
					double g_delta_y,
				//	double g_delta_z,
					double g_kappa,
					double g_kai_scale,
					unsigned int g_pbc_x,
					unsigned int g_pbc_y,
					unsigned int g_pbc_z,
					double deg_polyA,
	                double deg_polyB,
					double deg_polyC,
					double kappa,
					double kai_AB,
					double kai_AC,
					double kai_BC,
					double *g_device_deltas)
{


    //define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;
   
	unsigned int area = length_x * length_y;
	unsigned int index = is+js*length_y+ks*area;



    __shared__ double phi_A[length_x];

	phi_A[is] = g_device_phi_A[index];
  
	__shared__ double phi_B[length_x];
	phi_B[is] = g_device_phi_B[index];

	__syncthreads();


	unsigned int forw = is+(((js+1)&g_pbc_y)*length_y)+ks*area;
	unsigned int back = is+(((js-1)&g_pbc_y)*length_y)+ks*area;
	unsigned int up = is+js*length_y+((ks+1)&g_pbc_z)*area;
	unsigned int down = is+js*length_y+((ks-1)&g_pbc_z)*area;

	unsigned int left = ((is+1)&g_pbc_x);
	unsigned int right = ((is-1)&g_pbc_x);

	
	double delta_is = g_device_deltas[is];
	double delta_up = g_device_deltas[up];
	double delta_down = g_device_deltas[down];


	double phi_A_is = phi_A[is];
	double phi_A_left = phi_A[left];
	double phi_A_right = phi_A[right];

	double phi_A_forw = g_device_phi_A[forw];
	double phi_A_back = g_device_phi_A[back];
	double phi_A_up = g_device_phi_A[up];
	double phi_A_down = g_device_phi_A[down];


	double phi_B_is = phi_B[is];
	double phi_B_left = phi_B[left];
	double phi_B_right = phi_B[right];

	double phi_B_forw = g_device_phi_B[forw];
	double phi_B_back = g_device_phi_B[back];
	double phi_B_up = g_device_phi_B[up];
	double phi_B_down = g_device_phi_B[down];



 	double laplace_phi_A;
	laplace_phi_A =  
		             (((phi_A_left+phi_A_right)-(2.0*phi_A_is))/(g_delta_x*g_delta_x))
		            +(((phi_A_forw+phi_A_back)-(2.0*phi_A_is))/(g_delta_y*g_delta_y)) 
					+((4.0/(delta_is+delta_down))*(((phi_A_up-phi_A_is)/(delta_is+delta_up))-((phi_A_is-phi_A_down)/(delta_is+delta_down))));


	double laplace_phi_B;
	laplace_phi_B = 		
		             (((phi_B_left+phi_B_right)-(2.0*phi_B_is))/(g_delta_x*g_delta_x))
		            +(((phi_B_forw+phi_B_back)-(2.0*phi_B_is))/(g_delta_y*g_delta_y)) 
				  	+((4.0/(delta_is+delta_down))*(((phi_B_up-phi_B_is)/(delta_is+delta_up))-((phi_B_is-phi_B_down)/(delta_is+delta_down))));
					


	
	double grad_phi_A_sq;
	grad_phi_A_sq = ((phi_A_right-phi_A_left)*(phi_A_right-phi_A_left))/(4.0*g_delta_x*g_delta_x);
	grad_phi_A_sq += ((phi_A_forw-phi_A_back)*(phi_A_forw-phi_A_back))/(4.0*g_delta_y*g_delta_y);
	grad_phi_A_sq += ((phi_A_up-phi_A_down)*(phi_A_up-phi_A_down))/((delta_up+delta_down)*(delta_up+delta_down));
	  
	
		
	double grad_phi_B_sq;
	grad_phi_B_sq = ((phi_B_right-phi_B_left)*(phi_B_right-phi_B_left))/(4.0*g_delta_x*g_delta_x);
	grad_phi_B_sq += ((phi_B_forw-phi_B_back)*(phi_B_forw-phi_B_back))/(4.0*g_delta_y*g_delta_y);
	grad_phi_B_sq += ((phi_B_up-phi_B_down)*(phi_B_up-phi_B_down))/((delta_up+delta_down)*(delta_up+delta_down));
	




	g_device_mu1_A[index] = (                          ( (logf(phi_A_is))/deg_polyA
	                                              -(logf(1.0-phi_A_is-phi_B_is))/deg_polyC
											      +kai_AC*(1.0-2.0*phi_A_is-phi_B_is)    
											      +phi_B_is*(kai_AB-kai_BC)
											     )

/*					                           +(1.0/36.0)*( (((1.0/((1.0-phi_A_is-phi_B_is)*(1.0-phi_A_is-phi_B_is)))
					                                    -(1.0/((phi_A_is)*(phi_A_is))))*grad_phi_A_sq
								                         )
							                            +(((1.0/((1.0-phi_A_is-phi_B_is)*(1.0-phi_A_is-phi_B_is)))*grad_phi_B_sq)) 
						                                  )
*/
					                                   -((1.0/18.0)*(((1.0/(1.0-phi_A_is-phi_B_is))+(1/phi_A_is))*laplace_phi_A
											             +((1.0/(1.0-phi_A_is-phi_B_is))*laplace_phi_B))
					                                    )
					                            );


	g_device_mu2_A[index] = (                        ((logf(phi_B_is))/deg_polyB
	                                          -(logf(1.0-phi_A_is-phi_B_is))/deg_polyC
											  +kai_BC*(1.0-phi_A_is-2.0*phi_B_is)   
											  +phi_A_is*(kai_AB-kai_AC)
											 )

/*					                       +(1.0/36.0)*( (((1.0/((1.0-phi_A_is-phi_B_is)*(1.0-phi_A_is-phi_B_is)))
					                                -(1.0/((phi_B_is)*(phi_B_is))))*grad_phi_B_sq
								                     )
							                         +(((1.0/((1.0-phi_A_is-phi_B_is)*(1.0-phi_A_is-phi_B_is)))*grad_phi_A_sq)) 
						                          	 )
*/
					                        -((1.0/18.0)*(((1.0/(1.0-phi_A_is-phi_B_is))+(1/phi_B_is))*laplace_phi_B
											   +((1.0/(1.0-phi_A_is-phi_B_is))*laplace_phi_A))
					                          )
					                       );



	g_device_mu1_B[index] = g_device_mu1_A[index];

	g_device_mu2_B[index] = g_device_mu2_A[index];
	

	__syncthreads();


}




// define kernel

__global__ void mu_surf(double *g_device_phi_A,
	                    double *g_device_phi_B,
						double *g_device_mu1_A,
						double *g_device_mu2_A,
						double *g_device_mu1_B,
						double *g_device_mu2_B,
						double g_g_upper,
						double g_h_upper,
						double g_g_lower,
						double g_h_lower
						)
{
    //define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 //	unsigned int ks = blockIdx.y;

	//^ last line is commented out as it is not used here

	//boundry conditions
	unsigned int ks_lower = 0; 
	unsigned int ks_upper = length_z-1; 

	unsigned int area = length_x*length_y;

	unsigned int index1 = is+js*length_y+(ks_lower+1)*area;
	unsigned int index2 = is+js*length_y+(ks_lower+2)*area;

	unsigned int index5 = is+js*length_y+(ks_upper-1)*area;
	unsigned int index6 = is+js*length_y+(ks_upper-2)*area;


	double mu1_A = g_device_mu1_A[index2];
	double delta_mu1_A = (-g_h_lower-g_g_lower*g_device_phi_A[index2]);    
	g_device_mu1_A[index2] = mu1_A+delta_mu1_A;

	mu1_A = g_device_mu1_A[index6];
	delta_mu1_A = (-g_h_upper-g_g_upper*g_device_phi_A[index6]);
	g_device_mu1_A[index6] = mu1_A+delta_mu1_A;

	g_device_mu1_A[index1] = g_device_mu1_A[index2];
	g_device_mu1_A[index5] = g_device_mu1_A[index6];

	double mu2_A = g_device_mu2_A[index2];
	double delta_mu2_A = (-g_h_lower-g_g_lower*g_device_phi_A[index2]);    
	g_device_mu2_A[index2] = mu2_A+delta_mu2_A;

	mu2_A = g_device_mu2_A[index6];
	delta_mu2_A = (-g_h_upper-g_g_upper*g_device_phi_A[index6]);
	g_device_mu2_A[index6] = mu2_A+delta_mu2_A;

	g_device_mu2_A[index1] = g_device_mu2_A[index2];
	g_device_mu2_A[index5] = g_device_mu2_A[index6];


	double mu1_B = g_device_mu1_B[index2];
	double delta_mu1_B = (-g_h_lower-g_g_lower*g_device_phi_B[index2]);   
	g_device_mu1_B[index2] = mu1_B+delta_mu1_B;

	mu1_B = g_device_mu1_B[index6];
	delta_mu1_B = (-g_h_upper-g_g_upper*g_device_phi_B[index6]);
	g_device_mu1_B[index6] = mu1_B+delta_mu1_B;

	g_device_mu1_B[index1] = g_device_mu1_B[index2];
	g_device_mu1_B[index5] = g_device_mu1_B[index6]; 


	double mu2_B = g_device_mu2_B[index2];
	double delta_mu2_B = (-g_h_lower-g_g_lower*g_device_phi_B[index2]);   
	g_device_mu2_B[index2] = mu2_B+delta_mu2_B;

	mu2_B = g_device_mu2_B[index6];
	delta_mu2_B = (-g_h_upper-g_g_upper*g_device_phi_B[index6]);
	g_device_mu2_B[index6] = mu2_B+delta_mu2_B;

	g_device_mu2_B[index1] = g_device_mu2_B[index2];
	g_device_mu2_B[index5] = g_device_mu2_B[index6]; 

	__syncthreads();
	
}




//
// defines kernel with the __global__
__global__ void new_phi_diffusion_1(double *g_device_phi_A,
	                    double *g_device_phi_B,
						double *g_device_mu1_A,
						double *g_device_mu2_A,
						double *g_device_mu1_B,
						double *g_device_mu2_B,
						double *g_device_mu1_A_grad_lambda_x,
						double *g_device_mu2_A_grad_lambda_x,
						double *g_device_mu1_B_grad_lambda_x,
						double *g_device_mu2_B_grad_lambda_x,
						double *g_device_mu1_A_grad_lambda_y,
						double *g_device_mu2_A_grad_lambda_y,
						double *g_device_mu1_B_grad_lambda_y,
						double *g_device_mu2_B_grad_lambda_y,
						double *g_device_mu1_A_grad_lambda_z,
						double *g_device_mu2_A_grad_lambda_z,
						double *g_device_mu1_B_grad_lambda_z,
						double *g_device_mu2_B_grad_lambda_z,
						double g_delta_x,
						double g_delta_y,
					//	double g_delta_z,
						double g_delta_t,
						double g_mobility,
						unsigned int g_pbc_x,
						unsigned int g_pbc_y,
						unsigned int g_pbc_z,
						double kappa,
						double *g_device_deltas
						)
{
	
    //define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;

	unsigned int area = length_x * length_y;

	unsigned int index = is+js*length_y+ks*area;

	

    __shared__ double device_mu1_A[length_x];
	device_mu1_A[is] = g_device_mu1_A[index];

	__shared__ double device_mu2_A[length_x];
	device_mu2_A[is] = g_device_mu2_A[index];

    __shared__ double device_mu1_B[length_x];
	device_mu1_B[is] = g_device_mu1_B[index];

	__shared__ double device_mu2_B[length_x];
	device_mu2_B[is] = g_device_mu2_B[index];

	__syncthreads();
	


	unsigned int right = ((is-1)&g_pbc_x);
	unsigned int forw = is+(((js+1)&g_pbc_y)*length_y)+ks*area;
	unsigned int up = is+js*length_y+((ks+1)&g_pbc_z)*area;

	double delta_is = g_device_deltas[is];
	double delta_up = g_device_deltas[up];



   //loads the tempory array phi_A with the current values
	double phi_A_is = g_device_phi_A[index];


	//loads the tempory array phi_B with the current values
	double phi_B_is = g_device_phi_B[index];


	double device_mu1_A_is = device_mu1_A[is];
	double device_mu1_A_right = device_mu1_A[right];
	double device_mu1_A_forw = g_device_mu1_A[forw];
	double device_mu1_A_up = g_device_mu1_A[up];

	double device_mu1_B_is = device_mu1_B[is];
	double device_mu1_B_right = device_mu1_B[right];
	double device_mu1_B_forw = g_device_mu1_B[forw];
	double device_mu1_B_up = g_device_mu1_B[up];

	double device_mu2_A_is = device_mu2_A[is];
	double device_mu2_A_right = device_mu2_A[right];
	double device_mu2_A_forw = g_device_mu2_A[forw];
	double device_mu2_A_up = g_device_mu2_A[up];

	double device_mu2_B_is = device_mu2_B[is];
	double device_mu2_B_right = device_mu2_B[right];
	double device_mu2_B_forw = g_device_mu2_B[forw];
	double device_mu2_B_up = g_device_mu2_B[up];



	double grad_mu1_A_x = (device_mu1_A_right-device_mu1_A_is)/g_delta_x;
	double grad_mu1_A_y = (device_mu1_A_forw-device_mu1_A_is)/g_delta_y;
	double grad_mu1_A_z = (device_mu1_A_up-device_mu1_A_is)/((delta_up+delta_is)/2);



	double grad_mu2_A_x = (device_mu2_A_right-device_mu2_A_is)/g_delta_x;
	double grad_mu2_A_y = (device_mu2_A_forw-device_mu2_A_is)/g_delta_y;
	double grad_mu2_A_z = (device_mu2_A_up-device_mu2_A_is)/((delta_up+delta_is)/2);
  
		

	double grad_mu1_B_x = (device_mu1_B_right-device_mu1_B_is)/g_delta_x;
	double grad_mu1_B_y = (device_mu1_B_forw-device_mu1_B_is)/g_delta_y;
	double grad_mu1_B_z = (device_mu1_B_up-device_mu1_B_is)/((delta_up+delta_is)/2);

		
	
	double grad_mu2_B_x = (device_mu2_B_right-device_mu2_B_is)/g_delta_x;
	double grad_mu2_B_y = (device_mu2_B_forw-device_mu2_B_is)/g_delta_y;
	double grad_mu2_B_z = (device_mu2_B_up-device_mu2_B_is)/((delta_up+delta_is)/2);
  


/*
	double kronecker_delta_A_A = 1;
	double kronecker_delta_A_B = 0;
	double kronecker_delta_B_B = 1;
	double kronecker_delta_B_A = 0;
*/


   double lambda_BA = (0.0-phi_B_is)-phi_A_is+2.0*phi_B_is*phi_A_is; 

   double lambda_AA = (1.0-phi_A_is)-phi_A_is+2.0*phi_A_is*phi_A_is;

   double lambda_BB = (1.0-phi_B_is)-phi_B_is+2.0*phi_B_is*phi_B_is;

   double lambda_AB = (0.0-phi_A_is)-phi_B_is+2.0*phi_A_is*phi_B_is;

   

   g_device_mu1_A_grad_lambda_x[index] = lambda_AA*grad_mu1_A_x;
   g_device_mu2_A_grad_lambda_x[index] = lambda_AB*grad_mu2_A_x;	
   g_device_mu1_B_grad_lambda_x[index] = lambda_BA*grad_mu1_B_x;
   g_device_mu2_B_grad_lambda_x[index] = lambda_BB*grad_mu2_B_x;


   g_device_mu1_A_grad_lambda_y[index] = lambda_AA*grad_mu1_A_y;
   g_device_mu2_A_grad_lambda_y[index] = lambda_AB*grad_mu2_A_y;	
   g_device_mu1_B_grad_lambda_y[index] = lambda_BA*grad_mu1_B_y;
   g_device_mu2_B_grad_lambda_y[index] = lambda_BB*grad_mu2_B_y;


   g_device_mu1_A_grad_lambda_z[index] = lambda_AA*grad_mu1_A_z; 
   g_device_mu2_A_grad_lambda_z[index] = lambda_AB*grad_mu2_A_z;	
   g_device_mu1_B_grad_lambda_z[index] = lambda_BA*grad_mu1_B_z;
   g_device_mu2_B_grad_lambda_z[index] = lambda_BB*grad_mu2_B_z;


   __syncthreads();

}



// defines kernel with the __global__
__global__ void new_phi_diffusion_2(double *g_device_phi_A,
	                    double *g_device_phi_B,
						double *g_device_mu1_A_grad_lambda_x,
						double *g_device_mu2_A_grad_lambda_x,
						double *g_device_mu1_B_grad_lambda_x,
						double *g_device_mu2_B_grad_lambda_x,
						double *g_device_mu1_A_grad_lambda_y,
						double *g_device_mu2_A_grad_lambda_y,
						double *g_device_mu1_B_grad_lambda_y,
						double *g_device_mu2_B_grad_lambda_y,
						double *g_device_mu1_A_grad_lambda_z,
						double *g_device_mu2_A_grad_lambda_z,
						double *g_device_mu1_B_grad_lambda_z,
						double *g_device_mu2_B_grad_lambda_z,
						double g_delta_x,
						double g_delta_y,
				//		double g_delta_z,
						double g_delta_t,
						double g_mobility,
						unsigned int g_pbc_x,
						unsigned int g_pbc_y,
						unsigned int g_pbc_z,
						double kappa,
						double *delta_phi_A_delta_tau,
						double *delta_phi_B_delta_tau,
						double *g_device_deltas)
{
	   
	//define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;

	unsigned int area = length_x * length_y;

	unsigned int index = is+js*length_y+ks*area;

	
    __shared__ double device_mu1_A_grad_lambda_x[length_x];
	device_mu1_A_grad_lambda_x[is] = g_device_mu1_A_grad_lambda_x[index];

	__shared__ double device_mu2_A_grad_lambda_x[length_x];
	device_mu2_A_grad_lambda_x[is] = g_device_mu2_A_grad_lambda_x[index];

    __shared__ double device_mu1_B_grad_lambda_x[length_x];
	device_mu1_B_grad_lambda_x[is] = g_device_mu1_B_grad_lambda_x[index];

	__shared__ double device_mu2_B_grad_lambda_x[length_x];
	device_mu2_B_grad_lambda_x[is] = g_device_mu2_B_grad_lambda_x[index];



	__shared__ double device_mu1_A_grad_lambda_y[length_x];
	device_mu1_A_grad_lambda_y[is] = g_device_mu1_A_grad_lambda_y[index];

	__shared__ double device_mu2_A_grad_lambda_y[length_x];
	device_mu2_A_grad_lambda_y[is] = g_device_mu2_A_grad_lambda_y[index];

    __shared__ double device_mu1_B_grad_lambda_y[length_x];
	device_mu1_B_grad_lambda_y[is] = g_device_mu1_B_grad_lambda_y[index];

	__shared__ double device_mu2_B_grad_lambda_y[length_x];
	device_mu2_B_grad_lambda_y[is] = g_device_mu2_B_grad_lambda_y[index];



	__shared__ double device_mu1_A_grad_lambda_z[length_x];
	device_mu1_A_grad_lambda_z[is] = g_device_mu1_A_grad_lambda_z[index];

	__shared__ double device_mu2_A_grad_lambda_z[length_x];
	device_mu2_A_grad_lambda_z[is] = g_device_mu2_A_grad_lambda_z[index];

    __shared__ double device_mu1_B_grad_lambda_z[length_x];
	device_mu1_B_grad_lambda_z[is] = g_device_mu1_B_grad_lambda_z[index];

	__shared__ double device_mu2_B_grad_lambda_z[length_x];
	device_mu2_B_grad_lambda_z[is] = g_device_mu2_B_grad_lambda_z[index];


	__syncthreads();
	

	unsigned int left = ((is+1)&g_pbc_x);
	unsigned int back = is+(((js-1)&g_pbc_y)*length_y)+ks*area;
	unsigned int down = is+js*length_y+((ks-1)&g_pbc_z)*area;


	double delta_is = g_device_deltas[is];
	double delta_down = g_device_deltas[down];


   //loads the tempory array phi_A with the current values
	double phi_A_is = g_device_phi_A[index];


	//loads the tempory array phi_B with the current values
	double phi_B_is = g_device_phi_B[index];




	double device_mu1_A_is_x =  device_mu1_A_grad_lambda_x[is];
	double device_mu1_A_is_y =  device_mu1_A_grad_lambda_y[is];
	double device_mu1_A_is_z =  device_mu1_A_grad_lambda_z[is];
	double device_mu1_A_left =  device_mu1_A_grad_lambda_x[left];
	double device_mu1_A_back =  g_device_mu1_A_grad_lambda_y[back];
	double device_mu1_A_down =  g_device_mu1_A_grad_lambda_z[down];



	double device_mu1_B_is_x =  device_mu1_B_grad_lambda_x[is];
	double device_mu1_B_is_y =  device_mu1_B_grad_lambda_y[is];
	double device_mu1_B_is_z =  device_mu1_B_grad_lambda_z[is];
	double device_mu1_B_left =  device_mu1_B_grad_lambda_x[left];
	double device_mu1_B_back =  g_device_mu1_B_grad_lambda_y[back];
	double device_mu1_B_down =  g_device_mu1_B_grad_lambda_z[down];



    double device_mu2_A_is_x =  device_mu2_A_grad_lambda_x[is];
	double device_mu2_A_is_y =  device_mu2_A_grad_lambda_y[is];
	double device_mu2_A_is_z =  device_mu2_A_grad_lambda_z[is];
	double device_mu2_A_left =  device_mu2_A_grad_lambda_x[left];
	double device_mu2_A_back =  g_device_mu2_A_grad_lambda_y[back];
	double device_mu2_A_down = g_device_mu2_A_grad_lambda_z[down];



	double device_mu2_B_is_x =  device_mu2_B_grad_lambda_x[is];
	double device_mu2_B_is_y =  device_mu2_B_grad_lambda_y[is];
	double device_mu2_B_is_z =  device_mu2_B_grad_lambda_z[is];
	double device_mu2_B_left =  device_mu2_B_grad_lambda_x[left];
	double device_mu2_B_back = g_device_mu2_B_grad_lambda_y[back];
	double device_mu2_B_down = g_device_mu2_B_grad_lambda_z[down];


	double grad_mu1_A;
	grad_mu1_A = (device_mu1_A_is_x-device_mu1_A_left)/g_delta_x;
	grad_mu1_A += (device_mu1_A_is_y-device_mu1_A_back)/g_delta_y;
	grad_mu1_A += (device_mu1_A_is_z-device_mu1_A_down)/((delta_is+delta_down)/2);


	double grad_mu2_A;
	grad_mu2_A = (device_mu2_A_is_x-device_mu2_A_left)/g_delta_x;
	grad_mu2_A += (device_mu2_A_is_y-device_mu2_A_back)/g_delta_y;
	grad_mu2_A += (device_mu2_A_is_z-device_mu2_A_down)/((delta_is+delta_down)/2); 
  
		
	double grad_mu1_B;
	grad_mu1_B = (device_mu1_B_is_x-device_mu1_B_left)/g_delta_x;
	grad_mu1_B += (device_mu1_B_is_y-device_mu1_B_back)/g_delta_y;
	grad_mu1_B += (device_mu1_B_is_z-device_mu1_B_down)/((delta_is+delta_down)/2); 

		
	double grad_mu2_B;
	grad_mu2_B = (device_mu2_B_is_x-device_mu2_B_left)/g_delta_x;
	grad_mu2_B += (device_mu2_B_is_y-device_mu2_B_back)/g_delta_y;
	grad_mu2_B += (device_mu2_B_is_z-device_mu2_B_down)/((delta_is+delta_down)/2); 
  


/*
	double h_A;
    h_A = (z_dash*kai_AC/(2*z))-(delta_gamma_AC*b*b/(K*T));


    double h_B;
    h_B = (z_dash*kai_BC/(2*z))-(delta_gamma_BC*b*b/(K*T));


    double g_A;
    g_A = z_dash*kai_AC/z;


    double g_B;
    g_B = z_dash*kai_BC/z;


    double g_AB;
    g_AB = z_dash*((kai_AC+kai_BC-kai_AB)/z);
*/


    delta_phi_A_delta_tau[index] = (grad_mu1_A + grad_mu2_A)*g_delta_t
	//				+(-h_A-g_A*phi_A_is-(1/2)*g_AB+gamma*(delta_phi_A_delta_x)*g_delta_x)
				        	 ;
			

    delta_phi_B_delta_tau[index] = (grad_mu1_B + grad_mu2_B)*g_delta_t
	//				+(-h_A-g_A*phi_A_is-(1/2)*g_AB+gamma*(delta_phi_A_delta_x)*g_delta_x)
					 ;


	g_device_phi_A[index] = phi_A_is+delta_phi_A_delta_tau[index]; 
	g_device_phi_B[index] = phi_B_is+delta_phi_B_delta_tau[index];


	__syncthreads();
}


__global__ void find_z_height(double *g_device_deltas, double *g_device_lattice_height)
{
	//define vectors
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;

	unsigned int area = length_x * length_y;
	unsigned int index = is+js*length_y+ks*area;

	g_device_lattice_height[index]=0.0;

	int ks_under = ks;
	
//	g_device_lattice_height[index] = g_device_deltas[is+js*length_y+ks_under*area];
	

	while(ks_under >= 0)
	{
		
		g_device_lattice_height[index] += g_device_deltas[is+js*length_y+ks_under*area];
		
		ks_under--;
	}
	
	__syncthreads();

	//the end

}

