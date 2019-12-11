#include<omp.h>
int main()
{
 #pragma omp parallel
 {
 int ID = 0;
 printf("world(%d)",ID);
 }
}
