import std.stdio;

void main() {
	int rs = 0;
	/*for(int i = 1; i < 1000; i++) {
		if(i%3 == 0 || i%5 == 0) {
			rs+=i;
			Stdout.formatln("{}", i);
		}
	}*/
	for(int i = 3; i < 1000; i+=3) {
		rs+=i;
	}
	for(int i = 5; i < 1000; i+=5) {
		if(i % 3 != 0)
		rs+=i;
	}
	writeln(rs);
}
