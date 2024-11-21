----number of program variables
n =3
mapping =() ->({{x_1,3*x_1*x_2-x_3,x_2},{x_2,3*x_2*x_3-x_1,x_3}})
guard = () ->({1})
initial= ()->( {random(-100,100),random(-100,100),random(-100,100)})
