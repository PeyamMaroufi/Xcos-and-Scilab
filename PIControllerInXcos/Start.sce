// Made by Payam M
// Mars 2018
// basic automatic control
// PI Controller


// Supose we want to make a cruise control of simple kind
// The equation motion for a car in x direction is 
// v'(t) = 1/mF(t)-gsin(theta(t))- b/mv(t)
// v'(t) acceleration
// m mass
// F(t) traction force
// g gravitation force
// theta in inclination angle
// v velocity
// b a constant 
// bv is resistance. This for simplicity

// The Error is defined as
// e(t) = r(t)-v(t)
// This Error shows the difference between the actual velocity
// and the reference value. eg the value we want the car to have

// Pi controller designed is 
// F(t) = K_p e(t)+ K_I  integral _0 ^t e(s) ds

// Why PI controller on F? The reason is F(t)is the only variable
// that can be regulated in order to control the velocity. F(t) is the
// gas pedal in your car. which is the control input.

// Lets assume following values
// m = 1000
// b = 100
// g = 9.81
// theta = constant = 10 degrees converted to rad

// The structure will be something like this:

// Reference value ---> PI Controller ---> Dynamics ---> output
//  ^                                                     |
//  |                                                     |
//  |-----------------------Measure-----------------------|
//
// Simulation final integration time = 100 in Xcos setup
//  Refresh period 100 in the graph scope
