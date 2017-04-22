/*
void graphplot_binary()
{
	char phi_name[FILENAME_MAX];

	FILE *fp;
	
	sprintf_s(phi_name, "%s%d%s", "results/phi", counter, ".dat");
	fp = fopen(phi_name,"wb");
	
	fwrite(phi,sizeof(double),volume,fp);
	fclose(fp);

//	FILE *outputfile;
//	errno_t err = fopen_s(&outputfile,phi_name,"w");

//	if (!err)
//	{
//		for (k = 0; k < length; k++)
//		{
//			for (i = 0; i < length; i++)
//			{
//				k = length/2;
//				for (j = 0; j < length; j++)
//				{
//					fprintf_s(outputfile, "%lf%s", phi[i+j*length+k*area], " ");
//				}
//			}
//			fprintf_s(outputfile, "%s\n", " ");
//	}
//	if (!err) fclose(outputfile);
//	}
}

*/


void graphplot_text()
{
	char phi_name[FILENAME_MAX];
	int step;

	if (length_x > 128)
	{
		step = 2;
	}
	else
	{
		step = 1;
	}




	if (counter%1 == 0)  //checking that counter is an integer?
	{
	for (k = 0; k < length_z; k = k+step)
		{
			sprintf_s(phi_name, "%s%d%s%d%s%d%s", "layer_results/phi_counter_start_", counter_start, "_counter_", counter, "_layer_", k/step, ".txt");

			FILE *outputfile;
			fopen_s(&outputfile,phi_name,"w");


			for (i = 0; i < length_x; i = i + step)
			{
				for (j = 0; j < length_y; j = j + step)
				{
					fprintf_s(outputfile, "%lf%s", phi_A[i+j*length_y+k*area], ",");
					fprintf_s(outputfile, "%lf%s", phi_B[i+j*length_y+k*area], ",");
					if(j == length_y_minus_1){
						fprintf_s(outputfile, "\n");
					}
				}
			}
			fclose(outputfile);
		}
	}
	// cout << "finishing graph plot text" << endl;
}



void graphplot_visual()
{
	char phi_name[FILENAME_MAX];
	if (counter%1 == 0)
	{
		k = length_z/2;
		{
			sprintf_s(phi_name, "%s%d%s%d%s%d%s", "visual/phi_counter_start_", counter_start, "_counter_", counter, "_layer_", k, ".txt");
			

			FILE *outputfile1;
			fopen_s(&outputfile1,phi_name,"w");
           
  
			for (i = 0; i < length_x; i++)
			{
				for (j = 0; j < length_y; j++)
				{
					fprintf_s(outputfile1, "%lf%s", phi_A[i+j*length_y+k*area], " ");
					fprintf_s(outputfile1, "%lf%s", phi_B[i+j*length_y+k*area], " ");	
					if(j == length_y_minus_1){
						fprintf_s(outputfile1, "\n");
					}
				}
			}
		
			fclose(outputfile1);
			
		}
	}
// 	cout << "file from graphplot visual closed" << endl;
}

