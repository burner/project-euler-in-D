import std.stdio;
import std.math;

bool procF(uint a, uint b, uint i) {
	bool[10] sb;
	sb[] = false;
	uint n;
	while(i) {
		n = (i % 10);
		if(n == 0) return false;
		if(sb[n]) return false;
		i /= 10;
		sb[n] = true;
	}
	while(a) {
		n = (a % 10);
		if(n == 0) return false;
		if(sb[n]) return false;
		a /= 10;
		sb[n] = true;
	}
	while(b) {
		n = (b % 10);
		if(n == 0) return false;
		if(sb[n]) return false;
		b /= 10;
		sb[n] = true;
	}
	foreach(it; sb[1..$]) if(!it) return false;
	return true;
}

bool isPandigit(const uint nNr) {
	uint nMax = cast(uint)sqrt(nNr)+1;
	for(uint a = 2; a < nMax; a++) {
		uint b = nNr/a;
		if(nNr % a == 0) {
			if(procF(nNr, a, b)) {
				return true;
			}
		}
	}
	return false;
}

void main() {
	uint sum = 0;
	for(uint i = 1; i < 10000; i++) {
		if(isPandigit(i)) {
			sum += i;
		}
	}
	writeln(sum);	
}
