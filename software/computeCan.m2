computeCan = method()
computeCan(List, List, List, ZZ) := (maps, In, Inv, It)->(
i = 0;
while i < length maps do (
    F_i = join((maps)_i, {x_(n+1)*G});
    i = i+1;
    );    
  i = 1;
    while i<n+1 do (
	a_i = In_(i-1);
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
      h = sub(Inv_0*x_(n+1),A);
     T = ideal(h);
---Generating linear equations to compute candidates for polynomial invariants. 
S ={In};
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
      h = sub(Inv_0,A);
      T = T +ideal(h);
      k= k+1;
      );
	i=i+1;
	);
---Constructing a matrix from linear equations    
M = transpose (coefficients (gens T,Monomials=>{y_1..y_bm}))_1;

M = sub(M, QQ);
M = reducedRowEchelonForm M;
return M;
);
end--
