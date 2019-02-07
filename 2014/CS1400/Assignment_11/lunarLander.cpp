#include <iostream>
#include "lunarLander.h"
using namespace std;



	
Lander::Lander(){
	G.x=0; 
	G.y = 1.622;// 1.622 m/s^2 on the moon
	double angle=PI/2;  // radians.  0 radians is positive x direction
	// straight up is pi/2 radians
	thrust.x=0; 
	thrust.y = 0;// m/s^2
	velocity.x=0;
	velocity.y = 0;// m/s
	double fuel=100;   //1 unit of fuel equals 1 magnitude of acceleration
	position.x=50;
	position.y = 50;// meters
	double maxTouchdownVelocity=50; //do not exceed at landing
	bool crashed=false;
	bool landed=false;
	double rotatedThisTurn=0;
	double fuelBurnedThisTurn=0;



};
Lander::Lander(Vect iG, double iangle, Vect ivelocity, double ifuel,
	Vect iposition, double imax, bool icrashed, bool ilanded){
	G.x = iG.x;
	G.y = iG.y;
	angle=iangle;  // radians.  0 radians is positive x direction
	// straight up is pi/2 radians
	thrust.x=0;
	thrust.y = 0;// m/s^2
	velocity.x=ivelocity.x;
	velocity.y = ivelocity.y;// m/s
	fuel=ifuel;   //1 unit of fuel equals 1 magnitude of acceleration
	position.x=iposition.x;
	position.y = iposition.y;// meters
	maxTouchdownVelocity=imax; //do not exceed at landing
	crashed=icrashed;
	landed=ilanded;
	rotatedThisTurn=0;
	fuelBurnedThisTurn=0;


}
double Lander::getAngle(){
	return angle;
}
Vect Lander::getVelocity(){
	return velocity;
}
double Lander::getFuel(){
	return fuel;
}
Vect Lander::getPosition(){
	if (position.y < 0)position.y = 0;
	return position;
}
double Lander::getMTV(){
	if (maxTouchdownVelocity < 0)maxTouchdownVelocity=maxTouchdownVelocity*-1;

	return maxTouchdownVelocity;
}
bool Lander::getCrashed(){
	if (landed == true)crashed = false;
	return crashed;
}
bool Lander::getLanded(){
	if (crashed == true)landed = false;
	return landed;
}
void Lander::rotateLeft(double rotateAngle){
	if (rotateAngle < 0)rotateAngle=rotateAngle*-1;
	if (rotateAngle + rotatedThisTurn >= PI / 12)rotatedThisTurn = PI / 12;
	else if (rotateAngle + rotatedThisTurn <= -PI / 12)rotatedThisTurn =-PI/ 12;
	else rotatedThisTurn += rotateAngle;

	

}
	
void Lander::rotateRight(double rotateAngle){
	if (rotateAngle < 0)rotateAngle = rotateAngle*-1;
	if (rotateAngle - rotatedThisTurn <-PI / 12)rotatedThisTurn = -PI / 12;
	else if (rotateAngle - rotatedThisTurn >= PI / 12)rotatedThisTurn = PI / 12;
	else rotatedThisTurn -= rotateAngle;

}
void Lander::burn(double fuelAmount){
	
	if (fuelAmount > 50)fuelAmount = 50;
	if (fuelAmount > fuel)fuelAmount = fuel;
	fuelBurnedThisTurn = fuelAmount;
}
void Lander::timeUpdate(){
	angle += rotatedThisTurn;
	if (angle > (2 * PI))angle =(angle -( 2 * PI));
	if (angle < 0)angle = (angle + (2 * PI));
	thrust.x = cos(angle)*fuelBurnedThisTurn;
	thrust.y = sin(angle)*fuelBurnedThisTurn;

	velocity.x = velocity.x + thrust.x + G.x;
	velocity.y = velocity.y + thrust.y + G.y;

	position.x = position.x + velocity.x;
	position.y = position.y + velocity.y;

	fuel-= fuelBurnedThisTurn;
	if (position.y<=0 && velocity.y >= maxTouchdownVelocity)crashed = true;
	
	if (position.y <= 0 && velocity.y <= maxTouchdownVelocity)landed = true;
	rotatedThisTurn = 0;
	fuelBurnedThisTurn = 0;
}







