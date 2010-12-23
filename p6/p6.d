import std.stdio;
import std.math;

void main() {
	ulong susq = 0;
	ulong sqnsu = 0;
	ulong sqnrs;
	ulong rs = 0;

	for(uint i = 1; i < 101; i++) {
		susq += i ^^ 2;
		sqnsu += i;
		rs = (sqnsu ^^ 2) - susq;
	}
	writeln(rs);
}
