restart
load "main.m2"
computeInvariantsT= method()
computeInvariantsT(String, ZZ,ZZ) := (u,d,num)->(
iat=0;
print num;
while iat< num do(
iat = iat+1;
ta_1=cpuTime();
computeInvariants(u,d);
ta_2=cpuTime();
t = ta_2-ta_1;
t = floor(t*1000)/1000;
t = sub(t,RR);
if iat ==1 then (
print t;
Tim = t;
Ts = t;
);
if iat!=1 then (
Ts = Ts+t;
Tim = join{Tim,t};
);
);
<< " 5 timings "<< endl;
print Tim;
Ts = Ts/num;
<< " Average timing "<< endl;
print Ts;
)

end---
