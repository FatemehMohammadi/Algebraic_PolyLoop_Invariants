restart
t1=cpuTime()
K = QQ
R = K[x_1..x_64, y_1..y_9,a_1..a_9,t,z_1...z_64]
f1 = x_1+x_1*x_7*x_9+x_9^2*x_2
f2 = x_2-x_1*x_7^2-x_2*x_7*x_9
f3 = x_3+x_3*x_7*x_9+x_4*x_9^2
f4 = x_4-x_3*x_7^2-x_4*x_7*x_9
f5 = x_5+x_5*x_7*x_9+x_6*x_9^2
f6 = x_6 - x_5*x_7^2-x_6*x_7*x_9
f7 = x_7+(x_1*x_4-x_2*x_3)*x_9
f8 = x_8 +(x_3*x_6-x_4*x_5)*x_9
f9 = x_9 + (x_1*x_4-x_2*x_3)*x_8-(x_3*x_6+x_4*x_5)*x_7
---The following polynomial is a general polynomial of degree 2 with 9 variables
h1 = x_10+x_1*x_4*x_11+x_2*x_3*x_12+x_3*x_6*x_13+x_4*x_5*x_14+x_1*x_6*x_15+x_2*x_5*x_16+x_1*x_2*x_17+x_18*x_1*x_3+x_19*x_1*x_5+x_20*x_1*x_7+x_21*x_1*x_8+x_22*x_1*x_9+x_23*x_2*x_4+x_24*x_2*x_6+x_25*x_2*x_7+x_26*x_2*x_8+x_27*x_2*x_9+x_28*x_3*x_4+x_29*x_3*x_5+x_30*x_3*x_7+x_31*x_3*x_8+x_32*x_3*x_9+x_33*x_4*x_6+x_34*x_4*x_7+x_35*x_4*x_8+x_36*x_4*x_9+x_37*x_5*x_6+x_38*x_5*x_7+x_39*x_5*x_8+x_40*x_5*x_9+x_41*x_6*x_7+x_42*x_6*x_8+x_43*x_6*x_9+x_44*x_7*x_8+x_45*x_7*x_9+x_46*x_8*x_9+x_47*x_1^2+x_48*x_2^2+x_49*x_3^2+x_50*x_4^2+x_51*x_5^2+x_52*x_6^2+x_53*x_7^2+x_54*x_8^2+x_55*x_9^2+x_56*x_1+x_57*x_2+x_58*x_3+x_59*x_4+x_60*x_5+x_61*x_6+x_62*x_7+x_63*x_8+x_64*x_9
a_1 = 2
a_2 = -3
a_3 = 1
a_4 = 4
a_5 = -1
a_6 = 7
a_7 = -4
a_8 = 3
a_9 = 2
g = sub(h1, {x_1=>a_1, x_2=>a_2, x_3=>a_3, x_4=>a_4, x_5=>a_5, x_6=>a_6, x_7=>a_7, x_8=>a_8, x_9=>a_9});
T = ideal(g)
i=0;
---Generating linear equations
while i<30 do (
    y_1 = sub(f1,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_2 = sub(f2,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_3 = sub(f3,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_4 = sub(f4,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_5 = sub(f5,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_6 = sub(f6,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_7 = sub(f7,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_8 = sub(f8,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    y_9 = sub(f9,{x_1=>a_1,x_2=>a_2,x_3=>a_3,x_4=>a_4,x_5=>a_5,x_6=>a_6,x_7=>a_7,x_8=>a_8,x_9=>a_9});
    a_1 = y_1;
    a_2 = y_2;
    a_3 = y_3;
     a_4 = y_4;
      a_5 = y_5;
       a_6 = y_6;
    a_7 = y_7;
    a_8 = y_8;
    a_9 = y_9;
    g = sub(h1, {x_1=>a_1, x_2=>a_2, x_3=>a_3, x_4=>a_4, x_5=>a_5, x_6=>a_6, x_7=>a_7, x_8=>a_8, x_9=>a_9});
    T = T +ideal(g);
    T = trim T;
    print i;
    i=i+1;
    )
---Trim simplifies ideals
 T= trim T;
S={}
n = numgens T
m = 55
i =0
---Making a matrix from linear equations to compute candidates for polynomial invariants
while i< n do(
    U_i =S;
    j =1;
    k = 2;
    a_1 =1;
    while k<m+2 do (
	a_k =0;
	k=k+1;
	);
    while j <  m+1 do(
	b = sub(T_i, {x_10=>a_1});
	t = 1;
	while t<m do (
	    b = sub(b, {x_(10+t)=>a_(t+1)});
	    t=t+1;
	    );
	U_i = join(U_i, {b});   
	a_j = a_(j+1);
    	a_(j+1)= a_(j+1)+1;
	j = j+1;
	);
    i = i+1;
    )  
M = matrix{U_0, U_1};
i=0;
while i< n-2 do(
    M = M||matrix{ U_(i+2)};
    i = i+1;
    )
t2 =cpuTime()
A=ker M;
B = matrix{{ }}
A = generators A;
a = matrix{{1,x_1*x_4,x_2*x_3,x_3*x_6,x_4*x_5,x_1*x_6,x_2*x_5,x_1*x_2,x_1*x_3,x_1*x_5,x_1*x_7,x_1*x_8,x_1*x_9,x_2*x_4,x_2*x_6,x_2*x_7,x_2*x_8,x_2*x_9,x_3*x_4,x_3*x_5,x_3*x_7,x_3*x_8,x_3*x_9,x_4*x_6,x_4*x_7,x_4*x_8,x_4*x_9,x_5*x_6,x_5*x_7,x_5*x_8,x_5*x_9,x_6*x_7,x_6*x_8,x_6*x_9,x_7*x_8,x_7*x_9,x_8*x_9,x_1^2,x_2^2,x_3^2,x_4^2,x_5^2,x_6^2,x_7^2,x_8^2,x_9^2,x_1,x_2,x_3,x_4,x_5,x_6,x_7,x_8,x_9}}
P = a*A;
n = numgens source P
t3=cpuTime()
---Finding a vector basis for a truncated ideal.
if n > 0 then (
    ---Checking that all candidates are polynomial invariants simultaneously
 X_0 = ideal(P_(0,0));
 print X_0;
 j=1;
while j< n do(
    X_0 = ideal(X_0, P_(0,j));
    print X_0;
    j=j+1;
    );
    X_1=sub(X_0, {x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9})+X_0;
    print X_1;
    i = 0;
    while  isSubset(X_(i+1), X_i)==false  do (
    	i = i+1;
	print i;
    	X_(i+1) = sub(X_i, {x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9}) + X_0 ;
	);
    S=  sub(X_i,{x_1=>2, x_2=>-3, x_3=>1, x_4=>4, x_5=>-1, x_6=>2, x_7=>-4, x_8=>3, x_9=>2});
    
if S == ideal(0_R) then(
   A = P;  
    );
---If one of the candidates is not polynomial invariants, then find polynomial invariants from the candidates.
if S!=ideal(0_R) then(
A = matrix{{}};
j =0;
while j< n do(
    f = P_(0,j);
    X_0 = ideal(f);
    f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9});
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9});
	i=i+1;
	);
    S=  sub(X_i,{x_1=>2, x_2=>-3, x_3=>1, x_4=>4, x_5=>-1, x_6=>2, x_7=>-4, x_8=>3, x_9=>2});
    if S == ideal(0_R) then(
    A =A|matrix{{P_(0,j)}};   
    ); 
 if S != ideal(0_R) then (
	B=B|matrix{{P_(0,j)}};
);
    j=j+1; 
);
);
)
---Finding the rest of basis vectors from the vector space generated by candidates which are not polynomial invariants.
if numgens source B > 1 then( 
    f = 0;
    i =0;
    while i< numgens source B do(
	C = B_i;
	f = f+z_(i+1)*C_0;
	i = i+1;
	);
    print f;
    X_0 = ideal(f);
    print X_0;
    f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9});
    print f;
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9});
	i=i+1;
	);
     T=  sub(X_i,{x_1=>2, x_2=>-3, x_3=>1, x_4=>4, x_5=>-1, x_6=>7, x_7=>-4, x_8=>3, x_9=>2});
     T = trim T;
     print T;
     n = numgens T;
     S = {};
     m = numgens source B;
     i =0;
     while i< n do(
    	 U_i =S;
    	 j =1;
    	 k = 2;
    	 a_1 =1;
    	 while k<m+2 do (
	     a_k =0;
	     k=k+1;
	     );
    	 while j <  m+1 do(
	     t = 1;
	     D = {z_1=>a_1};
	     while t< numgens source B do (
		 t = t+1;
		 D = join(D,{z_t=>a_t});
		 );
	     b=sub(T_i,D);       
	     U_i = join(U_i, {b});   
	     a_j = a_(j+1);
    	     a_(j+1)= a_(j+1)+1;
	     j = j+1;
	     );
    	 i = i+1;
    	 );  
     M = matrix{U_0, U_1};
     i=0;
     while i< n-2 do(
    	 M = M||matrix{ U_(i+2)};
    	 i = i+1;
    	 );
     A1=ker M;
     print M;
     A1 = generators A1;
     v = transpose B;
     P = transpose(v)*A1;
     A=A|P;
    )
t4= cpuTime();
<< "The truncated ideal is generated by "<< A<< "and the dimension of the truncated ideal is "<<numgens source A
<< "The running time is " <<t4-t1





