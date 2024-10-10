particularform = method()
particularform(Matrix) :=(A)-> (
H = matrix{{}};
if numgens source A > 0 then (
t=1;    
   while t<n+1 do (
    f_t =sub(f_t,R2);
    t =t+1;
    );
t = 1 ;
while t<U+1 do (
    z_t =sub(z_t,R2);
    t =t+1;
    );
t = 1 ;
while t<n+1 do (
    x_t =sub(x_t,R2);
    t =t+1;
    );
h = 0;
i = 1;
while i< numgens source A+1 do(
    q = A_(0,i-1);
    q = sub(q, R2);    
    h = h+z_(i+1)*q;
    i=i+1;
    );
D= {x_1=>f_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>f_t});
		t=t+1; 
		);
g = sub(h,D);
r = g-h;
Q = ideal(transpose (coefficients r)_1);
t=1;
while t<U+1 do (
    z_t = sub(z_t, R);
    t=t+1;
    ); 
Q = sub(Q, R);
Z_1 = (coefficients gens Q)_0;
Z_2 = set{z_2..z_(numgens source A+1)}_0;
Z_3 = Z_2 - set (entries Z_1)_0;
M = transpose(coefficients gens Q)_1;
M = sub(M, QQ);
M = reducedRowEchelonForm M ;
N= ker M;
N = generators N;
t = 1 ;
while t<n+1 do (
    x_t =sub(x_t,R);
    t =t+1;
    );
A = sub(A, R);
H = matrix{{}};
i =0 ;
while i < numgens source N do (
    h = 0;
    j=2;
    k=2;
    while j<numgens source A+2 do (
	if member(z_j, Z_3) ==false then(
	    h = h+N_(k-2,i)*A_(0,j-2);
	    	k=k+1;
	    );
	j = j+1;
	);
    B = B|h;
    i = i+1;
    );
   j=2;
    while j<numgens source A+2 do (
	 h = 0;
	if member(z_j, Z_3) ==true then(
	    h = h+A_(0,j-2);
	B = B|h;
	    );
	j = j+1
	); 
	D= {x_1=>w_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>w_t});
		t=t+1; 
		);
	H=matrix{{}};
	i= 0;
	while i <numgens source B do (
	H= H|((B_i)_0-sub((B_i)_0,D));
	i=i+1;
	);
    );   
);

end --
Generating polynomial invariants of a particular form.
