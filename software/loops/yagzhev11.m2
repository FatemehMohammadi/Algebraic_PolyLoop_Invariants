----number of program variables
n =11
mapping =() ->({{x_1-x_3*x_10^2,x_2-x_3*x_11^2,x_3+x_1*x_11^2-x_2*x_10^2,x_4-x_6*x_10^2,x_5-x_6*x_11^2,x_6+x_4*x_11^2-x_5*x_10^2,x_7-x_9*x_10^2,x_8-x_9*x_11^2,x_9+x_7*x_11^2-x_8*x_10^2, x_10+(x_3*x_5-x_2*x_6)*x_7+(x_1*x_6-x_3*x_4)*x_8+(x_2*x_4-x_1*x_5)*x_9, x_11-x_10^3}})
guard =() -> ({1})
initial= ()->( {random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100)})
