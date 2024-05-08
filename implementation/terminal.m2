restart
----- Give a degree for polynomial invariants
load "computingtruncatedideals.m2"
computeInvariants = method()
computeInvariants(String, ZZ) := (u,d)->(
t1 = cpuTime();
load u;    
M = binomial(n+d,d);
K = QQ;
R = K[x_1..x_n,z_1..z_M,y_1..y_M,e];
F = mapping();
c = initial();
computebasis(n,d,F,c);
t4 = cpuTime();
if d ==1 then (
<< "The " << d<<"st truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
<< "The running time is " <<t4-t1<< endl;
);
if d ==2 then (
<< "The " << d<<"nd truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
 << "The running time is " <<t4-t1<< endl;
);
if d ==3 then (
<< "The " << d<<"rd truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
 << "The running time is " <<t4-t1<< endl;
);
if d >3 then (
<< "The " << d<<"th truncated ideal is generated by: "<< endl;
i=0;
while i < numgens source A do(
<< A_i<< endl;
i=i+1;
);
<< " and the dimension of the truncated ideal is "<<numgens source A<<". "<< endl;
 << "The running time is " <<t4-t1<< endl;
);
)
end --
