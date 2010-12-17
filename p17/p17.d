import std.stdio;

uint len(uint n) {
	uint rs = 6;
	uint a = n / 100;
	uint b = (n % 100) / 10;
	uint c = n % 10;
	if(a > 0) {
		rs += 10;
		if(b > 0 || c > 0) rs += 3;
		if(a > 2 && a != 6) rs+=1;
		if(a > 6 && a < 9 || a == 3) rs += 1;
	} 
	if(b == 1) {
		rs += 2;
		if(c == 0) rs -= 5;
		if(c == 7) rs += 1;
		if(c > 0 && c < 3) rs -= 2;
		if(c > 4 && c < 7) rs -= 1;
	} else {
		if(b > 3 && b < 7) rs -= 1;
		if(b == 0) rs -= 6;
		if(b == 7) rs += 1;
		if(c > 0) rs += 3;
		if(c > 6 && c < 9 || c == 3) rs += 1;
		if(c > 2 && c != 6) rs += 1;
	}
	return rs;
}

void main() {
	uint rs = "onethousend".length;
	foreach(it; 1..1000) {
		rs += len(it);
	}
	writeln(rs);	
}
