import std.stdio;

bool prime(int n) {
	if (n == 2) return true;
	if ((n & 1) == 0) return false;
	for (int i = 3; i * i <= n; i += 2) {
		if ((n / i) * i == n) return false;
	}
	return true;
}

int main() {
	int circs = 4;  // 2, 3, 5, 7
	for (int a = 1; a <= 9; a += 2) if (a != 5) {
		int start = a;
		for (int b = start; b <= 9; b += 2) if (b != 5) {
			if (prime(a * 10 + b) && prime(b * 10 + a)) {
				circs += (a != b) ? 2 : 1;
			}
			int start2 = (a == b) ? a : a + 2;
			for (int c = start2; c <= 9; c += 2) if (c != 5) {
				if (prime(a * 100 + b * 10 + c) &&
						prime(b * 100 + c * 10 + a) &&
						prime(c * 100 + a * 10 + b)) {
					circs += (a != c) ? 3 : 1;
				}
				int start3 = (a == b && a == c) ? a : a + 2;
				for (int d = start3; d <= 9; d += 2) if (d != 5) {
					if (prime(a * 1000 + b * 100 + c * 10 + d) &&
							prime(b * 1000 + c * 100 + d * 10 + a) &&
							prime(c * 1000 + d * 100 + a * 10 + b) &&
							prime(d * 1000 + a * 100 + b * 10 + c)) {
						circs += 4;
					}
					int start4 = (a == b && a == c && a == d) ? a : a + 2;
					for (int e = start4; e <= 9; e += 2) if (e != 5) {
						if (prime(a * 10000 + b * 1000 + c * 100 + d * 10 + e) &&
								prime(b * 10000 + c * 1000 + d * 100 + e * 10 + a) &&
								prime(c * 10000 + d * 1000 + e * 100 + a * 10 + b) &&
								prime(d * 10000 + e * 1000 + a * 100 + b * 10 + c) &&
								prime(e * 10000 + a * 1000 + b * 100 + c * 10 + d)) {
							circs += (a != e) ? 5 : 1;
						}
						for (int f = a + 2; f <= 9; f += 2) if (f != 5) {
							if (prime(a * 100000 + b * 10000 + c * 1000 + d * 100 + e * 10 + f) &&
									prime(b * 100000 + c * 10000 + d * 1000 + e * 100 + f * 10 + a) &&
									prime(c * 100000 + d * 10000 + e * 1000 + f * 100 + a * 10 + b) &&
									prime(d * 100000 + e * 10000 + f * 1000 + a * 100 + b * 10 + c) &&
									prime(e * 100000 + f * 10000 + a * 1000 + b * 100 + c * 10 + d) &&
									prime(f * 100000 + a * 10000 + b * 1000 + c * 100 + d * 10 + e)) {
								circs += 6;
							}
						}
					}
				}
			}
		}
	}
	writeln(circs);
	return 0;
}
