----number of program variables
n =9
mapping =() ->({{x_1+x_1*x_7*x_9+x_9^2*x_2,x_2-x_1*x_7^2-x_2*x_7*x_9, x_3+x_3*x_7*x_9+x_4*x_9^2, x_4-x_3*x_7^2-x_4*x_7*x_9, x_5+x_5*x_7*x_9+x_6*x_9^2,x_6 - x_5*x_7^2-x_6*x_7*x_9, x_7+(x_1*x_4-x_2*x_3)*x_9, x_8 +(x_3*x_6-x_4*x_5)*x_9,x_9 + (x_1*x_4-x_2*x_3)*x_8-(x_3*x_6+x_4*x_5)*x_7}})
guard =() -> ({1})
initial= ()->( {random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100),random(-100,100)})
