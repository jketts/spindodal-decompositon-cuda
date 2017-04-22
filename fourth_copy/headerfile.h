#include <math.h>
#include "conio.h"
#include <stdio.h>
#include <tchar.h>
#include <iostream>
#include <ctime>
#include <vector>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include <string>
#include <sstream>
using namespace std;

// program variables


//Adjust the lengths of the system here. 

#define length_x 16
#define length_y 16
#define length_z 16

//nothing else in the file should need editting apart for the 3 lines above

unsigned int pbc_x = length_x-1;
unsigned int pbc_y = length_y-1;
unsigned int pbc_z = length_z-1;

unsigned int area = length_x*length_y;
unsigned int volume = area * length_z;   

double PI = 3.14159265;
unsigned int counter;
unsigned int counter_start;
unsigned int countmax;
unsigned int i,j,k,kmax,kmin;
int num_saves, noisestep; string key;	
bool first;

double *phi_A;
double *phi_B;
double *phi_C;
double *phi_z;



double *delta_phi_A_delta_tau;
double *delta_phi_B_delta_tau;
double *delta_phi_C_delta_tau;

const unsigned phi_diffusion_num_threads_x = length_x;
const unsigned phi_diffusion_num_blocks_x = length_y;
const unsigned phi_diffusion_num_blocks_y = length_z;

/*
const unsigned phi_diffusion_num_threads_x = length_x/num_x_blocks;
const unsigned phi_diffusion_num_threads_y = length_y/num_y_blocks;
const unsigned phi_diffusion_num_threads_z = length_z/num_z_blocks;

const unsigned phi_diffusion_num_blocks_x = length_x;
const unsigned phi_diffusion_num_blocks_y = length_y;
const unsigned phi_diffusion_num_blocks_z = length_z;
*/

double *device_phi_A;
double *device_phi_B;
double *device_mu1_A;
double *device_mu2_A;
double *device_mu1_B;
double *device_mu2_B;

double *device_mu1_A_grad_lambda_x;
double *device_mu2_A_grad_lambda_x;
double *device_mu1_B_grad_lambda_x;
double *device_mu2_B_grad_lambda_x;
double *device_mu1_A_grad_lambda_y;
double *device_mu2_A_grad_lambda_y;
double *device_mu1_B_grad_lambda_y;
double *device_mu2_B_grad_lambda_y;
double *device_mu1_A_grad_lambda_z;
double *device_mu2_A_grad_lambda_z;
double *device_mu1_B_grad_lambda_z;
double *device_mu2_B_grad_lambda_z;
double *device_delta_phi_A_delta_tau;
double *device_delta_phi_B_delta_tau;
double *device_delta_phi_C_delta_tau;
double *device_muphisum2d_A;
double *device_muphisum2d_B;
double *device_muphisum1d_A;
double *device_muphisum1d_B;
double *device_deltas;
double *lattice_height;
double *device_lattice_height;
double *array_delta_z;


// material variables
double kappa;
double delta_x;
double delta_y;
double delta_z;
double delta_t;
double deg_polyA;
double deg_polyB;
double deg_polyC;
double chi;
double chis;
double chi_scale;
double mobility;
double phi_bar;
double g_upper;
double h_upper;
double gamma_upper;
double g_lower;
double h_lower;
double gamma_lower;
double phi_min_max;
double evaporation;
double solvent;


double length_y_minus_1 = length_y-1;
double delta_phi_A;
double delta_phi_B;
double latice_spacing_z;
double previous_latice_spacing_z;
double latice_change;
double laplace_phi_A;
double laplace_phi_B;
double kai;
double kai_AB;
double kai_BC;
double kai_AC;
double gamma;
double delta_gamma_AC;
double delta_gamma_BC;
double delta_gamma_AB;
double z;
double z_dash;
double K;
double T;
double b;
double delta_phi_A_delta_x;



// functions
double ran2();
void initialise();
void phi_diffusion_calc();
void getvariables();
void graphplot_binary();
void graphplot_text();
void mu_calc();
void addnoise();
void input_previous_data();
void surf_calculate();
void areaplot_text();
void graphplot_visual();


string IntToString ( int number )
{
  ostringstream oss;

  // Works just like cout
  oss<< number;

  // Return the underlying string
  return oss.str();
}

long idum;   //sets idum as long integer

// numerical recipes random number generator
#define nr_im1 2147483563
#define nr_im2 2147483399
#define nr_am (1.0/nr_im1)
#define nr_imm1 (nr_im1-1)
#define nr_ia1 40014
#define nr_ia2 40692
#define nr_iq1 53668
#define nr_iq2 52774
#define nr_ir1 12211
#define nr_ir2 3791
#define nr_ntab 32
#define nr_ndiv (1+nr_imm1/nr_ntab)


double ran2();
void initialise();
void phi_diffusion_calc();
void getvariables();
void graphplot_binary();
void graphplot_text();
void mu_calc();
void addnoise();
void input_previous_data();
void surf_calculate();
void areaplot_text();
void graphplot_visual();

