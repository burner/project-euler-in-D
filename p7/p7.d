import std.stdio;
import std.container;

void main() {
	Array!(ulong) prim;
	prim.insertBack(2);
	prim.insertBack(3);
	ulong tt = prim.back();
	bool primB = false;
	while(prim.length() < 10001) {
		tt+=2;
		//writeln(prim.length());
		//writeln(tt);
		primB = true;
		foreach(it; prim) {
			if(tt % it == 0) {
				primB = false;
				break;
			}
		}
		if(primB) {
			prim.insertBack(tt);
		}
	}
	writeln(prim.back());
}
