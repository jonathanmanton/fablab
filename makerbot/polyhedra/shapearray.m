#!/Applications/Mathematica.app/Contents/MacOS/MathKernel -script

<< polyprint.m
PolyPrint[$CommandLine[[4]]]; 
(* Print[ToExpression[$CommandLine[[4]]]] *)
