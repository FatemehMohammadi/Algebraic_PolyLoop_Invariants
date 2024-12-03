computeCanM = method()
computeCanM(List, List, List, ZZ) := (maps, In, Inv, It)->(
p =  9223372036854775783;
K = ZZ/p;
FF = K[x_1..x_(n+1),z_1..z_(M+1),y_1..y_(M+1),e,w_1..w_(n+1)];
t = 1 ;
while t<n+2 do (
    x_t =sub(x_t,FF);
    t =t+1;
    );
G = sub(G, FF);
i = 0;
while i < length maps do (
    FZ_i = join((maps)_i, {x_(n+1)*G});
    j =1;
    F_i={sub(FZ_i_0,FF)};
    while j < n+1 do (
    F_i = join(F_i, {sub(FZ_i_j, FF)});
    j=j+1;
    );
    i = i+1;
    );
 i = 1;
    while i<n+2 do (
	InF_(i-1) = sub(In_(i-1),K);
	i = i+1;
	);
InvF=sub(Inv_0, FF);
  i = 1;
    while i<n+1 do (
	a_i = InF_(i-1);
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
      h = sub(InvF*x_(n+1),A);
     T = ideal(h);
---Generating linear equations to compute candidates for polynomial invariants. 
S ={InF};
i=0;
while i < It do (	
	k = 0;
	while k < length S do (
	 s=0;
	while s< length maps do ( 
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
      h = sub(InvF,A);
      T = T +ideal(h);
      k= k+1;
      );
	i=i+1;
	);
---Constructing a matrix from linear equations    
M = transpose (coefficients (gens T,Monomials=>{y_1..y_bm}))_1;
M = sub(M, K);
M = reducedRowEchelonForm M;
M = sub(M,ZZ);
o = numgens target M;
m = numgens source M;
N = floor(sqrt(p/2));
L = mutableMatrix(QQ, o, m);
i=0;
wi=0;
while i<o and wi ==0  do(
    j =0;
    while j<m and  wi == 0 do(
	t = 1;
	r =0;
	while t < N and r ==0 do(
	     if M_(i,j)<N and M_(i,j)> -N then(
	       	L_(i,j) = M_(i,j);
	    	r=1;
		);  
	    s =  (t*M_(i,j))%p;
	    if s<N and r ==0 then(
	    	L_(i,j) = s/t;
		r=1;
	    	);
	    if s-p > -N and r==0 then(
	    	L_(i,j) = (s-p)/t;
	    	r=1;
	    	);
	    t = t+1;
	    );
	if (numerator(L_(i,j))-denominator(L_(i,j))*M_(i,j))%p != 0  then(
	    w=1;
	    );
	j = j+1;
	);
i=i+1;
);
if wi==1 then(
return << "Please try for a different prime number."<< endl;
);
if wi==0 then (
return L;
);
);
end--
