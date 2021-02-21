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
