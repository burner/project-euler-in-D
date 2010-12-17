import std.stdio;

int i, j, k, n;
int[10000] fac;

void getFac(int n) {
	fac[0] = 1;
	k = 0;
	for(i = 2; i <= n; i++) {
		for(j = 0; j <= k; j++) {
			fac[j] *= i;
		}
		for(j = 0; j <= k; j++) {
			if(fac[j] >= 10) {
				fac[j+1] += (fac[j] - (fac[j] % 10)) / 10;
				fac[j] = fac[j] % 10;
				if(j == k) {
					k++;
				}
			}
		}
	}
	return;
}

void print() {
	for(i = 0; i <=k; i++) {
		write(fac[i]);
	}
	writeln();	
}

int getsum() {
	int sum = 0;
	for(i = 0; i <=k; i++) {
		sum += fac[i];
	}
	return sum;
}

void main() {
	getFac(100);
	int sum = getsum();
	//print();
	writeln(sum);
}
