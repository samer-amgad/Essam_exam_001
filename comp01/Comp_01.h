/** @file
 *  @brief Header file for a Comp_01 driver.
 */
#ifndef HAL_Comp_01_Comp_01_H_
#define HAL_Comp_01_Comp_01_H_

#include <stdint.h>

/** @brief Return type for Comp_01 functions. */
typedef enum {
  Comp_01_RET_OK = 0,  //!< Operation successful
  Comp_01_RET_NOK,  //!< Operation not successful
} Comp_01_return_t;

/** @brief Type for Comp_01 values. */
typedef float Comp_01_value_t;
typedef float Comp_01_percent_t;

/** @brief Initializes the Comp_01 driver.
*  @returns Whether the Initialization was successfully or not.
 */
Comp_01_return_t Comp_01_init(void);

/** @brief Reads the value of the Comp_01 driver.
 *  @param[out] value The read value of Comp_01 angle.
*  @returns Whether the Operation was successfully or not.
 */
Comp_01_return_t Comp_01_getAngle(Comp_01_value_t* value);

/** @brief Reads the value of the Comp_01 driver percentage.
 *  @param[in] maxAngleVal The Max value of Comp_01 angle.
 *  @param[out] percentage The Percentage value of Comp_01 angle read value.
 *  @returns Whether the Operation was successfully or not.
 */
Comp_01_return_t Comp_01_getAnglePercentage(Comp_01_percent_t* percentage, Comp_01_value_t maxAngleVal );

#endif // HAL_Comp_01_Comp_01_H_
