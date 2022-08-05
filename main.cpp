#include "Comp_01.h"
#include <iostream>

#include <vector>

#include "main.h"

using namespace std;

#define UT 1

#define fun1 func##UT

int fun1(uint8_t * Buff)
{
    return Buff[2]=1;
}
int sum(const vector<int>& v)
{
    int s = 0;
    for (const int i : v)
        s += i;
    return s;
}
int main (void)
{
    {
        uint8_t temp[70]={0};
        uint8_t *infoBuff;

        infoBuff = temp;
        fun1(infoBuff);
        
        /* Init components */
        Comp_01_init();

        printf("infoBuff=%d \n",infoBuff[2]);
        printf("temp=%d \n",temp[2]);

        printf("hello Semsem :D \n");
    }

    {
        
    }

}