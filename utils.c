#include <stdio.h>
#include <stdlib.h>

extern int MINIMUM_ROWS;
extern int MINIMUM_COLUMNS;
extern int MINIMUM_TIME_STEPS;

void exit_if(int boolean_expression, char function_name[32], int OUR_RANK)
{
    if(boolean_expression)
    {
        fprintf(stderr, "Rank %d ", OUR_RANK);
        fprintf(stderr, "ERROR in %s\n", function_name);
        exit(-1);
    }
    return;
}

/*****************************************************
 * Add an "s" to the end of a value's name if needed *
 *****************************************************/
void pluralize_value_if_needed(int value)
{
    if(value != 1)
        fprintf(stderr, "s");

    return;
}

/*******************************************************************************
 * Make sure a value is >= another value, print error and return -1 if it isn't
 ******************************************************************************/
int assert_minimum_value(char which_value[16], int actual_value,
        int expected_value)
{
    int retval;

    if(actual_value < expected_value)
    {
        fprintf(stderr, "ERROR: %d %s", actual_value, which_value);
        pluralize_value_if_needed(actual_value);
        fprintf(stderr, "; need at least %d %s", expected_value, which_value);
        pluralize_value_if_needed(expected_value);
        fprintf(stderr, "\n");
        retval = -1;
    }
    else
        retval = 0;

    return retval;
}
