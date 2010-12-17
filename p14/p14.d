import std.stdio;

uint func(uint step) {
	if(step == 1) return 1;
	if(step % 2 == 0) {
		return 1+func(step/2);
	} else {
		return 1+func(3*step+1);
	}
}

void main() {
	uint rs, max = 0, tmp;
	for(uint i = 1; i < 1_000_000; i++) {
		tmp = func(i);
		if(tmp > max) {
			max = tmp;
			rs = i;
		}
	}
	writeln(rs);	
}
