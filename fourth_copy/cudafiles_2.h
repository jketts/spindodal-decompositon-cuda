
__global__ void initialise_solvent(double *g_device_phi_A, double *g_device_phi_B, double solvent)
{
	
	//work out which current thread we are on in the 3D system;
	
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;  

	 unsigned int area = length_x *length_y;  


	g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area] *(1.0 - solvent); 
	g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area] *(1.0 - solvent); 


	//make sure this is apllied to all threads
	__syncthreads();

}

__global__ void remove_top_solvent(double *g_device_phi_A, double *g_device_phi_B, double evaporation)
{
	
	//work out which current thread we are on in the 3D system;
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;

	unsigned int area = length_x *length_y;



	int toplayer = length_z - 3;

	//only on the top layer
	if(ks == toplayer)
	{ 
		
		//remove all the solvent!
		double phi_C = 1.0 - ( g_device_phi_A[is+js*length_y+ks*area] +  g_device_phi_B[is+js*length_y+ks*area]);
	
		g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area]/(1-phi_C);
    	g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area]/(1-phi_C);
		
		//reduce the solvent amount
		phi_C = phi_C*(1.0 - evaporation); 
		
		//reapply the new solvent	
		g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area] * (1-phi_C);
   		g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area] * (1-phi_C);
	}
	
	__syncthreads();
}



__global__ void make_deltas(double g_delta_x, double *g_device_phi_A, double *g_device_phi_B, double *g_device_deltas, double solvent)
{
		
	//work out which current thread we are on in the 3D system;
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;  

	unsigned int area = length_x *length_y;  

	//give the lattice point a delta_z value dependant on the amoun of solvent in the cell	 
	g_device_deltas[is+js*length_y+ks*area] =  (g_delta_x/solvent)*(1.0-(g_device_phi_A[is+js*length_y+ks*area] + g_device_phi_B[is+js*length_y+ks*area]));

	__syncthreads();
}
