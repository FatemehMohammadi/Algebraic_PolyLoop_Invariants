----number of program variables
n =4
mapping =() ->({{x_1*x_2*x_3+x_1^2,2*x_2+x_3-x_1^2+3*x_2*x_4*x_3^2, 3/2*x_1+3/2*x_3+1/2*x_2+1/2*x_1^2, 2/3*x_3+3*x_4-1/3*x_1^2-1/3*x_1*x_2*x_3-x_2*x_4*x_3^2}})
guard =() -> ({1})
initial= ()->( {random(-100,100),random(-100,100),random(-100,100),random(-100,100)})
