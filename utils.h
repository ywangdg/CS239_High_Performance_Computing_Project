#ifndef UTILS_H
#define UTILS_H

#define ALIVE 1
#define DEAD 0

/********************************************
 * Need at least this many rows and columns *
 ********************************************/
const int MINIMUM_ROWS = 1;
const int MINIMUM_COLUMNS = 1;
const int MINIMUM_TIME_STEPS = 1;

void exit_if(int boolean_expression, char function_name[32], int OUR_RANK);
void pluralize_value_if_needed(int value);
int assert_minimum_value(char which_value[16], int actual_value, int expected_value);



#endif /* UTILS_H */
