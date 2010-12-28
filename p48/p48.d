import std.stdio;

void main() {
	BigIntBase10 rs = new BigIntBase10(0);
	BigIntBase10 tmp1 = new BigIntBase10(1000);
	BigIntBase10 tmp2 = new BigIntBase10(1000);
	for(ushort i = 1; i < 1000; i++) {
		tmp1 = new BigIntBase10(i);	
		tmp2 = new BigIntBase10(i);	
		for(ushort j = 1; j < i; j++) {
			tmp1 = tmp1 * tmp2;
		}
		rs = rs + tmp1;
		//writefln("tmp1 %12s",tmp1.toString());
		//writefln("rs   %12s",rs.toString());
	}
	writeln(rs.toString()[$-10..$]);
}

class BigIntBase10 {
	private immutable byte NumberBase = 10;
	private immutable short MaxSize = 1280 * 5;


	/// Integer constants
	private static BigIntBase10 Zero;
	private static BigIntBase10 One;

	static this() {
		Zero = new BigIntBase10();
		One = new BigIntBase10(1);
	}

	public short[] digits;
	public ushort size;

	public bool sign;

	private this() {
		this.digits = new short[16];
		this.size = 0;
		this.digits[this.size++] = 0;
		this.sign = false;
	}

	public this(short n) {
		this.digits = new short[16];
		this.sign = false;

		if(n == 0) {
			this.size = 0;
			this.digits[size] = 0;
		} else {
			if(n < 0) {
				n = -n;
				sign = true;
			}

			this.size = 0;
			while(n > 0) {
				this.digits[size] = cast(short)(n % this.NumberBase);
				n /= this.NumberBase;
				this.size++;
			}
		}
	}

	public this(BigIntBase10 n) {
		this.digits = new short[cast(ushort)(n.digits.length*1.0)];
		this.size = 0;
		this.sign = n.sign;

		foreach(it; n.digits[0..n.size]) {
			this.digits[this.size++] = it;
		}
	}

	public bool Equals(BigIntBase10 other) {
		if(this.sign != other.sign)
			return false;
		if(this.size != other.size)
			return false;

		for(ushort i = 0; i < this.size; i++)
			if(this.digits[i] != other.digits[i])
				return false;

		return true;
	}

	public static bool Equals(BigIntBase10 a, BigIntBase10 b) {
		return a.Equals(b);
	}

	public override string toString() {
		string ret;
		if(this.sign) {
			ret ~= '-';
		}
		//for(ushort i = size - 1; i >= 0; i--)
		foreach_reverse(it; this.digits[0..this.size])
			//ret ~= cast(char)(digits[i]+48);
			ret ~= cast(char)(it+48);

		return ret;
	}

	public static BigIntBase10 Opposite(BigIntBase10 n) {
		BigIntBase10 res = new BigIntBase10(n);

		if(res != Zero) {
			if(!res.sign)
				res.sign = true;
			else
				res.sign = false;
		}
		return res;
	}

	public static bool Greater(BigIntBase10 a, BigIntBase10 b) {
		if(a.sign != b.sign) {
			if((!a.sign) && (!b.sign))
				return false;

			if((!a.sign) && (b.sign))
				return true;
		} else {
			if(!a.sign) {
				if(a.size > b.size)
					return true;
				if(a.size < b.size)
					return false;
				for(short i = (a.size) - 1; i >= 0; i--)
					if(a.digits[i] > b.digits[i])
						return true;
					else if(a.digits[i] < b.digits[i])
						return false;
			} else {
				if(a.size < b.size)
					return true;
				if(a.size > b.size)
					return false;
				for(short i = (a.size) - 1; i >= 0; i--)
					if(a.digits[i] < b.digits[i])
						return true;
					else if(a.digits[i] > b.digits[i])
						return false;
			}
		}

		return false;
	}

	public static bool GreaterOrEqual(BigIntBase10 a, BigIntBase10 b) {
		return Greater(a, b) || Equals(a, b);
	}

	public static bool Smaller(BigIntBase10 a, BigIntBase10 b) {
		return !GreaterOrEqual(a, b);
	}

	public static bool SmallerOrEqual(BigIntBase10 a, BigIntBase10 b) {
		return !Greater(a, b);
	}

	public static BigIntBase10 Abs(BigIntBase10 n) {
		BigIntBase10 res = new BigIntBase10(n);
		res.sign = false;
		return res;
	}

	public static BigIntBase10 Addition(BigIntBase10 a, BigIntBase10 b) {
		BigIntBase10 res = null;

		if((!a.sign) && (!b.sign)) {
			if(a >= b)
				res = Add(a, b);
			else
				res = Add(b, a);

			res.sign = false;
		}

		if((a.sign) && (b.sign)) {
			if(a <= b)
				res = Add(-a, -b);
			else
				res = Add(-b, -a);

			res.sign = true;
		}

		if((!a.sign) && (b.sign)) {
			if(a >= (-b)) {
				res = Subtract(a, -b);
				res.sign = false;
			} else {
				res = Subtract(-b, a);
				res.sign = true;
			}
		}

		if((a.sign) && (!b.sign)) {
			if((-a) <= b) {
				res = Subtract(b, -a);
				res.sign = false;
			} else {
				res = Subtract(-a, b);
				res.sign = true;
			}
		}

		return res;
	}

