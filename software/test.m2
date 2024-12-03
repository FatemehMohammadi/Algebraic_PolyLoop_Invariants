restart
load "Compose.m2"
load "InRadical.m2"
load "computeCan.m2"
load "computeCanM.m2"
A = 2.21113
A = (A*100)//1
A = floor(100*A)/100
A = sub(A, RR)
A = join{A,A}
R = QQ[x_1,x_2,x_3,e, y_1,y_2]
Compose({x_1,x_2},{{x_1^2,x_2^2},{x_1^3,x_2^3}},2)
InRadical({x_1,x_1^2-x_1},{x_1^2})
n =2 
G = x_1
bm = 2
computeCan({{x_1,x_2+1}}, {2,1,1},{y_1*x_1+y_2*x_2}, 3)
M=2
M = computeCanM({{x_1,x_2+1}, {x_1,x_2+1}}, {2,1,1},{y_1*x_1+y_2*x_2}, 3)
R = QQ[x_1,x_2,x_3,e, y_1,y_2]
F= {x_1}
G= x_2
K =join(F,{G})
m = 15
FF = ZZ/7
m = sub(m,FF)



-------------------------------------------------------------------------------------------


---Generating a general polynomial of degree d with n variables
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
      a_(n+1)=1;
      A = {x_1=>a_1};
      t =  2;
      while t<n+2 do(
	  A =join(A,{x_t=>a_t});
	  t=t+1; 
	  );
      g = g*x_(n+1);	  
      h = sub(g,A);
     T = ideal(h);
---Generating linear equations to compute candidates for polynomial invariants. 
S ={c};
i=0;
while i < M-r*ad do (	
	k = 0;
	while k < length S do (
	 s=0;
	while s< length mp do ( 
	j=0;
	while j<n+1 do(
	    A = {x_1=>S_k_0};
	    t =  2;
	    while t<n+2 do(
		A =join(A,{x_t=>S_k_(t-1)});
		t=t+1; 
		);
	    b_(j+1) = sub(F_s_j,A);
	    if j == 0 then (
	     	bb={b_(j+1)};
	    );
	    if j != 0 then (
	    	bb=join(bb,{b_(j+1)});
	    );
	    j=j+1;
	    );
	    if k+s==0 then(
	S' = {bb};
	);
	if k+s!=0 then (
	S' = join(S',{bb});
	);
	    s = s+1;
	    );
	 k=k+1;
      );
	S= S';
	k= 0; 
	while k < length S do(
      j =0;
	while j<n+1 do(
	    a_(j+1) = S_k_j;
	    j=j+1;
	    );
       A = {x_1=>a_1};
      t =  2;
      while t<n+2 do(
	  A =join(A,{x_t=>a_t});
	  t=t+1; 
	  );
      h = sub(g,A);
      T = T +ideal(h);
      k= k+1;
      );
	i=i+1;
	);
---Constructing a matrix from linear equations    
M = transpose (coefficients (gens T,Monomials=>{y_1..y_bm}))_1;
M = sub(M, QQ);
M = reducedRowEchelonForm M;
