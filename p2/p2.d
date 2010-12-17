import std.stdio;

void main() {
	int rs = 0;
	int a = 1;
	int b = 2;
	bool toggle = true;
	//int range = 40;
	int range = 4000000;
	while(a + b < range) {
		if(toggle) {
			a = a+b;
			rs += a % 2 == 0 && a<range ? a : 0;
			toggle = !toggle;
		} else {
			b = a+b; 
			rs += b % 2 == 0 && b<range ? b : 0;
			toggle = !toggle;
		}
	}
	writeln(rs+2);
}