	public static BigIntBase10 Subtraction(BigIntBase10 a, BigIntBase10 b) {
		BigIntBase10 res = null;

		if((!a.sign) && (!b.sign)) {
			if(a >= b) {
				res = Subtract(a, b);
				res.sign = false;
			} else {
				res = Subtract(b, a);
				res.sign = true;
			}
		}

		if((a.sign) && (b.sign)) {
			if(a <= b) {
				res = Subtract(-a, -b);
				res.sign = true;
			} else {
				res = Subtract(-b, -a);
				res.sign = false;
			}
		}

		if((!a.sign) && (b.sign)) {
			if(a >= (-b))
				res = Add(a, -b);
			else
				res = Add(-b, a);

			res.sign = false;
		}

		if((a.sign) && (!b.sign)) {
			if((-a) >= b)
				res = Add(-a, b);
			else
				res = Add(b, -a);

			res.sign = true;
		}

		return res;
	}

	public static BigIntBase10 Multiplication(BigIntBase10 a, BigIntBase10 b) {
		if((a == Zero) || (b == Zero))
			return Zero;

		BigIntBase10 res = Multiply(Abs(a), Abs(b));
		if(a.sign == b.sign)
			res.sign = false;
		else
			res.sign = true;

		return res;
	}


	public BigIntBase10 opOpAssign(string op)(short b) {
		switch(op) {
			case "+=":
				this = Addition(this, new BigIntBase10(b));
				return this;
			case "*=":
				this = Multiplication(this, new BigIntBase10(b));
				return this;
			case "=": {
				BigIntBase10 tmp = new BigIntBase10(b);
				this.digits = tmp.digits;
				this.size = tmp.size;
				this.sign = tmp.sign;
				return this;
			}
		}
	}

	public BigIntBase10 opOpAssign(string op)(BigIntBase10 b) {
		switch(op) {
			case "+=":
				this = Addition(this, b);
				return this;
			case "*=":
				this = Multiplication(this, b);
				return this;
			case "=":
				this.digits = b.digits;
				this.size = b.size;
				this.sign = b.sign;
				return this;
		}
	}

	public BigIntBase10 opUnary(string op)() {
		switch(op) {
			case "-": 
				return Opposite(this);
			case "++": {
				BigIntBase10 res = this + One;
				return res;
			}
			case "--": {
				BigIntBase10 res = this - One;
				return res;
			}
			default:
				writeln(op);
				assert(0);
		}
	}

	public BigIntBase10 opBinary(string op)(BigIntBase10 b) {
		switch(op) {
			case "+":
				return Addition(this, b);
			case "-":
				return Subtraction(this, b);
			case "*":
				return Multiplication(this, b);
			default:
				writeln(op);
				assert(0);
		}
	}

	public BigIntBase10 opBinary(string op)(short b) {
		switch(op) {
			case "+":
				return Addition(this, new BigIntBase10(b));
			case "-":
				return Subtraction(this, new BigIntBase10(b));
			case "*":
				return Multiplication(this, new BigIntBase10(b));
			default:
				writeln(op);
				assert(0);
		}
	}

	public short opCmp(BigIntBase10 a) {
		return 0;
	}

	private static BigIntBase10 Add(BigIntBase10 a, BigIntBase10 b) {
		BigIntBase10 res = new BigIntBase10(a);
		short trans = 0, temp;
		ushort i;

		for(i = 0; i < b.size; i++) {
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			temp = res.digits[i] + b.digits[i] + trans;
			res.digits[i] = cast(short)(temp % NumberBase);
			trans = temp / NumberBase;
		}

		while(trans) {
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			res.digits[i++] = cast(short)(trans % NumberBase);
			trans /= NumberBase;
		}
		res.size = i;

		return res;
	}

	private static BigIntBase10 Subtract(BigIntBase10 a, BigIntBase10 b) {
		BigIntBase10 res = new BigIntBase10(a);
		ushort i;
		short temp, trans = 0;
		bool reducible = true;

		for(i = 0; i < b.size; i++) {
			temp = res.digits[i] - b.digits[i] - trans;
			if(temp < 0) {
				trans = 1;
				temp += NumberBase;
			} else {
				trans = 0;
			}
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			res.digits[i] = cast(short)temp;
		}

		for(i = b.size; ((i < a.size) && (trans > 0)); i++) {
			temp = res.digits[i] - trans;
			if(temp < 0) {
				trans = 1;
				temp += NumberBase;
			} else {
				trans = 0;
			}
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			res.digits[i] = cast(short)temp;
		}

		while ((res.size - 1 > 0) && (reducible == true)) {
			if(res.digits[res.size - 1] == 0)
				res.size--;
			else reducible = false;
		}

		return res;
	}

	private static BigIntBase10 Multiply(BigIntBase10 a, BigIntBase10 b) {
		ushort i, j;
		short temp, trans = 0;

		BigIntBase10 res = new BigIntBase10();
		res.size = a.size + b.size - 1;
		for(i = 0; i < res.size + 1; i++) {
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			res.digits[i] = 0;
		}

		for(i = 0; i < a.size; i++)
			if(a.digits[i] != 0)
				for(j = 0; j < b.size; j++)
					if(b.digits[j] != 0) {
						if(res.digits.length <= (i+j)) {
							res.digits.length = res.digits.length*2;
						}
						res.digits[i + j] += a.digits[i] * b.digits[j];
					}

		for(i = 0; i < res.size; i++) {
			if(res.digits.length == i) {
				res.digits.length = res.digits.length*2;
			}
			temp = res.digits[i] + trans;
			res.digits[i] = cast(short)(temp % NumberBase);
			trans = temp / NumberBase;
		}

		if(trans > 0) {
			if(res.digits.length == res.size) {
				res.digits.length = res.digits.length*2;
			}
			res.digits[res.size] = cast(short)(trans % NumberBase);
			res.size++;
			trans /= NumberBase;
		}

		return res;
	}
	
	public void prshortArray() const {
		foreach(it;this.digits) {
			write(it, " ");
		}
		writeln();
	}
}
