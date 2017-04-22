void initialise()
	// this function creates the grid
{
	srand(time(NULL));
	idum = -rand();
	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			for (k = 0; k < length_z; k++)
			{
				phi_A[i+j*length_y+k*area] = phi_bar;
				//not sure if this is right
				phi_B[i+j*length_y+k*area]=1-phi_A[i+j*length_y+k*area];
			}
		}
	}
}


void addnoise()
	//this function changes each grid point to be either A, B or C (C is defined as not A or B). 
{
	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			for (k = 0; k < length_z; k++)
			{
				phi_A[i+j*length_y+k*area] += (ran2()-0.5)*delta_phi_A;

				// this should mean that phi_A + phi_B = 1
				phi_B[i+j*length_y+k*area]=1-phi_A[i+j*length_y+k*area];
			}
		}
	}
}

// returns the percentage of a or b polymer
double ran2()
{
	int jran;
	long kran;
	static long idum2 = 123456789;
	static long iy = 0;
	static long iv[nr_ntab];
	double temp;
	double temp2;

	if (idum <= 0)   // for negative numbers
	{
		if (-(idum) < 1) idum = 1;   //make them positve
		else idum = -(idum);
		idum2 = (idum);
		for (jran = nr_ntab+7; jran >= 0; jran--)      //loop 32+7 times
		{
			kran = (idum)/nr_iq1;                      // 
			idum = nr_ia1*(idum-kran*nr_iq1)-kran*nr_ir1;
			if (idum < 0) idum += nr_im1;
			if (jran < nr_ntab) iv[jran] = idum;
		}
		iy = iv[0];
	}
	kran = (idum)/nr_iq1;
	idum = nr_ia1*(idum-kran*nr_iq1)-kran*nr_ir1;
	if (idum < 0) idum += nr_im1;
	kran = idum2/nr_iq2;
	idum2 = nr_ia2*(idum2-kran*nr_iq2)-kran*nr_ir2;
	if (idum2 < 0) idum2 += nr_im2;
	jran = iy/nr_ndiv;
	iy = iv[jran]-idum2;
	iv[jran] = idum;
	if (iy < 1) iy += nr_imm1;
	temp = nr_am*iy;
	if (temp > 1-1.2e-7)
	{
		temp2 = 1-1.2e-7;
	}
	else
	{
		temp2 = temp;
	}
	return temp2;
}


void initialise_solvent(){

	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			for (k = 0; k < length_z; k++)
			{

		       // current height in the y = j * latice_spacing_y;
	           //phi_C = function(current height)
	           

				phi_A[i+j*length_y+k*area] = phi_A[i+j*length_y+k*area]*0.5; //(1.-((1./length_y)*j*latice_spacing_y));
				
				phi_B[i+j*length_y+k*area] = phi_B[i+j*length_y+k*area]*0.5; //(1.-((1./length_y)*j*latice_spacing_y));
			}
		}
	}
}
