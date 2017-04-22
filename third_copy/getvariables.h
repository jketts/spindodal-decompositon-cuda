
void getvariables()
{

	FILE *inputfile;
	errno_t err = fopen_s(&inputfile,"phasesep3d.txt","r");
	if (!err)
	{
		fscanf_s (inputfile, "%d", &counter_start); // why collect this? we reset it!
		fscanf_s (inputfile, "%d", &countmax);  // the run time 
		fscanf_s (inputfile, "%d", &num_saves);
		fscanf_s (inputfile, "%d", &noisestep);
		fscanf_s (inputfile, "%lf", &delta_x);
		fscanf_s (inputfile, "%lf", &delta_y);
		fscanf_s (inputfile, "%lf", &delta_z);
		fscanf_s (inputfile, "%lf", &delta_t);
		fscanf_s (inputfile, "%lf", &phi_bar);
		fscanf_s (inputfile, "%lf", &deg_polyA);
		fscanf_s (inputfile, "%lf", &deg_polyB);
		fscanf_s (inputfile, "%lf", &deg_polyC);
		fscanf_s (inputfile, "%lf", &kai_AB);
		fscanf_s (inputfile, "%lf", &kai_AC);
		fscanf_s (inputfile, "%lf", &kai_BC);
		fscanf_s (inputfile, "%lf", &chi);
		fscanf_s (inputfile, "%lf", &delta_phi_A);
		fscanf_s (inputfile, "%lf", &delta_phi_B);
		fscanf_s (inputfile, "%lf", &mobility);
		fscanf_s (inputfile, "%lf", &g_upper);
		fscanf_s (inputfile, "%lf", &h_upper);
		fscanf_s (inputfile, "%lf", &g_lower);
		fscanf_s (inputfile, "%lf", &h_lower);
		fscanf_s (inputfile, "%lf", &evaporation);
		fscanf_s (inputfile, "%lf", &solvent);
		
    }

	 // error check

	if(err){
		cout << "ERROR! failed to open inputfile" << endl;
	}
   
	 //scan check

		cout << "counter_start is " << counter_start << endl;
		cout << "countmax is " << countmax << endl;
		cout << "numsaves is " << num_saves << endl;
		cout << "noisestep is " << noisestep << endl;
		cout << "delta_x is " << delta_x << endl;
		cout << "delta_y is " << delta_y << endl;
		cout << "delta_z is " << delta_z << endl;
		cout << "delta_t is " <<  delta_t << endl;
		cout << "phi_bar is " << phi_bar << endl;
		cout << "deg_ployA is " << deg_polyA << endl;
		cout << "deg_polyB is " << deg_polyB << endl;
		cout << "deg_polyC is " << deg_polyB << endl;
		cout << "chi is " << chi << endl;
		cout << "delta_phi_A is " << delta_phi_A << endl;
		cout << "delta_phi_B is " << delta_phi_B << endl;
		cout << "kai_AB is " << kai_AB << endl;
		cout << "kai_AC is " << kai_AC << endl;
		cout << "kai_BC is " << kai_BC << endl;
		cout << "mobility is " << mobility << endl; 
		cout << "g_upper is " << g_upper << endl;
		cout << "h_upper is " << h_upper << endl;
	    cout << "g_lower is " << g_lower << endl;
		cout << "h_lower is " << h_lower << endl;
		cout << "evaporation is " << evaporation << endl;
		cout << "solvent is " << solvent << endl;
     // calculte chi, chi_scale and kappa
	chis = 0.5*((1.0/(deg_polyA*phi_bar))+(1.0/(deg_polyB*(1.0-phi_bar))));
	chi_scale = chi-chis;
	cout << "chis is " << chis << endl;
	
	kappa = 1.0/(18.0);
	
/*
    double qmax = sqrt((chi-chis)/(kappa/(phi_bar*(1.0-phi_bar))));
	double Rqmax = (chi-chis)*(chi-chis)/2.0;
	delta_x = delta_x/qmax;
	delta_t = delta_t/Rqmax;
	
	printf("qmax, delta x : %lf, %lf \n",double(qmax),double(delta_x));
	printf("Rqmax, delta t : %lf, %lf \n",double(Rqmax),double(delta_t));
*/

    fclose(inputfile);

}





