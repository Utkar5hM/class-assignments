#include <stdio.h>
#include <stdlib.h>

int main(){
	int x [10] = {-1, -2, 6, 6 , -7, 0, -1, 3, 4, 5};
	int y [10] = {-5, 4, 3, -7, -8, 0, 10, -3, 2, -6};
	// size of x
	int m = sizeof(x)/sizeof(x[0]);
	// size of y
	int n = sizeof(y)/sizeof(y[0]);
	// allocating memory for convolution (m+n-1)
	int* z =(int*)malloc((m+n- 1) * sizeof(int));;
	// initiazializing all values to 0.
	for(int i=0; i<m+n-1; i++) {
		z[i]=0;
	}
	//calculating Convolution
	for(int i=0; i<m+n-1; i++) {
		for(int k=0; k<m;k++){
			if(!(i-k>(m-1) || i-k<0)){
				z[i] += x[k]*y[i-k];
			}
		}
	}
	//deinitialize dynamic memory
	free(z);
	return 0;
}
