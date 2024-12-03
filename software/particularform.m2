particularform = method()
particularform(Matrix) :=(A)-> (
H = matrix{{}};
if numgens source A > 0 then (
lm = 0;
while lm < length mapping() do(
t=1;    
   while t<n+1 do (
    ma_t =sub(F_lm_(t-1),R2);
    t =t+1;
    );
t = 1 ;
while t<U+2 do (
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
D= {x_1=>ma_1};
	t =  2;
	while t<n+1 do(
	    D =join(D,{x_t=>ma_t});
		t=t+1; 
		);
g = sub(h,D);
r = g-h;
Q = ideal(transpose (coefficients r)_1);
t=1;
while t<U+2 do (
    z_t = sub(z_t, R);
    t=t+1;
    ); 
Q = sub(Q, R);
Za = {z_2..z_(numgens source A +1)};
if lm == 0 then (
M = transpose(coefficients(gens Q, Monomials=> Za))_1;
);
if lm > 0 then (
 M = M||transpose(coefficients(gens Q, Monomials=> Za))_1;
);
lm = lm+1;
);
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
B= matrix{{}};
while i < numgens source N do (
    h = 0;
    j=2;
    k=2;
    while j<numgens source A+2 do (
	    h = h+N_(k-2,i)*A_(0,j-2);
		k=k+1;
		j = j+1;
	);
    B = B|h;
    i = i+1;
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
