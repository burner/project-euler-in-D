import std.stdio;
import std.math;

bool isPrime(uint c) {
	writeln("check ",c);
	if(c % 2 == 0) return false;
	for(uint i = 3; i < c/2; i+=2) {
		if(c % i == 0) return false;	
	} 
	return true;
}

void main() {
	int c = 1;
	short d;
	for(d = 999; d > 1; d-=2) {
		if(!isPrime(d)) continue;
		c = 1;
		while( (pow(10, c)-1) % d != 0) {
			c % 10000 == 0 && writeln(c);
			c++;
		}
		if( (d-c) == 1) break;
	}
	writeln(d);
}
