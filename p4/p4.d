import std.stdio;
import std.conv;

pure bool isPalindrom(in string tt) {
	for(uint i = 0; i < tt.length/2; i++) {
		if(tt[i] != tt[tt.length-1-i]) return false;
	}
	return true;
}

void main() {
	uint max = 0;
	uint rs;
	string tmp;
	for(uint i = 999; i > 100; i--) {
		for(uint j = 999; j > 100; j--) {
			rs = i*j;	
			tmp = to!(string)(rs);
			if(rs > max && isPalindrom(tmp)) {
				//writeln(i, " ", j, " ", tmp);
				max = rs;
			}	
		}
	}
	writeln(max);
	return;
}
