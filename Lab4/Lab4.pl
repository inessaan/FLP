writeList([]):-!.
writeList([H|L]):-write(H),writeList(L).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X), append(CurL, [X],CurL1), rList(N,I1,CurL1,L).
