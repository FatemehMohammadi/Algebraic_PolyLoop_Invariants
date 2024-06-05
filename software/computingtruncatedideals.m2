computebasis = method()
computebasis(ZZ,ZZ,List,List) :=(n,d,F,c)-> (
    ---Using a vector basis of the (d-1)th truncated ideal to find a lower bound for the dimension of the dth truncated ideal. 
    r =0;
     if d>1 then (
    computebasis(n,d-1,F,c);
    I = ideal(A);
    J = ideal(0_R);
    i=0;
    while i< numgens I do (
   	v = (degree I_i)_0;
    	m = d -v; 
     	S = 1;
    	j=1 ;
    	while j< n+1 do (
    	    S = S+x_j;
    	    j= j+1;
    	    );
    	if m > -1 then(
    	    C = first entries monomials S^m;
    	    j =0;
    	    while j< length C do (
        	J = ideal(J, I_i*C_j);
		j=j+1;	
		);
    	    );
    	i = i+1;
    	);
    --- The dimension of the dth truncated ideal is greater than or equal to the following number r.
    	r = rank (coefficients gens J)_1 ;
    );
    M = binomial(n+d,d);
    S = 1;
    i =1 ;
---Generating all monomials with n variables up to degree d.     
    while i< n+1 do (
    	S = S+x_i;
    	i = i+1;
    	);
    C = first entries monomials S^d;
    g =0;
    i=1;
---Generating a general polynomial of degree d with n variables
    while i<M+1 do (
    	g = g+y_i*C_(i-1);
    	i = i+1;
    	);
    i = 1;
    while i<n+1 do(
	f_i = F_(i-1);
	i=i+1;
	);
     i = 1;
    while i<n+1 do (
	a_i = c_(i-1);
	i = i+1;
	);
      A = {x_1=>a_1};
      t =  2;
      while t<n+1 do(
	  A =join(A,{x_t=>a_t});
	  t=t+1; 
	  );
      h = sub(g,A);
      T = ideal(h);
    i=0;
---Generating linear equatons to compute candidates for polynomial invariants. 
    while i < M-r do (
	j=0;
	while j<n do(
	    A = {x_1=>a_1};
	    t =  2;
	    while t<n+1 do(
		A =join(A,{x_t=>a_t});
		t=t+1; 
		);
	    b_(j+1) = sub(f_(j+1),A);
	    j=j+1;
	    );
	j =0;
	while j<n do(
	    a_(j+1) = b_(j+1);
	    j=j+1;
	    );
      A = {x_1=>a_1};
      t =  2;
      while t<n+1 do(
	  A =join(A,{x_t=>a_t});
	  t=t+1; 
	  );
      h = sub(g,A);
      T = T +ideal(h);
      i=i+1;
	);
---Constructing a matrix from linear equations    
M = transpose (coefficients gens T)_1;
M = sub(M, QQ);
M = reducedRowEchelonForm M;
---Compute candidates
A = ker M;
B = matrix{{ }};
A = generators A;
N = matrix{C};
---Generating candidates
P =N*A;
l = numgens source P;
---Finding a vector basis for a truncated ideal.
if l > 0 then (
    ---Checking that all candidates are polynomial invariants simultaneously
 X_0 = ideal(P_(0,0));
 j=1;
while j< l do(
    X_0 = ideal(X_0, P_(0,j));
    j=j+1;
    );
D= {x_1=>f_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>f_t});
		t=t+1; 
		);
    X_1=sub(X_0, D)+X_0;
    i = 0;
    while  isSubset(X_(i+1), X_i)==false  do (
    	i = i+1;
	print i;
    	X_(i+1) = sub(X_i, D) + X_0 ;
	);
     D = {x_1=>c_0};
	    t =  2;
	    while t<n+1 do(
		D =join(D,{x_t=>c_(t-1)});
		t=t+1; 
		);
    S=  sub(X_i,D);
    
if S == ideal(0_R) then(
   A = P;  
    );
---If one of the candidates is not polynomial invariants, then find polynomial invariants from the candidates.
if S!=ideal(0_R) then(
A = matrix{{}};
j =0;
while j< l do(
    g = P_(0,j);
    X_0 = ideal(g);
    D= {x_1=>f_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>f_t});
		t=t+1; 
		);
    g = sub(g,D);
    i = 0;
    while  ideal(X_i, 1-g*e) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, g);
    	g = sub(g,D);
	i=i+1;
	);
     D = {x_1=>c_0};
	    t =  2;
	    while t<n+1 do(
		D =join(D,{x_t=>c_(t-1)});
		t=t+1; 
		);
    S=  sub(X_i,D);
    if S == ideal(0_R) then(
    A =A|matrix{{P_(0,j)}};   
    ); 
if S != ideal(0_R) then (
	B=B|matrix{{P_(0,j)}};
);
    j=j+1; 
);
);
);
---Finding the rest of basis vectors from the vector space generated by candidates which are not polynomial invariants.
if numgens source B > 1 then( 
    h = 0;
    i =0;
    while i< numgens source B do(
	C = B_i;
	h = h+z_(i+1)*C_0;
	i = i+1;
	);
    print h;
    X_0 = ideal(h);
    print X_0;
     D= {x_1=>f_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>f_t});
		t=t+1; 
		);
	    print D;
    h = sub(h,D);
    print h;
    i = 0;
    while  ideal(X_i, 1-h*e) != ideal(1_R)  do (
    	print i;
    	X_(i+1) = ideal(X_i, h);
    	h = sub(h,D);
	i=i+1;
	);
     D = {x_1=>c_0};
	    t =  2;
	    while t<n+1 do(
		D =join(D,{x_t=>c_(t-1)});
		t=t+1; 
		);
     T=  sub(X_i,D);
     T = trim T;
     print T;
     l = numgens T;
     S = {};
     m = numgens source B;
     i =0;
     while i< l do(
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
    );
)


end --
Generating polynomial invariants up to given degree.
