/** @file
 *  @brief Source file for a ADC driver.
 */

#include "Comp_01.h"
#include "utils.h"
#include <stdbool.h>

#define FILE_NAME "Comp_01"

Comp_01_return_t Comp_01_init(void) {
  Comp_01_return_t retVal = Comp_01_RET_NOK;
  if (initGuard()) {
    INFO_LOG("Initializing Comp_01 Driver");
  }

  return retVal;
}

Comp_01_return_t Comp_01_getAngle(Comp_01_value_t *value) {

  Comp_01_value_t tmpAngleValue = 0.0f;
  Comp_01_return_t return_value = Comp_01_RET_NOK;

  CHECK_NULL_PTR((void *)value);

  *value = tmpAngleValue;

  INFO_LOG("Comp_01_getAngle :angle = %f , return_value = %d ", *value,
           return_value);

  return return_value;
}
Comp_01_return_t Comp_01_getAnglePercentage(Comp_01_percent_t *percentage,
                                        Comp_01_value_t maxAngleVal) {
  Comp_01_return_t retVal = Comp_01_RET_NOK;
  *percentage = 0.0f;
  return retVal;
}
