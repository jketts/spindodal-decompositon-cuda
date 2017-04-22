
__global__ void initialise_solvent(double *g_device_phi_A, double *g_device_phi_B, double solvent)
{
	
	//work out which current thread we are on in the 3D system;
	
	unsigned int is = threadIdx.x;
	unsigned int js = blockIdx.x;
 	unsigned int ks = blockIdx.y;  

	 unsigned int area = length_x *length_y;  

	 //height_y MUST be set to be equal to length_y
//	 double height_z = length_z;

	// current height in the y component is  = js * latice_spacing_z;
/*
	g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area] * (1.-((1./length_y)*js*latice_spacing_z));
	g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area] * (1.-((1./length_y)*js*latice_spacing_z));
*/

	// this will give error is lattice spacing is 1   *uint2double(js)
	g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area] *(1.0 -solvent); //(1.0 - 0.9*((1.0/height_z)*(uint2double(ks)+1.0)*latice_spacing_z)); 
	g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area] *(1.0 -solvent); //(1.0 - 0.9*((1.0/height_z)*(uint2double(ks)+1.0)*latice_spacing_z)); 


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



	int toplayers = length_z - 3;

	if(ks == toplayers)
	{ 
		//remove all the solvent!
	
		double phi_C = 1 - ( g_device_phi_A[is+js*length_y+ks*area] +  g_device_phi_B[is+js*length_y+ks*area]);
	
		g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area]/(1-phi_C);
    	g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area]/(1-phi_C);
			
		phi_C = phi_C*(1.0 - evaporation); //0.99995; 
		
		//(1.0 - 0.2*((1.0/height_z)*(uint2double(ks)+1.0))); 
		//phi_C = phi_C*(1.0 - 0.2*(((1.0/height_z)*(uint2double(ks)+1.0)*latice_spacing_z)*((1.0/height_z)*(uint2double(ks)+1.0)*latice_spacing_z)));
    	
		
		//reapply the new solvent
		
		g_device_phi_A[is+js*length_y+ks*area] = g_device_phi_A[is+js*length_y+ks*area] * (1-phi_C);
   		g_device_phi_B[is+js*length_y+ks*area] = g_device_phi_B[is+js*length_y+ks*area] * (1-phi_C);
	}
	
	__syncthreads();
}



__global__ void phi_sum2d(double *g_device_phi_A, double *g_device_phi_B, double *g_device_phisum2d_A,  double *g_device_phisum2d_B)
{

// sdata is a shared variable between threads within the block
	 
	unsigned int is = threadIdx.x;
    unsigned int js = blockIdx.x;
    unsigned int ks = blockIdx.y;
    unsigned int area = length_x *length_y;


	double length_x_double = length_x;


   	unsigned int index1 = is+js*length_y+ks*area;

	__shared__ double sdata1_A[length_x];
	sdata1_A[is] = g_device_phi_A[index1];

	__shared__ double sdata1_B[length_x];
	sdata1_B[is] = g_device_phi_B[index1];
	__syncthreads();


	unsigned int current_length_x = length_x;

	while(current_length_x > 2)
	{
		current_length_x = current_length_x/2; 

		if(is < current_length_x)
		{
			sdata1_A[is] += sdata1_A[is + current_length_x];
			sdata1_B[is] += sdata1_B[is + current_length_x];
		}
		
		__syncthreads();
	}

	if(is == 0)
	{
		sdata1_A[is] += sdata1_A[is + 1];
		sdata1_B[is] += sdata1_B[is + 1];

		g_device_phisum2d_A[js+ks*length_y] = sdata1_A[is]/length_x_double;  
		g_device_phisum2d_B[js+ks*length_y] = sdata1_B[is]/length_x_double;
	}

		__syncthreads();
}




__global__ void phi_sum1d(double *g_device_phisum1d_A, double *g_device_phisum1d_B, double *g_device_phisum2d_A, double *g_device_phisum2d_B, double *g_device_delta_z)
{
   
	// sdata is a shared variable between threads within the block

	unsigned int is = threadIdx.x;
    unsigned int js = blockIdx.x;
//    unsigned int ks = blockIdx.y;
//    unsigned int area = length_x *length_y;

	double length_y_double = length_y;

	unsigned int index1 = is + js*length_y;  //js+ks*length_y;


	__shared__ double sdata2_A[length_y];
	sdata2_A[is] = g_device_phisum2d_A[index1];

	__shared__ double sdata2_B[length_y];
	sdata2_B[is] = g_device_phisum2d_B[index1];
	__syncthreads();


	unsigned int current_length_y = length_y;

	while(current_length_y > 2)
	{
		current_length_y = current_length_y/2; 

		if(is < current_length_y)
		{
			sdata2_A[is] += sdata2_A[is + current_length_y];
			sdata2_B[is] += sdata2_B[is + current_length_y];
		}
		
		__syncthreads();
	}

	if(is == 0)
	{
		sdata2_A[is] += sdata2_A[is + 1];
		sdata2_B[is] += sdata2_B[is + 1];

		g_device_phisum1d_A[js] = sdata2_A[is]/length_y_double;  // check this
		g_device_phisum1d_B[js] = sdata2_B[is]/length_y_double;


		//average amount of solvent in layer is (1-(g_device_phisum1d_A[ks] + g_device_phisum1d_B[ks]))
		// average solvent ranges between 0 and 1 so must be increased (starting solvent % is 0.5 everywhere).


		g_device_delta_z[js] =   1.0*(1.0-(g_device_phisum1d_A[js] + g_device_phisum1d_B[js]));


		// average solvent ranges between 0 and 1 so must be increased (starting solvent % is 0.5 everywhere).
		 		
		// g_device_delta_z[ks] = 1.5;

	}

	__syncthreads();
}