void surf_calculate()
{
	for (k = 0; k < length_z; k++)
	{
		phi_z[k] = 0.0;
		for (i = 0; i < length_x; i++)
		{
			for (j = 0; j < length_y; j++)
			{
				phi_z[k] = phi_z[k]+phi_A[i+j*length_y+k*area]/double(area);
				phi_z[k] = phi_z[k]+phi_B[i+j*length_y+k*area]/double(area);
			}
		}
	}
	
	double phi_z_max = 0.0;
	double phi_z_min = 1.0;
	kmax = 0;
	kmin = 0;
	double phi_A_low_area = 0.0;
    double phi_A_min_max = 0.0;

	double phi_B_low_area = 0.0;
	double phi_B_min_max = 0.0;
	
	for (k = 0; k < length_z; k++)
	{
		if (phi_z[k] > phi_z_max) 
		{
			phi_z_max = phi_z[k];
			kmax = k;
		}
		if (phi_z[k] < phi_z_min) 
		{
			phi_z_min = phi_z[k];
			kmin = k;
		}
	}
	
	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			if (phi_A[i+j*length_y+kmax*area] < 0.5)
			phi_A_low_area += 1.0/double(area);
			phi_A_min_max += phi_A[i+j*length_y+kmax*area]*phi_A[i+j*length_y+kmin*area];

			if (phi_A[i+j*length_y+kmax*area] < 0.5)
			phi_B_low_area += 1.0/double(area);
			phi_B_min_max += phi_A[i+j*length_y+kmax*area]*phi_A[i+j*length_y+kmin*area];
		}
	}


	string phizmax_name;
	string phizmin_name;
	string phizdif_name;
	
	ofstream phizmax_output;
	ofstream phizmin_output;
	ofstream phizdif_output;
	if (first)
	{
		first = false;
		phizmax_name = "results/phizmax_" + IntToString(counter_start) + ".txt";
		phizmin_name = "results/phizmin_" + IntToString(counter_start) + ".txt";
		phizdif_name = "results/phizdif_" + IntToString(counter_start) + ".txt";
		phizmax_output.open(phizmax_name.c_str());
		phizmin_output.open(phizmin_name.c_str());
		phizdif_output.open(phizdif_name.c_str());
	}
	else
	{
		phizmax_name = "results/phizmax_" + IntToString(counter_start) + ".txt";
		phizmin_name = "results/phizmin_" + IntToString(counter_start) + ".txt";
		phizdif_name = "results/phizdif_" + IntToString(counter_start) + ".txt";
		phizmax_output.open(phizmax_name.c_str(), ios::app);
		phizmin_output.open(phizmin_name.c_str(), ios::app);
		phizdif_output.open(phizdif_name.c_str(), ios::app);
	}

	phizmax_output << " " << double(counter*num_saves)*delta_t << " " << phi_z_max << " " << phi_A_low_area << endl;
	phizmax_output << " " << double(counter*num_saves)*delta_t << " " << phi_z_max << " " << phi_B_low_area << endl;
	phizmin_output << " " << double(counter*num_saves)*delta_t << " " << phi_z_min << endl;
	phizdif_output << " " << double(counter*num_saves)*delta_t << " " << kmin << " " << kmax << " " << phi_min_max << endl;
	phizmax_output.close();
	phizmin_output.close();
	phizdif_output.close();
	
	areaplot_text();
}

void areaplot_text()
{
	char phi_name[FILENAME_MAX];

	sprintf_s(phi_name, "%s%d%s%d%s", "results/phi_maxarea_start", counter_start, "_run", counter, ".txt");

	FILE *outputfile;
	fopen_s(&outputfile,phi_name,"w");
	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			fprintf_s(outputfile, "%lf%s", phi_A[i+j*length_y+kmax*area], " ");
			fprintf_s(outputfile, "%lf%s", phi_B[i+j*length_y+kmax*area], " ");
		}
	}
	fclose(outputfile);
	
	sprintf_s(phi_name, "%s%d%s%d%s", "results/phi_minarea_start", counter_start, "_run", counter, ".txt");

	fopen_s(&outputfile,phi_name,"w");
	for (i = 0; i < length_x; i++)
	{
		for (j = 0; j < length_y; j++)
		{
			fprintf_s(outputfile, "%lf%s", phi_A[i+j*length_y+kmin*area], " ");
			fprintf_s(outputfile, "%lf%s", phi_B[i+j*length_y+kmin*area], " ");
		}
	}
	fclose(outputfile);
}


void input_previous_data()
{
	char phi_name[FILENAME_MAX];
	double phi_A_read;
	double phi_B_read;

	for (k = 0; k < length_z; k++)
	{
		sprintf_s(phi_name, "%s%d%s%d%s", "resultsnosurf/phi", counter_start, "layer", k, ".txt");

		FILE *inputfile;
		fopen_s(&inputfile,phi_name,"r");
		for (i = 0; i < length_x; i++)
		{
			for (j = 0; j < length_y; j++)
			{
				fscanf_s(inputfile, "%lf", &phi_A_read);
				phi_A[i+j*length_y+k*area] = phi_A_read;

				fscanf_s(inputfile, "%lf", &phi_B_read);
				phi_B[i+j*length_y+k*area] = phi_B_read;
			}
		}
		fclose(inputfile);
	}
}



