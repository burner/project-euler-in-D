import std.stdio;

int[10000] sum;

int divSum(int n) {
	if(n < sum.length && sum[n] != -1) return sum[n];
	int rs = 0;
	for(int i = 1; i <= n/2; i++) {
		if(n % i == 0) {
			rs += i;
		}
	}
	if(n < sum.length) sum[n] = rs;
	return rs;
}

void main() {
	sum[] = -1;
	int a, b;
	int rs = 0;
	for(int i = 2; i < 10000; i++) {
		a = divSum(i);
		b = divSum(a);
		if(i == b && i != a) {
			//writeln(i, " ", a);
			rs += i;
		}
	}
	writeln(rs);
}
