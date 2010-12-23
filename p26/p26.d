import std.stdio;
import std.math;

int lengthOfRecurringCycle( int n ) {
	scope int[] quotients = new int[1000];
	scope int[] remainders = new int[1000];

	remainders[0] = 1;
	quotients[0] = 0;

	for(int i=1; i<quotients.length; i++) {
		quotients[i] = remainders[i-1]*10/n;
		remainders[i] = remainders[i-1]*10 - quotients[i]*n;

		for(int j=1; j<i; j++) {
			if( quotients[j] == quotients[i] && 
				remainders[j] == remainders[i] ) {
				return (i-j);
			}
		}
	}
	return -1;
}

void main() {
	int result = 0;		
	int maxLength = 0;
	int length;

	for(int i=1; i<1000; i++) {
		length = lengthOfRecurringCycle(i);

		if(length > maxLength) {
			result = i;
			maxLength = length;
		}
	}
	writeln(result );
}
