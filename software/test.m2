restart
load "Compose.m2"
load "InRadical.m2"
R = QQ[x_1,x_2,e]
Compose({x_1,x_2},{{x_1^2,x_2^2},{x_1^3,x_2^3}},2)
InRadical({x_1,x_1^2-x_1},{x_1^2})
F= {{x_1}}
G= {x_2}
join(F,{G})
