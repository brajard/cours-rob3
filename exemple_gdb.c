#include <stdio.h>
#include <stdlib.h>
#define N 10

int main () {
	int tab[N]={1,3,2,4,5,0,2,12,13,120};
	int count[5];
	int j,i;
	
	for (j=0;i<5;j++) {
		for (i=0;i<N;i++) 
			if (tab[i]%(j)==0) //multiple de j
				count[j]++;
		printf("Nombre d'entiers multiples de %d = %d\n",j,count[j]);
	}
}