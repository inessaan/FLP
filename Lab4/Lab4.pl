writeList([]):-!.
writeList([H|L]):-write(H),writeList(L).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X), append(CurL, [X],CurL1), rList(N,I1,CurL1,L).

sumListDown(List,Sum):-sListD(List,0,Sum).
sListD([],Sum,Sum):-!.
sListD([H|L],CurSum,Sum):-CurSum1 is CurSum + H, sListD(L,CurSum1,Sum).

readSumWriteList(N):-
    readList(N,L),
    sumListDown(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

sumListUp([],0):-!.
sumListUp([H|T],Sum):-sumListUp(T,Sum1),Sum is Sum1+H.
