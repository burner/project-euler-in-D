import std.stdio;

void swap(char s[], int a, int b) {
	char t = s[a];
	s[a] = s[b];
	s[b] = t;
}

bool permute(char s[]) {
	int len = s.length;
	int key = len-1;
	int newkey = len-1;
	while((key > 0) && s[key] <= s[key-1])
		key--;

	key--;
	if(key < 0) 
		return false;

	newkey = len-1;
	while((newkey > key) && s[newkey] <= s[key]) {
		newkey--;
	}
	swap(s,key,newkey);
	len--;
	key++;
	while(len > key) {
		swap(s,len,key);
		key++;
		len--;
	}
	return true;
}

void main() {
	long count = 0;
	char s[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
	do {
		count++;
		if(count == 1_000_000) break;
	} while(permute(s));
	writeln(s);
}
