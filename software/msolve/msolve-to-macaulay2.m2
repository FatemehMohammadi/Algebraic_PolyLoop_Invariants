MSolveGroebner = {verb => 0, nthreads => 1, mspath => "msolve/msolve"} >> o -> (F) -> (
    R := ring F#0;

    alph := random(toList(join("a".."z","A".."Z")));
    fname1 := "/tmp/" | concatenate(alph_{0..7}) | ".ms";
    fname2 := "/tmp/" | concatenate(alph_{-8..-1})| ".ms";

    f := fname1;
    f << replace("[{}]", "", toString(gens R)) << endl;
    f << toString(char R) << endl;
    f << replace(" ", "\n", replace("[{}]", "", toString(F))) << endl;
    f << close;

    run(o.mspath | " -v " | toString(o.verb) | " -g 2 -t " | toString(o.nthreads) | " -f " | fname1 | " -o " | fname2);
    out := replace("[\n:]", "", replace("#.*\n","", get fname2));

    removeFile fname1;
    removeFile fname2;

    return toList(value out);
)

-- Example: Katsura-6
-- Input data
--R = QQ[x_1..x_6]
--F = {
--    x_1 + 2*x_2 + 2*x_3 + 2*x_4 + 2*x_5 + 2*x_6 - 1,
--    x_1^2 + 2*x_2^2 + 2*x_3^2 + 2*x_4^2 + 2*x_5^2 + 2*x_6^2 - x_1,
--    2*x_1*x_2 + 2*x_2*x_3 + 2*x_3*x_4 + 2*x_4*x_5 + 2*x_5*x_6 - x_2,
--    x_2^2 + 2*x_1*x_3 + 2*x_2*x_4 + 2*x_3*x_5 + 2*x_4*x_6 - x_3,
--    2*x_2*x_3 + 2*x_1*x_4 + 2*x_2*x_5 + 2*x_3*x_6 - x_4,
--    x_3^2 + 2*x_2*x_4 + 2*x_1*x_5 + 2*x_2*x_6 - x_5
--};
--
--G = MSolveGroebner(F);





