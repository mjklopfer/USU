/* 
 * CS:APP Data Lab 
 * 
 * <Nathan Tipton A01207112>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.0
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2012 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* We do support the IEC 559 math functionality, real and complex.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* 
 * bitAnd - x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 */
int bitAnd(int x, int y) {
       /*Use DeMorgans Law on x&y to obtain ~(~x|~y)
	*/
       
       return ~((~x)|(~y));
}
/* 
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int getByte(int x, int n) {
/*Shift n right by 3. This multiplies n by 8 without using * to get desired bit amount
shift to the right by 8*n to put desired byte as the least significant.
And with mask of 0xff to eliminate undesired bytes
 */
  return (x>>(n<<3))&0xFF;
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
  /*Shift x right aritmetically n.
    Create mask by shifting 0x1 to the MSB and then back right arithmetically
    n bits. Shift back 1 to pick up bit and and with your shifted x.

   */
  return (x>>n)&~(((0x1<<31)>>n)<<1);
}
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
 /*Break up into 4 segments, 8 bits, byte at a time.
   Use mask to look at lsb of each byte.
   Add to count
   Shift x to move through each byte a bit at a time, updating count with each
iteration.
Use 0xFF mask to take final count from each byte, shifting each byte over as you go, adding to get final count


 */
    int count = 0;
    int mask = 0x1 | (0x1 << 8) | (0x1 << 16) | (0x1 << 24);
    count = count+ (x & mask);
    count = count+ ((x >> 1) & mask);
    count = count+ ((x >> 2) & mask);
    count = count+ ((x >> 3) & mask);
    count = count+ ((x >> 4) & mask);
    count = count+ ((x >> 5) & mask);
    count = count+ ((x >> 6) & mask);
    count = count+ ((x >> 7) & mask);
    return (count & 0xFF) + ((count >> 8) & 0xFF) + ((count >> 16) & 0xFF) + ((count >> 24) & 0xFF);

  
 
  
}
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  /* negative value of x
 int negx=~x+1;
 if x does not equal zero, then the msb of x or -x will be 1
 XOR x or -x with 0x01 to flip output
 */
	int negx = ~x + 1;
	return ((((x>>31)&0x01)|((negx>>31)&0x01))^0x01);
}
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  // binary value of 1 shifted to the left 31 times gives 1000 0000 0000 0000 0000 0000 0000 0000 which is the smallest 32-bit
  // two's complement integer 
  return (0x1<<31);
}
/* 
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
  /*Shift x to the left 31- desired length n.
Shift back to the left the amount previously shifted right
Check if the resulting number is the same as the x we started with.
If they are the same x fits in n-bits.
   */
  int shift=33+~n;
  return!(((x<<shift)>>shift)^x);
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
  /*Check if number is negative using a mask to get the sign bit
  Check if shifting X requires us to add 1.
  If both conditions are met add one to the result of shifting x to the right n times

   */
	int isneg = ((x >> 31) & 0x1);
  int mask=(~(1<<31))>>(31+(~n+1));
  
  return (x >> n) + ((!(!(x&mask)))&(isneg));
}
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  int neg=~x;
  neg=neg+1;
  return neg;
}
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
  // 1 = positive
  // 0 = negative
  // x&(1<<31) gets sign bit
  // !x checks if x is zero
  
  return!((x&(1<<31))|!x);
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
 
	int x_neg = ~x + 1;//negate x
	int add = x_neg + y; //negative if x > yb
	int sign = add>> 31 & 1; //shifts sign bit to the right

									
	//check for extreme values
	int mask = 1 << 31;
	int x_left = mask & x;
	int y_left = mask & y;
	int check = x_left ^ y_left;
	check = (check >> 31) & 1;

	return (check & (x_left >> 31)) | (!sign & !check);
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
  /*calculate log base 2 of x using the position of most significant high bit
divide and conquer
   */
  int position=0;

  int sigpos = (!(!(x >> 16))) << 31;
	sigpos=sigpos>>31;// if most sig is in right, false, if left 16 true, create mask;
    position = position + (sigpos & 16);
    x = x>>(sigpos & 16); //shift 16 if 1 is on left side, 


	sigpos = (!(!(x >> 8))) << 31;
	sigpos = sigpos >> 31;   //check position and create mask
    position = position + (sigpos & 8);
    x = x>> (sigpos & 8);

	sigpos = (!(!(x >> 4))) << 31;
	sigpos = sigpos >> 31;   //check position and create mask
    position = position + (sigpos & 4);
    x = x>> (sigpos & 4);

	sigpos = (!(!(x >> 2))) << 31;
	sigpos = sigpos >> 31;   //check position and create mask
    position = position + (sigpos & 2);
    x = x>> (sigpos & 2);

	sigpos = (!(!(x >> 1))) << 31;
	sigpos = sigpos >> 31;   //check position and create mask
    position = position + (sigpos & 1);

  return position;
}
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
	
	unsigned exp = (uf >> 23) & 0xFF;  //get exponential part of the number
	unsigned mantissa = (uf << 9);  //get mantissa part of the number
	if ((exp == 0xFF) && (mantissa) != 0)
	{
		return uf; //NaN return uf
	}

	return uf ^ (1 << 31);  //sign change
}
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  return 2;
}
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  return 2;
}
