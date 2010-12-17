import std.stdio;

int[2*4096] sum;
int pnt;

int sum_of_divisors(int n){
	int prod=1;
	for(int k=2;k*k<=n;++k){
		int p=1;
		while(n%k==0){
			p=p*k+1;
			n/=k;
		}
		prod*=p;
	}
	if(n>1)
		prod*=1+n;
	return prod;
}
 
void main(){
	for(int i=2;i<=28123;++i)
		if(sum_of_divisors(i)>2*i)
			sum[pnt++] = i;
 
	bool sum_of_abundants[28123*2+1];
	sum_of_abundants[] = false;
 
	for(int i=0;i<pnt;++i)
		for(int j=0;j<=i;++j)
			sum_of_abundants[sum[i]+sum[j]]=true;
 
	int rs=0;
 
	for(int i=1;i<30000;++i)
		if(!sum_of_abundants[i])
			rs+=i;
 
	writeln(rs);
}
