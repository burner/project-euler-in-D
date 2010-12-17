import std.stdio;

bool isLeap(in short year) {
	if(year % 400 == 0) return true;
	else if(year % 100 == 0) return false;
	else if(year % 4 == 0) return true;
	else return false;
}

void main() {
	uint rs = 0;
	ushort year = 1900;
	ushort[] dyPrMnth = [0,31,28,31,30,
		31,30,31,31,
		30,31,30,31];
	ushort wkdy = 1;
	ubyte month = 1;
	for(; year < 2001; year++) {
		for(;month < 13; month++) {
			ushort dysNmbr = dyPrMnth[month];
			if(month == 2 && isLeap(year)) dysNmbr++;
		
			ushort i = 0;
			while(wkdy < 7) {
				i++;
				wkdy++;
			}
			for(;i < dysNmbr; i++) {
				if(year > 1900 && i == 0 && wkdy == 7) {
					rs++;
				}
				wkdy++;
				if(wkdy > 7) wkdy = 1;
			}
		}
		month = 1;
	}
	writeln(rs);
}
