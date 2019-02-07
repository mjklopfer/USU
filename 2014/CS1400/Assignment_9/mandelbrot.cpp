#include <iostream>
#include <fstream>

using namespace std;

const int ROWS = 512;
const int COLS = 512;
const int INTENSITY = 255;
const int ITERS = 256;



struct Complex {
	float real;
	float imag;
};

struct point{
	float x;
	float y;
};

struct color{
	int r;
	int g;
	int b;
};



Complex Add(Complex c1, Complex c2){
	Complex c3;
	c3.real = c1.real + c2.real;
	c3.imag = c1.imag + c2.imag;
	return c3;
}

Complex Multiply(Complex c1, Complex c2){
	Complex c3;
	c3.real = c1.real*c2.real - c1.imag*c2.imag;
	c3.imag = c1.real*c2.imag + c1.imag*c2.real;
	return c3;
}

float Real(int j, Complex c1, Complex c2){
	float real;
	float increment;
	increment = (c2.real - c1.real) / COLS;
	real = c1.real + j*increment;
	return real;
}

float Imag(int i, Complex c1, Complex c2){
	float imag;
	float increment;
	increment = (c2.imag - c1.imag) / ROWS;
	imag = c1.imag + i*increment;
	return imag;
}

Complex getComplex(int i, int j, Complex c1, Complex c2){
	Complex c;
	c.real = Real(j, c1, c2);
	c.imag = Imag(i, c1, c2);
	return c;
}

float getx(int j, point p1, point p2){
	float x;
	float increment;
	increment = (p2.x - p1.x) / COLS;
	x = p1.x + j*increment;
	return x;
}

float gety(int i, point p1, point p2){
	float y;
	float increment;
	increment = (p2.y - p1.y) / ROWS;
	y = p1.y + i*increment;
	return y;
}

point Point(int i, int j, point p1, point p2){
	point p;
	p.x = getx(j, p1, p2);
	p.y = gety(i, p1, p2);
	return p;
}

color ColorScheme(int i){
	color c;
	i %= 256;
	
	
	c.r = i % 140;
	c.g = i % 30;
	c.b = i % 220*ITERS/10;
	return c;
}


int getMandelbrotIters(Complex c){
	int i = 0;
	Complex z;
	z = c;
	while ((z.real*z.real + z.imag*z.imag) <= 4 && i<ITERS){
		
		z = Multiply(z, z);
		z = Add(z, c);
		i++;
	}
	return i;
}

void printColor(color pc, ofstream &fout){
	fout << pc.r << " ";
	fout << pc.g << " ";
	fout << pc.b << " ";
}


int main(){
	double c1real;
	double c1imag;
	double c2real;
	double c2imag;
	ifstream fin;
	fin.open("mandelinput.txt");
	fin >> c1real;
	fin >> c1imag;
	fin >> c2real;
	fin.close();
	c2imag = c1imag + (c1real-c2real);
	
	ofstream fout;
	fout.open("mandeloutput.ppm");

	Complex c1, c2, c;
	int index;
	color pc;

	c1.real = c1real;
	c1.imag = c1imag;
	c2.real = c2real;
	c2.imag = c2imag;

	
	fout << "P3 ";
	fout << COLS << " ";
	fout << ROWS << " ";
	fout << INTENSITY << " ";
	fout << "\n";

	// pixels
	for (int i = 0; i<ROWS; ++i){
		for (int j = 0; j<COLS; ++j){
			//find points
			c = getComplex(i, j, c1, c2);

			//value for cplx
			index = getMandelbrotIters(c);

			//find color value
			pc = ColorScheme(index);

			//output color value
			printColor(pc, fout);
		}
	}
	
	return 0;
}