void store_data()
{ 
	
	char phi_name[FILENAME_MAX];
	
	
	sprintf_s(phi_name, "%s%d%s%d%s", "results/phi_counter_start_", counter_start, "_counter_", counter, ".txt");
	
	
	FILE *outputfile;
	fopen_s(&outputfile,phi_name,"w");

	
	for (i = 0; i < length_x; i++)
		{ 
			for (j = 0; j < length_y; j++)
			{
				for (k = 0; k < length_z; k++)
				{   
					
					phi_C[i+j*length_y+k*area] = 1.0-(phi_A[i+j*length_y+k*area] + phi_B[i+j*length_y+k*area] );

					fprintf_s(outputfile, "%d,%d,%d,%10.14lf,%10.14lf,%10.14lf \n", i, j, k, phi_A[i+j*length_y+k*area], phi_B[i+j*length_y+k*area], phi_C[i+j*length_y+k*area]);
				   
					
				}
			}
		
		}


	fclose(outputfile);

   //  cout << "finishing a data store" << endl;
}


void check_data()
{ 
	
	double phi_A_total = 0;
	double phi_B_total = 0;
	double phi_C_total = 0;
	
	for (i = 0; i < length_x; i++)
		{ 
			for (j = 0; j < length_y; j++)
			{
				for (k = 0; k < length_z; k++)
				{   
					
					 phi_A_total  += phi_A[i+j*length_y+k*area]; 
					 phi_B_total  += phi_B[i+j*length_y+k*area]; 					 					
					 phi_C_total  += phi_C[i+j*length_y+k*area]; 					 					
				}
			}
		}

	printf("phi_A total is %10.14lf\n", phi_A_total/double(volume));	
	printf("phi_B total is %10.14lf\n", phi_B_total/double(volume));	
	printf("phi_C total is %10.14lf\n", phi_C_total/double(volume));

}


void store_minimum_data()
{ 
	
	char phi_name[FILENAME_MAX];
	
	
	sprintf_s(phi_name, "%s%d%s%d%s", "mimimum_data/phi_counter_start_", counter_start, "_counter_", counter, ".txt");
	
	
	FILE *outputfile;
	fopen_s(&outputfile,phi_name,"w");

	fprintf_s(outputfile, "%d,%d,%d \n", length_x, length_y, length_z);
	
	for (i = 0; i < length_x; i++)
		{ 
			for (j = 0; j < length_y; j++)
			{
				for (k = 0; k < length_z; k++)
				{   
					
					fprintf_s(outputfile, "%lf,%lf \n", phi_A[i+j*length_y+k*area], phi_B[i+j*length_y+k*area]);
				   
					
				}
			}
		
		}


	fclose(outputfile);

   //  cout << "finishing a data store" << endl;
}

void store_deltas()
{ 
	
	char phi_name[FILENAME_MAX];
	
	
	sprintf_s(phi_name, "%s%d%s%d%s", "results/phi_counter_start_", counter_start, "_counter_", counter, "_deltas.txt");
	
	
	FILE *outputfile;
	fopen_s(&outputfile,phi_name,"w");

	
	for (i = 0; i < length_x; i++)
		{ 
			for (j = 0; j < length_y; j++)
			{
				for (k = 0; k < length_z; k++)
				{   
					
					delta_phi_C_delta_tau[i+j*length_y+k*area] = -(delta_phi_A_delta_tau[i+j*length_y+k*area] + delta_phi_B_delta_tau[i+j*length_y+k*area] );

					fprintf_s(outputfile, "%d,%d,%d,%10.14lf,%10.14lf,%10.14lf \n", i, j, k, delta_phi_A_delta_tau[i+j*length_y+k*area], delta_phi_B_delta_tau[i+j*length_y+k*area], delta_phi_C_delta_tau[i+j*length_y+k*area]);
				   
					
				}
			}
		
		}


	fclose(outputfile);

   //  cout << "finishing a data store" << endl;
}

void print_values_z()
{
 for (k = 0; k < length_z; k++){
	 cout << array_delta_z[k] << endl;
 }
}


	