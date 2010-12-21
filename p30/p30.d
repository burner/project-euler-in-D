import std.stdio;
import std.math;

void main() {
	uint[20000] powers;
	uint pptr = 0;
	uint total;
	uint i;
	for(uint it = 2; it < 354294; it++) {
		i = it;
		total = 0;
		while(i) {
			total += pow( (i % 10), 5);
			i /= 10;
		}
		if(total == it) 
			powers[pptr++] = it;
	}

	ulong gtotal = 0;
	for(i = 0; i < pptr; i++) {
		gtotal += powers[i];
	}
	writeln(gtotal);
}
