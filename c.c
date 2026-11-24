#include<unistd.h>
int length(char*);
int main(){
	char st[] = "Привет Влад как дела?\n";
	write(1, st, length(st));
	return 0;
}
int length(char *tmpst){
	int i = 0;
	while(1){
		if(tmpst[i] == 0) break;
		i++;
	}
	return i;
}
