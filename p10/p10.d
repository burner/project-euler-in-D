import std.stdio;
import std.container;

void main() {
	Array!(ulong) prim;
	prim.insertBack(2);
	prim.insertBack(3);
	ulong tt = prim.back();
	ulong sum = 5;
	bool primB = false;
	//while(tt < 2_000_000) {
	while(tt < 1_999_999) {
		tt+=2;
		if(tt % 10000 < 2) writeln(tt, " array.size = ", prim.length());
		primB = true;
		foreach(it; prim) {
			if(tt % it == 0) {
				primB = false;
				break;
			}
		}
		if(primB) {
			prim.insertBack(tt);
			sum+=tt;
		}
	}
	writeln(sum);
}
