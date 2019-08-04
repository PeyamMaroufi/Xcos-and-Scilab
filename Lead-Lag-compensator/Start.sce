//Made by Payam M

//The whole idea with compensation is regulating a input variable to a system in order to get the fulfill the requirement. 
//But you may think "what is the requirements" well you don't know it. But lets say that you want a certain behavouir for a number 
//of frequencies. For instance you want the phase to be positive for some frequencies and negative for some other. that's where
//you need a controller.

//So what is a lead lag compensator. Actually I use the terms compensators and controller in the same manner since they practically
//do the same thing. They both try to get a desire value and get close to a reference value. But what are the differences between 
//these too. They say that for instance a PID controller adds two zeros and one pole to the system while lead lag compensator add
//the exactly same number of poles and zeros to the system.

// One more difference, at least for me is that I use lead lag compensator in laplace  domain while I use normally PID kontroller on
// time domain. Sure you can take the inverser transform of the transfor function of compensator but I normally don't do that. 

////Now assume that we have a system that derivates the input. let say the input is a sin(t) the output is cos(t) .If you plot sin(t)
//and cos(t) you see that the cos curve is 90 degrees before the sin curve so the conclusion is that derivation give a positive phase
//while integration subtract phase. now with this knowledge  we can go one step closer. The formula for lead phase compensator is

//        (omega_p/omega_z)(omega_z + s)/(omega_p +s)

//There are other ways of writing the formula but all are the same but I like this formula because I can see the poles and zeros. as
//you see this adds 1 zero and 1 pole to the system. But in this case we have the omega_z < omega_p hence the "derivating part" which is
//the numenator is closer to the origin and hence it adds phase to the system earlier .

//Assume now that we have a lag phase. The definition for the phase lag compensator is exactly the same

//       (omega_p/omega_z)(omega_z + s)/(omega_p +s)

////But this time:omega_z > omega_p hence  we have a pole closer to the origin and then the subtraction of phase is earler. But sometimes
//we want to subtract the phase and add it in different certain frequencies and that's why we use the combination of these.

// Moreover assume that we have following transfer function 
// G(s)= 250*(s+1)/(s(s+5)*(s+10)^2)

// The requirements are:
// cross over frequency omega_c = 10,
// phase margin 50 degree
// e_0 = 0
// e_1 =< 0.1

// one way to see the bode diagram is according to following. but let's do it in Xcos instead. but just for fun test following inside scilab

s=poly(0,'s');
h = syslin('c',(250*(s+1))/(s*(s+5)*(s+10)^2));
clf();
bode(h, 0.01 ,100, "rad");

//The corrosponding value of tau_D = 1/(10*sqrt(Beta)) that is 0.2. and the increament in phase should at least be 30 degree since the current 
//phase at omega_c = 10 is -160 and the requirement is phase margin 50 degrees. The lead compensation is :

//tau_D s +1/Beta tau_D +1 = 0.2s +1/ 0.05s +1

//Do not worry the formula above is the same as earlier with a little  configuration. We choose a gain as K. We calculate the value of K = 4.5
// the value of K is from the fact that we know that K*tau_D s +1/Beta tau_D +1 *G(s) and the value of G(s) at omega_c is 0.11. then you choose
//the proper K.  there is an other specification that is the static error. for a step reference signal we have that the 

//    e_0 = 1/(1+lim s-> 0 K* (tau_D s +1/Beta tau_D +1)*G(s))
//    e_1 = 1/(lim s->0 s*K* (tau_D s +1/Beta tau_D +1)*G(s))

//The calculated value for lambda is then 0.23. The lag part is then :
    
//    0.7s +1/0.7s +0.23

//The total lead lag becomes:

//F_1 = 4.5 (0.7s +1)/(0.7s + 0.23)*(0.2s +1)/(0.05s +1)


end
