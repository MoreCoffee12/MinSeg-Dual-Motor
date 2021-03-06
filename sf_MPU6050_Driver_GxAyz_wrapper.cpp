

/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
# ifndef MATLAB_MEX_FILE

// Required for I2Cdev library
#define ARDUINO 103  // using wire, and twi from arduino 1.0.3

#include <Arduino.h>
#include "Wire.h"
//#include "gyro.h"
# include "twi.h"
# include "twi.c"
# include "Wire.cpp"
# include "I2Cdev.cpp"
# include "MPU6050.cpp"


# include "I2Cdev.h"
# include "MPU6050.h"


//L3G gyro;
MPU6050 accelgyro;

#endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
 
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
extern "C" void sf_MPU6050_Driver_GxAyz_Outputs_wrapper(int16_T *x_vel,
			int16_T *y_acc,
			int16_T *z_acc,
			const real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This sample sets the output equal to the input
      y0[0] = u0[0]; 
 For complex signals use: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
*/

if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE
       //gyro.read();
       //x_vel[0]=gyro.g.x; // x_vel[0]=1; //debugging
        x_vel[0]=accelgyro.getRotationX();
        y_acc[0]=accelgyro.getAccelerationY();
        z_acc[0]=accelgyro.getAccelerationZ();
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
  * Updates function
  *
  */
extern "C" void sf_MPU6050_Driver_GxAyz_Update_wrapper(const int16_T *x_vel,
			const int16_T *y_acc,
			const int16_T *z_acc,
			real_T *xD)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    # ifndef MATLAB_MEX_FILE     
        Wire.begin();
		accelgyro.setDLPFMode(5);
        accelgyro.initialize();
    #endif
    //done with initialization
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
