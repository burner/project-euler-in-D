import std.stdio;
import std.math;

void main() {
	uint prim[4096];
	uint pptr = 0;
	prim[pptr++] =	2;
	prim[pptr++] =	3;
	uint tt = prim[pptr-1];
	ulong sum = 5;
	bool primB = false;
	//outer: while(tt < 100) {
	outer: while(tt < 2_000_000) {
		tt+=2;
		//if(tt % 25000 == 1) writeln(tt);
		foreach(it; prim[0..pptr]) {
			if(tt % it == 0) {
				continue outer;
			}
		}
		for(uint i = prim[pptr-1]; i < sqrt(tt); i+=2) {
			if(tt % i == 0) {
				continue outer;
			}
		}
		
		sum+=tt;
		if(pptr < 4096) {
			prim[pptr++] = tt;
		}
	}
	writeln(sum);
}
