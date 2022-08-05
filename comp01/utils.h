/** @file
*  @brief Header file for a some utilities
*/

#ifndef _UTILS_H
#define _UTILS_H
#include <stdio.h>
#include <stdbool.h>

#define assert(x) while(x);

#define ERROR_LOG(fmt, ...) do{printf("[%s] [ERROR] in :[%s:%d] ",FILE_NAME,__func__,__LINE__);printf(fmt "\n", ##__VA_ARGS__);} while( 0 )
#define INFO_LOG(fmt, ...) do{printf("[%s] :[%s:%d] ",FILE_NAME,__func__,__LINE__);printf(fmt "\n", ##__VA_ARGS__);} while( 0 )
#define WARN_LOG(fmt, ...) do{printf("[%s] [WARN] in :[%s:%d] ",FILE_NAME,__func__,__LINE__);printf(fmt "\n", ##__VA_ARGS__);} while( 0 )

#define INTERPOLATE(x0, y0, x1, y1, xp) y0 + ((y1 - y0) / (x1 - x0)) * (xp - x0)

static bool initGuard (void) {
  static bool retVal = true;
  if(retVal == true)
  {
    retVal = false;
    return true;
  }
  return retVal;
}

#define CHECK_NULL_PTR(X) if(X==NULL){ ERROR_LOG("NULL PTR CATCHED!!!"); assert(true);  }

#endif // _UTILS_H
