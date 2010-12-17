import std.stdio;
import std.math;

ulong factors(ulong toFa) {
	ulong fac = 0;
	ulong div = 1;
	while(div <= sqrt(toFa)) {
		if(!(toFa % div)) {
			fac+=2;
		}
		div+=1;
	}
	return fac;
}

ulong cur = 0;
ulong pos = 1;

ulong triNum() {
	cur+=pos;
	pos++;
	return cur;
}

void main() {
	ulong fac;
	ulong tri;
	while(true) {
		tri = triNum();
		fac = factors(tri);
		if(fac > 500) {
			writeln(tri);
			return;
		}
	}
}
