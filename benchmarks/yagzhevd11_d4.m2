restart
t1 = cpuTime()
K = QQ
R = K[x_1..x_1376, y_1..y_11,t,z_1..z_1376]
f1 = x_1-x_3*x_10^2
f2 = x_2-x_3*x_11^2
f3 = x_3+x_1*x_11^2-x_2*x_10^2
f4 = x_4-x_6*x_10^2
f5 = x_5-x_6*x_11^2
f6 = x_6+x_4*x_11^2-x_5*x_10^2
f7 = x_7-x_9*x_10^2
f8 = x_8-x_9*x_11^2 
f9 = x_9+x_7*x_11^2-x_8*x_10^2
f10 = x_10+(x_3*x_5-x_2*x_6)*x_7+(x_1*x_6-x_3*x_4)*x_8+(x_2*x_4-x_1*x_5)*x_9
f11 = x_11-x_10^3
S = {1, x_1,x_2,x_3,x_4,x_5,x_6,x_7,x_8,x_9,x_10,x_11}
C =  {1, x_1,x_2,x_3,x_4,x_5,x_6,x_7,x_8,x_9,x_10,x_11}
i =1
while i< 4 do(
    l = length C;
    print l;
    B = {};
    j = 0;
    while j< l do(
	t =0;
	while t<12 do(
	    b = C_j*S_t;
	    t=t+1;
	    B =join(B, {b});
	    );
	j= j+1;
	);
    C = B;
    i = i+1;
    ) 
C = set C
C = toList C
h1 =0
i=1
while i<1366 do (
    h1 = h1 +x_(i+11)*C_(i-1);
    i = i+1;
    )
a_1 = 3
a_2 = -1
a_3 = 2
a_4 = 1
a_5 = -5
a_6 = -1
a_7 = 3
a_8 = 4
a_9 = -1
a_10 = 3
a_11 = 2
g = sub(h1, {x_1=>a_1, x_2=>a_2, x_3=>a_3, x_4=>a_4, x_5=>a_5, x_6=>a_6, x_7=>a_7, x_8=>a_8, x_9=>a_9, x_10=> a_10, x_11=>a_11})
T = ideal(g)
i=0;
---Generating linear equations
while i<1365 do (
   y_1 = a_1-a_3*a_10^2;
   y_2 = a_2-a_3*a_11^2;
   y_3 = a_3+a_1*a_11^2-a_2*a_10^2;
   y_4 = a_4-a_6*a_10^2;
   y_5 = a_5-a_6*a_11^2;
   y_6 = a_6+a_4*a_11^2-a_5*a_10^2;
   y_7 = a_7-a_9*a_10^2;
   y_8 = a_8-a_9*a_11^2 ;
   y_9 = a_9+a_7*a_11^2-a_8*a_10^2;
   y_10 = a_10+(a_3*a_5-a_2*a_6)*a_7+(a_1*a_6-a_3*a_4)*a_8+(a_2*a_4-a_1*a_5)*a_9;
   y_11 = a_11-a_10^3;
   a_1 = y_1;
   a_2 = y_2;
   a_3 = y_3;
   a_4 = y_4;
   a_5 = y_5;
   a_6 = y_6;
   a_7 = y_7;
   a_8 = y_8;
   a_9 = y_9;
   a_10 = y_10;
   a_11 = y_11;
   g = sub(h1, {x_1=>a_1, x_2=>a_2, x_3=>a_3, x_4=>a_4, x_5=>a_5, x_6=>a_6, x_7=>a_7, x_8=>a_8, x_9=>a_9,x_10=>a_10, x_11=>a_11});
   T = T +ideal(g);
   T = trim T;
   i=i+1;
   print i;
    )
---Trim simplifies ideals
T = trim T
S={}
n = numgens T
m = 1365
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
	b = sub(T_i, {x_11=>a_1});
	t = 1;
	while t<m do (
	    b = sub(b, {x_(11+t)=>a_(t+1)});
	    t=t+1;
	    );
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
a = matrix{C}
P = a*A
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
    X_1=sub(X_0, {x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11})+X_0;
    i = 0;
    while  isSubset(X_(i+1), X_i)==false  do (
    	i = i+1;
	print i;
    	X_(i+1) = sub(X_i, {x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11}) + X_0 ;
	);
    S=  sub(X_i,{x_1=>3, x_2=>-1, x_3=>2, x_4=>1, x_5=>-5, x_6=>-1, x_7=>3, x_8=>4, x_9=>-1, x_10=>3, x_11=>2});
    
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
    f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11});
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11});
	i=i+1;
	);
    S=  sub(X_i,{x_1=>3, x_2=>-1, x_3=>2, x_4=>1, x_5=>-5, x_6=>-1, x_7=>3, x_8=>4, x_9=>-1, x_10=>3, x_11=>2});
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
    f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11});
    print f;
    i = 0;
    while  ideal(X_i, 1-f*t) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, f);
    	f = sub(f,{x_1 =>f1, x_2 =>f2,x_3 => f3, x_4 =>f4, x_5 =>f5 , x_6 => f6  , x_7 => f7 , x_8 => f8, x_9 => f9,x_10=>f10,x_11=>f11});
	i=i+1;
	);
     T=  sub(X_i,{x_1=>3, x_2=>-1, x_3=>2, x_4=>1, x_5=>-5, x_6=>-1, x_7=>3, x_8=>4, x_9=>-1, x_10=>3, x_11=>2});
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
