import std.stdio;
 
void main() {
	immutable SIZE = 100;
	int i,j,k,p;
	int res=0;
	bool flag[605];
	bool used[105];
 
	for(i=2;i<105;i++)
		used[i]=false;
 
	for(i=2;i<=SIZE;i++) {
		if(!used[i]) {
			int val=i;
 
			for(j=2;j<=602;j++)
				flag[j]=false;
 
			for(j=2;j<=SIZE;j++) {	
				val*=i;
				if(val>SIZE)
					break;
 
				used[val]=true;
			}
 
			for(k=1;k<j;k++)
				for(p=2;p<=100;p++)
					flag[p*k]=true;
 
			for(j=2;j<=602;j++)
				if(flag[j])
					res++;
		}
	}
	writeln(res);
} 
