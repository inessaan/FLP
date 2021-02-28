/*Задание 1*/
writeList([]):-!.
writeList([H|L]):-write(H),writeList(L).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X), append(CurL, [X],CurL1), rList(N,I1,CurL1,L).

/*Задание 2*/
sumListDown(List,Sum):-sListD(List,0,Sum).
sListD([],Sum,Sum):-!.
sListD([H|L],CurSum,Sum):-CurSum1 is CurSum + H, sListD(L,CurSum1,Sum).

readSumWriteList(N):-
    readList(N,L),
    sumListDown(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

/*Задание 3*/
sumListUp([],0):-!.
sumListUp([H|T],Sum):-sumListUp(T,Sum1),Sum is Sum1+H.

/*Задание 4*/
listElNumb(List,Elem,Number):-listElNumb(List,Elem,0,Number).
listElNumb([H|_],H,Number,Number):-!.
listElNumb([_|T],Elem,I,Number):-I1 is I+1,listElNumb(T,Elem,I1,Number).

/*Задание 4.2*/
readLEN:-write("N = "),read(N), nl,write("enter an elem"),nl,readList(N,List),write("elem is "),nl,read(Elem),listElNumb(List,Elem,Number),write("position is "),write(Number),!.
readLEN:-write("is no elem").

/*Задание 5*/
readLNE:-write("N = "),read(N),nl,write("enter an elem"),nl,readList(N,List),write("position is "),nl,read(Number),listElNumb(List,Elem,Number),write("elem is "),write(Elem),!.
readLNE:-write("is no elem").

/*Задание 6*/
minListUp([H],H):-!.
minListUp([H|T],Min):-minListUp(T,Min1),(H<Min1->Min=H; Min=Min1).

/*Задание 7*/
minListD([H|T],Min):-minListD(T,H,Min).
minListD([],Min,Min):-!.
minListD([H|T],Cur,Min):-H<Cur,minListD(T,H,Min),!.
minListD([_|T],Cur,Min):-minListD(T,Cur,Min).

/*Задание 8*/
readLMin:-write("N = "),read(N), nl,readList(N,List),minListUp(List,Min),write("min = "),write(Min).

/*Задание 9*/
memb([X|_],X):-!.
memb([_|T],X):-memb(T,X).

/*Задание 10*/ 
reverse(L,X):-rev(L,[],X). 
rev([],X,X):-!. 
rev([H|T],CurL,X):-rev(T,[H|CurL],X). 

/*Задание 11*/ 
p([],_):-!. 
p([H|T],List):-memb(List,H),p(T,List). 

/*Задание 12*/ 
delNum(0,[_|List], List):-!. 
delNum(X,[H|Y],[H|List]):-X1 is X-1,delNum(X1,Y,List). 

/*Задание 13*/
delElem([],_,[]).
delElem([H|T],X,List):-(H=X-> delElem(T,X,List); List=[H|T1],delElem(T,X,T1)).

/*Задание 14*/
single(_,[]):-!.
single([H|T]):-single(H,T),single(T).
single(X,[H|T]):- X\= H,single(X,T).
single([]):-!.

/*Задание 15*/
uniq([],[]):-!.
uniq([H|T],T1):-memb(T,H),uniq(T,T1),!.
uniq([H|T],[H|T1]):-uniq(T,T1),!.

/*Задание 16*/
elCount([],_,Count,Count):-!.
elCount(List,El,Count):-elCount(List,El,0,Count).
elCount([H|T],El,Num,Count):-(H=:=El->Num1 is Num+1;Num1 is Num),elCount(T,El,Num1,Count).

/*Задание 17*/
len([],0):-!.
len([H|T],X):-len(T,X1),X is X1+1.
