restart
---Loading the main algorithm.
t1=cpuTime();
---loadPackage "Parametrization"
load "particularform.m2"
load "computingtruncatedideals.m2"
load "matrix.m2"
load "InRadical.m2"
load "Compose.m2"
load "computeCan.m2"
load "computeCanM.m2"
load "computeCanMultiple.m2"
---needsPackage "Parametrization"
computeInvariantsN = method();
computeInvariantsN(String, ZZ) := (u,d)->(
t1 =currentTime();
---Loading an example 
load u;    
Pr={2147483647,2147483629,2147483587,2147483579,2147483563,2147483549,2147483543,2147483497,2147483489,2147483477,2147483423,2147483399,2147483353,2147483323,2147483269, 2147483249};
i =1;
PP = Pr_0;
while i < length Pr do(
PP = PP*Pr_i;
i=i+1;
);
M = binomial(n+d,d);
U = binomial(n+d,d);
K = QQ;
R2  = QQ[z_1..z_(M+1)][x_1..x_(n+1), y_1..y_(M+1)];
R = K[x_1..x_(n+1),z_1..z_(M+1),y_1..y_(M+1),e,,w_1..w_(n+1)];
---Extracting polynomial mappings and initial values from an example.
G = (guard())_0;
 A = {x_1=>(initial())_0};
	    t =  2;
	    while t<n+1 do(
		A =join(A,{x_t=>(initial())_(t-1)});
		t=t+1; 
		);
c = join(initial(),{1});
computebasis(n,d,mapping(),c);
---This is output: Giving a vector basis and the dimension for the dth truncated ideal of an example.
if d ==1 then (
<< "The " << d<<"st truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
---<< "The running time is " <<t4-t1<< endl;
);
if d ==2 then (
<< "The " << d<<"nd truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
t4 = currentTime();
 ---<< "The running time is " <<t4-t1<< endl;
);
if d ==3 then (
<< "The " << d<<"rd truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
t4 = currentTime();
---<< "The running time is " <<t4-t1<< endl;
);
if d >3 then (
<< "The " << d<<"th truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
t4 = currentTime();
---<< "The running time is " <<t4-t1<< endl;
);
---particularform(A);
---t2 =cpuTime();
---<< "------------------------------------------------------"<< endl;
---i=0;
---if numgens source H ==0 then(
---<< "There is no general polynomial of a form g(x)-g(w)=0. "<< endl;
---);
---if numgens source H>0 then(
---<< "General polynomal invariants of a form g(x)-g(w)=0 are "<< endl;
---while i < numgens source H do(
---<< H_i<< endl;
---i=i+1;
---);
---);
---<< "where w_i is an initial value of x_i"<< endl;
---<< "The running time is " <<t2-t1<< endl;
)
computeInvariants= method();
computeInvariants(String, ZZ) := (u,d) ->(elapsedTime computeInvariantsN(u,d);)
computeGeneralInvariantsN = method();
computeGeneralInvariantsN(String, ZZ) := (u,d)->(
t1 = cpuTime();
---Loading an example 
load u;    
M = binomial(n+d,d);
U = binomial(n+d,d);
K = QQ;
R2  = QQ[z_1..z_(M+1)][x_1..x_(n+1), y_1..y_(M+1)];
R = K[x_1..x_(n+1),z_1..z_(M+1),y_1..y_(M+1),e,,w_1..w_(n+1)];
---Extracting polynomial mappings and initial values from an example.
G = (guard())_0;
---c = {2*(random(0,1)-1/2)};
---i=1;
---while i < n do (
---	c = join(c,{2*(random(0,1)-1/2)});
---	i = i+1;
---);
---c = join(c,{1});
---computebasis(n,d,mapping(),c);
---This is output: Giving a vector basis and the dimension for the dth truncated ideal of an example.
 S = 1;
    i =1 ;
---Generating all monomials with n variables up to degree d.     
    while i< n+1 do (
    	S = S+x_i;
    	i = i+1;
    	);
    C = first entries monomials (S^d-1);
A = matrix{C};
i = 0;
while i < length mapping() do (
    F_i = join((mapping())_i, {x_(n+1)*G});
    i = i+1
    );
t4 = cpuTime();
particularform(A);
<< "------------------------------------------------------"<< endl;
i=0;
if numgens source H ==0 then(
<< "There is no general polynomial of a form g(x)-g(w)=0. "<< endl;
);
if numgens source H>0 then(
<< "General polynomal invariants of a form g(x)-g(w)=0 are "<< endl;
while i < numgens source H do(
<< H_i<< endl;
i=i+1;
);
);
<< "where w_i is an initial value of x_i"<< endl;
t2 =cpuTime();
---<< "The running time is " <<t2-t1<< endl;
)
computeGeneralInvariants = method();
computeGeneralInvariants(String, ZZ) := (u,d) ->(elapsedTime computeGeneralInvariantsN(u,d);)
end --
