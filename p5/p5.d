import std.stdio;

immutable uint di[] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
	17, 18, 19, 20];

bool test(in ulong tt) {
	foreach(it; di[9..$]) {
		if(tt % it != 0) return false;
	}
	return true;
}

void main() {
	ulong it = 2520;
	while(true) {
		if(test(it)) {
			break;
		}
		it+=2520;
	}
	writeln("found ",it);
}
