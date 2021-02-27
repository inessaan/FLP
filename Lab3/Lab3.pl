max(X,Y,X):-X>Y.
max(_,Y,Y).

max1(X,Y,Z,X):-X>Y,X>Z,!.
max1(_,Y,Z,Y):-Y>Z,!.
max1(_,_,Z,Z):-!.

fact(1,1):-!.
fact(N,X):-N1 is N-1, fact(N1,X1), X is N*X1.

fact_down(1,CurX,CurX):-!.
fact_down(N,CurX,X):-N1 is N-1, CurX1 is CurX*N, fact_down(N1,CurX1,X).
factorial_down(N,X):-fact_down(N,1,X).

fib(1, 1) :- !.
fib(2, 1) :- !.
fib(N, X) :- N1 is N - 1, N2 is N - 2, fib(N1, X1), fib(N2, X2), X is X1 + X2.

fib(1, _, CurX2, CurX2) :- !.
fib(2, _, CurX2, CurX2) :- !.
fib(N, CurX1, CurX2, X) :- CurX3 is CurX1 + CurX2, N1 is N - 1, fib(N1, CurX2, CurX3, X).
fib_down(N, X) :- fib(N, 1, 1, X).

sumDig(0, 0) :- !.
sumDig(Num, Sum) :- Mod is Num mod 10, Num1 is Num div 10, sumDig(Num1, Sum1), Sum is Sum1 + Mod.

sumDig(0, CurSum, CurSum) :- !.
sumDig(Num, CurSum, Sum) :- Mod is Num mod 10, Num1 is Num div 10, CurSum1 is CurSum + Mod, sumDig(Num1, CurSum1, Sum).
sumDig_down(Num, Sum) :- sumDig(Num, 0, Sum).

multDig(0,1):-!.
multDig(X,Mult):-X1 is X div 10, multDig(X1,Mult1), Mult is Mult1 * (X mod 10).

multDig(0,Mult,Mult):-!.
multDig(X,Cur,Mult):-X1 is X div 10, Cur1 is Cur * (X mod 10), multDig(X1,Cur1,Mult).
multDig_down(X,Mult):-multDig(X,1,Mult).

odd(X,Y):- X2 is X mod 10,X2>3,X1 is X mod 10 mod 2,X1 \= 0, Y is 1.
odd(_,Y):-Y is 0,!.

count(0,0):-!.
count(N,Count):-N1 is N div 10, count(N1,Count1), odd(N,Y), Count is Count1+Y,!.

count_down(0,Count,Count):-!.
count_down(N,CurCount,Count):- N1 is N div 10,odd(N,Y),CurCount1 is CurCount+Y, count_down(N1,CurCount1,Count),!.
count_down(N,Count):-count_down(N,0,Count).
