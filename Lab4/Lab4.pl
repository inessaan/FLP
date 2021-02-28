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

listElNumb(List,Elem,Number):-listElNumb(List,Elem,0,Number).
listElNumb([H|_],H,Number,Number):-!.
listElNumb([_|T],Elem,I,Number):-I1 is I+1,listElNumb(T,Elem,I1,Number).


readLEN:-write("N = "),read(N), nl,write("enter an elem"),nl,readList(N,List),write("elem is "),nl,read(Elem),listElNumb(List,Elem,Number),write("position is "),write(Number),!.
readLEN:-write("is no elem").

readLNE:-write("N = "),read(N),nl,write("enter an elem"),nl,readList(N,List),write("position is "),nl,read(Number),listElNumb(List,Elem,Number),write("elem is "),write(Elem),!.
readLNE:-write("is no elem").

minListUp([H],H):-!.
minListUp([H|T],Min):-minListUp(T,Min1),(H<Min1->Min=H; Min=Min1).
