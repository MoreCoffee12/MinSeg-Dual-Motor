

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

# include <Arduino.h>
# include <minsegbus.h>
# include "minsegbus.cpp"
MinSegBus mbus;

# endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define y_width 
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
extern "C" void MinSegBus02Float_Outputs_wrapper(const real32_T *float_01,
			const real32_T *float_02,
			const real_T *xD,
			const int8_T  *Address, const int_T  p_width0)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
// Wait until after initialization is done
if( xD[0]==1 )
{
    // Don't do anything for mex file generation
    # ifndef MATLAB_MEX_FILE
    
    unsigned int iBytesReturned;
    unsigned char cBuff[0x400];
    unsigned int iIdx;
    unsigned char iAddress;
    float fValueArray[2];
    
    iBytesReturned = 0;
    iAddress = Address[0];
    fValueArray[0] = float_01[0];
    fValueArray[1] = float_02[0];
    mbus.FloatToByteArray(iAddress, fValueArray, 2, 0x400, &cBuff[0], &iBytesReturned);
    if ( iBytesReturned == 17)
    {
      for( iIdx = 0; iIdx<iBytesReturned; iIdx++)
      {
        Serial.write(cBuff[iIdx]);
      }  
    }
    
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
  * Updates function
  *
  */
extern "C" void MinSegBus02Float_Update_wrapper(const real32_T *float_01,
			const real32_T *float_02,
			real_T *xD,
			const int8_T  *Address,  const int_T  p_width0)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if (xD[0]!=1)
{
    // Don't do anything for the MEX-file generation
    #ifndef MATLAB_MEX_FILE
    Serial.begin(38400);
    #endif
    
    // Initialization done.
    xD[0]=1;
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
