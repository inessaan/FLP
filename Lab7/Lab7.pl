unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str_f(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str_f(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).


reverse(A, Z):-reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc):-reverse(T,Z,[H|Acc]).

remove_from_list(List, Elem, Result) :-
	remove_from_list(List, Elem, [], Result).

remove_from_list([IH|IT], Elem, TempLeft, Result):-
	IH = Elem,
	reverse(TempLeft, TempLeftReverse),
	append(TempLeftReverse, IT, Result), !.

remove_from_list([IH|IT], Elem, TempLeft, Result):-
	not(IH = Elem),
	remove_from_list(IT, Elem, [IH|TempLeft], Result).

% --------------------------------------------------------------------
/*Задание 1*/

prExc1:-read_str(A,X,0),write_str(A),write(" , "),write_str(A),write(" , "),write_str(A),write(" , "),write(X).

/*Задание 2*/

prExc2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).
count_words([],K,K):-!.
count_words(Str,I,K):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),Word \=[],I1 is I+1,count_words(New_Str_after_word,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

/*Задание 3*/

prExc3:-read_str(A,N),get_words(A,Words,K),unique_elems(Words,U_words),
counts(U_words,C,Words),indOfMax(C,Ind),el_by_number(U_words,Ind,El), write_str(El).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):- skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-
	count(Word,Words,Count),counts(T_words,T_counts,Words).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1, count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

indOfMax(X,Y):-indexOfMin(X,Y).
indexOfMin([], -1):- !.
indexOfMin([H|T], X):-indexOfMin(T, 1, 1, X, H).
indexOfMin([], _, MinInd, MinInd, _):-!.
indexOfMin([H|T], CurInd, _, X, CurMin):- H > CurMin, NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, NewCurInd, X, H), !.
indexOfMin([_|T], CurInd, MinInd, X, CurMin):- NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, MinInd, X, CurMin).

/*Задание 4*/

prExc4:-read_str(A,N),(N>5->wr_3(A),reverse(A,A1),wr_3(A1);write_first(A,N)).

write_first(_,0,_):-!.
write_first(Head,I,N):-name(CurHead,[Head]),write(CurHead),I1 is I-1,write_first(Head,I1,N).
write_first([Head|_],N):-write_first(Head,N,N).

wr_3([First,Second,Third|_]):-name(First1,[First]),write(First1),name(Second1,[Second]),write(Second1),name(Third1,[Third]),write(Third1).

/*Задание 5*/

prExc5:-read_str(A,_),last_simbol(A,Elem),show_match(A,Elem,0).

last_simbol([Head],Head):-!.
last_simbol([_|Tail],Elem):-last_simbol(Tail,Elem).

show_match([_],_,_):-!.
show_match([Elem|Tail],Elem,I):-write(I),nl,I1 is I+1,show_match(Tail,Elem,I1),!.
show_match([_|Tail],Elem,I):-I1 is I+1,show_match(Tail,Elem,I1).

/*Задание 6*/

prExc6:-read_str(A,_),show_3(A,0).

show_3([],_):-!.
show_3([Head|Tail],I):-I1 is I+1,(I1 mod 3 =:= 0->name(Head1,[Head]),write(Head1),nl,show_3(Tail,I1);show_3(Tail,I1)).

/*Задание 7*/

prExc7:-read_str(A,_),count_plus(A,Plus),count_minus(A,Minus),count_zero(A,Zero),Sum is Minus+Plus+Zero, write("Count +,-,0 = "),write(Sum).

count_plus(Str,Count_plus):-count_plus(Str,0,Count_plus).
count_plus([],Count_plus,Count_plus):-!.
count_plus([Head|Tail],I,Count_plus):-(Head =:= 43->I1 is I+1,count_plus(Tail,I1,Count_plus);count_plus(Tail,I,Count_plus)).

count_minus(Str,Count_minus):-count_minus(Str,0,Count_minus).
count_minus([],Count_minus,Count_minus):-!.
count_minus([Head|Tail],I,Count_minus):-(Head =:= 45->I1 is I+1,count_minus(Tail,I1,Count_minus);count_minus(Tail,I,Count_minus)).

count_zero([_|Tail],Count_zero):-count_zero(Tail,0,Count_zero).
count_zero([],Count_zero,Count_zero):-!.
count_zero([Head|Tail],I,Count_zero):-(Head =:= 48->I1 is I+1,count_zero(Tail,I1,Count_zero);count_zero(Tail,I,Count_zero)).

/*Задание 8*/

prExc8:-read_str(A,_),symb_w(A,0,W),symb_x(A,0,X),(W<X->write("x more");write("w more")).

symb_w([],_,_):-write("w not found"),!,fail.
symb_w([H|T],I,W):-(H =:=119 -> W is I;I1 is I+1,symb_w(T,I1,W)).

symb_x([],_,_):-write("x not found"),!,fail.
symb_x([H|T],I,X):-(H =:=120 -> X is I;I1 is I+1,symb_x(T,I1,X)).

/*Задание 9*/

prExc9:-read_str(A,N1),read_str(B,N2),(N1>N2->N is N1-N2,write_big(A,N);N is N2-N1,write_big(B,N)).

write_big(_,0):-!.
write_big(Str,Num):-name(A,Str),write(A),nl,Num1 is Num-1,write_big(Str,Num1).

/*Задание 10*/

prExc10:-read_str(A,_),check(A,A1),name(A2,A1),write(A2).

check([A,B,C|Tail],Res):-(A is 97,B is 98,C is 99->append([119,119,119],Tail,Res);
append([A,B,C|Tail],[122,122,122],Res)).
