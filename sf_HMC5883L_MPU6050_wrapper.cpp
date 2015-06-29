/*
  *
  *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: 3.0 ---
  *
  *   This file is a wrapper S-function produced by the S-Function
  *   Builder which only recognizes certain fields.  Changes made
  *   outside these fields will be lost the next time the block is
  *   used to load, edit, and resave this file. This file will be overwritten
  *   by the S-function Builder block. If you want to edit this file by hand, 
  *   you must change it only in the area defined as:  
  *
  *        %%%-SFUNWIZ_wrapper_XXXXX_Changes_BEGIN 
  *            Your Changes go here
  *        %%%-SFUNWIZ_wrapper_XXXXXX_Changes_END
  *
  *   For better compatibility with the Simulink Coder, the
  *   "wrapper" S-function technique is used.  This is discussed
  *   in the Simulink Coder User's Manual in the Chapter titled,
  *   "Wrapper S-functions".
  *
  *   Created: Wed Jun 12 18:08:59 2013
  */


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
#include "HMC58X3.h"
#include "twi.h"
#include "twi.c"
#include "Wire.cpp"
#include "HMC58X3.cpp"
#include "I2Cdev.cpp"
#include "MPU6050.cpp"
#include "I2Cdev.h"
#include "MPU6050.h"

MPU6050 accelgyro;
HMC58X3 magn;
int ix,iy,iz;

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
extern "C" void sf_HMC5883L_MPU6050_Outputs_wrapper(int16_T *x_mag,
                          int16_T *y_mag,
                          int16_T *z_mag,
                          int16_T *x_vel,
                          int16_T *y_vel,
                          int16_T *z_vel,
                          int16_T *x_acc,
                          int16_T *y_acc,
                          int16_T *z_acc,
                          const real_T  *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE
        magn.getRaw(&ix,&iy,&iz);
        x_mag[0]=ix;
        y_mag[0]=iy;
        z_mag[0]=iz;
		x_vel[0]=accelgyro.getRotationX();
        y_vel[0]=accelgyro.getRotationY();
        z_vel[0]=accelgyro.getRotationZ();
        x_acc[0]=accelgyro.getAccelerationX();
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
extern "C" void sf_HMC5883L_MPU6050_Update_wrapper(const int16_T *x_mag,
                          const int16_T *y_mag,
                          const int16_T *z_mag,
                          const int16_T *x_vel,
                          const int16_T *y_vel,
                          const int16_T *z_vel,
                          const int16_T *x_acc,
                          const int16_T *y_acc,
                          const int16_T *z_acc,
                          real_T *xD)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    # ifndef MATLAB_MEX_FILE     
        Wire.begin();
		accelgyro.initialize();
        magn.init(1);
    #endif
    //done with initialization
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
