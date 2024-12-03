computeMatrix = method()
computeMatrix(String, ZZ) := (u,d)->(
t1 = cpuTime();
---Loading an example 
load u;    
M = binomial(n+d,d);
R = QQ[x_1..x_(n+1),y_1..y_M,e];
---Extracting polynomial mappings, an inequation and initial values from an example.
G = (guard())_0;
i = 0;
while i < length mapping() do (
    F_i = join((mapping())_i, {x_(n+1)*G});
    i = i+1
    );
maps = {F_0};
i =1;
while i<length mapping() do (
maps = join(maps, {F_i});
i = i+1;
);
---Generating all monomials with n variables up to degree d.
S = 1;
i =1 ;     
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
---Computing X_i
N=0;
X = {x_(n+1)*g};
Xt = Compose(X,maps,n+1);
while InRadical(Xt, X) == false do(
X = join(X, Xt);
Xt= Compose(Xt, maps,n+1);
N= N+1;
print N;
);
T = sub(ideal(X), {x_(n+1)=>1});
--- Construct a matrix 
S = {};
---n = numgens T
---m = 6
i =0;
while i< numgens T do(
    Uu_i =S;
    j =1;
    k = 2;
    ca_1 =1;
    while k<M+2 do (
	ca_k =0;
	k=k+1;
	);
    while j <  M+1 do(
	 D= {y_1=>ca_1};
	t =  2;
	while t<M+1 do(
	    D =join(D,{y_t=>ca_t});
		t=t+1; 
		);
	bc=sub(T_i,D);       
	Uu_i = join(Uu_i, {bc});   
	ca_j = ca_(j+1);
    	ca_(j+1)= ca_(j+1)+1;
	j = j+1;
	);
    i = i+1;
    );
M = matrix{Uu_0, Uu_1};
i=0;
while i< numgens T -2 do(
    M = M||matrix{ Uu_(i+2)};
    i = i+1;
    );
---This is output: Giving a vector basis and the dimension for the dth truncated ideal of an example.
<< "The output is" <<endl;
<<M<<endl;
t4 = cpuTime();
<< "The running time is " <<t4-t1<< endl;
);

---Generating a polynomial matirx
