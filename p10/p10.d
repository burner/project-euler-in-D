import std.stdio;
import std.math;

void main() {
	//immutable uint max = 9;
	immutable uint max = 1_999_999;
	uint p = 0;
	uint siev[sqrt(max)];
	siev[p++] = 2;
	siev[p++] = 3;
	ulong sum = 5;
	uint tt = 3;
	outer: while(tt < max) {
		tt += 2;
		foreach(it; siev[0..p]) {
			if(tt % it == 0) {
				continue outer;
			}
		}
		sum += tt;
		if(p < siev.length-1) {
			siev[p++] = tt;
		}
	}
	writeln(sum);
}
