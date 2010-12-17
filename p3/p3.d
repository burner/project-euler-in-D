import std.stdio;

void main() {
	auto num = 600851475143;
	auto div = 2;
	while(num > 1) {
		if(num % div == 0) {
			num /= div;
			div--;
		}
		div++;
	}
	writeln(div);
}
