import std.stdio;

void main() {
	outer: for(uint a = 1; a < 1000; a++) {
		for(uint b = a; b < 1000; b++) {
			for(uint c = b; c < 1000; c++) {
				if(a+b+c != 1000) continue;
				if((a^^2) + (b^^2) != (c^^2)) continue;
				writeln(a*b*c);
				break outer;
			}
		}
	}
}
