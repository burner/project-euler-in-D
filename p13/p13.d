import std.stdio;
import std.file;

int k;
ubyte[10000] fac;

void getSum(string n) {
	uint i = 0;
	uint j = 0;
	//writeln("getSum in ", n);
	foreach_reverse(c;n) {
		fac[i] += cast(ubyte)(c-48);
		//write(fac[i], " ");
		j = i;
		while(fac[j] > 9) {
			fac[j+1] += (fac[j] / 10);
			fac[j] = cast(ubyte)(fac[j] % 10);
			j++;
		}
		i++;
		if(j > k) k++;
	}
	//writeln();
	//print();
	return;
}

void print() {
	int cnt = 0;
	for(int i = k; i >= 0; i--) {
		write(fac[i]);
		cnt++;
		if(cnt > 9) break;
	}
	writeln();
}

void main(string[] args) {
	fac[] = 0;
	k = 0;
	foreach(it; args[1..$]) {
		//writeln(it);
		getSum(it);
		//print();
	}
	print();
}
