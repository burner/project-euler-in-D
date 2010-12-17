import std.stdio;
import std.file;

int k;
ushort[10000] fac;

void mul() {
	uint j = 0;
	//writeln("getSum in ", n);
	for(uint i = 0; i <= k; i++) {
		fac[i] *= 2;
		//write(fac[i], " ");
	}
	for(; j <= k; j++) {
		fac[j+1] += (fac[j] / 10);
		fac[j] = cast(ushort)(fac[j] % 10);
	}
	if(fac[j] != 0) k++;
	//print();

	//writeln();
	//print();
	return;
}

void print() {
	for(int i = k; i >= 0; i--) {
		write(fac[i]);
	}
	writeln();
}

int sum() {
	int rs = 0;
	for(int i = k; i >= 0; i--) {
		rs += fac[i];
	}
	return rs;
}

void main(string[] args) {
	fac[] = 0;
	fac[0] = 1;
	k = 0;
	for(int i = 0; i < 1000; i++) {
		mul();
	}
	writeln(sum);
}
