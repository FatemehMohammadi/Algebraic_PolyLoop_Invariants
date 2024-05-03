restart
t1 = cpuTime()
K = QQ
R= K[ x_1..x_13,y_1..y_3,a_1..a_3,t,z_1..z_13]
f1= x_2
f2 = 2*x_1*x_3-x_2
f3 = 4*x_1*x_2*x_3-2*x_1^2-2*x_2^2+1
---The following polynomial is a general polynomial of degree 2 with 3 variables
f7 =x_4+x_5*x_1+x_6*x_2+x_7*x_3+x_8*x_1^2+x_9*x_2^2+x_10*x_3^2+x_11*x_1*x_2+x_12*x_1*x_3+x_13*x_2*x_3
a_1 = 3
a_2 =-2
a_3 = 1
g = sub(f7, {x_1=>a_1, x_2=>a_2, x_3=>a_3})
T = ideal(g)
i=0;
---Generating linear equations
while i< 13 do (
    print i;
    y_1 = sub(f1,{x_1=>a_1, x_2=>a_2, x_3=>a_3});
    y_2 = sub(f2,{x_1=>a_1, x_2=>a_2, x_3=>a_3});
    y_3 = sub(f3,{x_1=>a_1, x_2=>a_2, x_3=>a_3});
    a_1 = y_1;
    a_2 = y_2;
    a_3 = y_3;
    g = sub(f7, {x_1=>a_1, x_2=>a_2, x_3=>a_3});
    T = T +ideal(g);
    print dim T;
    i=i+1;
    )
---- Trim simplifies ideals
T = trim T
S={}
n = numgens T
m = 10
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
	b=sub(T_i,{x_4=>a_1, x_5=>a_2, x_6=>a_3,x_7=>a_4,x_8=>a_5,x_9=>a_6, x_10=>a_7, x_11=>a_8, x_12=>a_9, x_13=>a_10});       
	U_i = join(U_i, {b});   
	a_j = a_(j+1);
    	a_(j+1)= a_(j+1)+1;
	j = j+1;
	);
    i = i+1;
    )  
M = matrix{U_0, U_1}
i=0;
while i< n-2 do(
    M = M||matrix{ U_(i+2)};
    i = i+1;
    )
t2 = cpuTime()
A=ker M
B = matrix{{ }}
A = generators A
a = matrix{{1},{x_1},{x_2},{x_3},{x_1^2},{x_2^2},{x_3^2}, {x_1*x_2},{x_1*x_3},{x_2*x_3}}
P = transpose(a)*A
t3 = cpuTime()
n = numgens source P
---Finding a vector basis for a truncated ideal.
if n > 0 then (
    ---Checking that all candidates are polynomial invariants simultaneously
 X_0 = ideal(P_(0,0));
 j=1;
while j< n do(
    X_0 = ideal(X_0, P_(0,j));
    j=j+1;
    );
    X_1=sub(X_0, {x_1 =>f1,x_2 =>f2,x_3=>f3})+X_0;
    i = 0;
    while  isSubset(X_(i+1), X_i)==false  do (
    	i = i+1;
	print i;
    	X_(i+1) = sub(X_i, {x_1 =>f1,x_2 =>f2,x_3=>f3}) + X_0 ;
	);
    S=  sub(X_i,{x_1=>3, x_2=>-2, x_3=>1});
    
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
    f = sub(f,{x_1=>f1,x_2=>f2,x_3=>f3});
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1=>f1,x_2=>f2,x_3=>f3});
	i=i+1;
	);
    S=  sub(X_i,{x_1=>3, x_2=>-2,x_3=>1});
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
    f = sub(f,{x_1=>f1,x_2=>f2,x_3=>f3});
    print f;
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1=>f1,x_2=>f2,x_3=>f3});
	i=i+1;
	);
     T=  sub(X_i,{x_1=>3, x_2=>-2,x_3=>1});
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
