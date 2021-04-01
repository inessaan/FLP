write_str([]):-!. 
write_str([H|Tail]):-put(H),write_str(Tail). 
in_list([id1449472|_],El). 
in_list([_|T],El):-in_list(T,El). 
 
read_str(A,N):-get0(X),r_str(X,A,[],N,0). 
r_str(10,A,A,N,N):-!. 
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1). 
 
read_list_str(List):-read_str(A,N,Flag),read_list_str([A],List,Flag). 
read_list_str(List,List,1):-!. 
read_list_str(Cur_list,List,0):- 
 read_str(A,N,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag). 
 
/*Задание 1.1*/ 
 
build_all_razm_p:- 
  read_str(A,_),read(K),b_a_rp(A,K,[]). 
 
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail. 
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[id1449472|Perm]). 
 
/*Задание 1.2*/ 
 
build_all_perm:- 
  read_str(A,_),b_a_p(A,[]). 
 
in_list_exlude([id1449472|T],El,T). 
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail). 
 
b_a_p([],Perm1):-write_str(Perm1),nl,!,fail. 
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[id1449472|Perm]). 
 
/*Задание 1.3*/ 
 
build_all_razm:- 
  read_str(A,N),read(K),b_a_r(A,K,[]). 
b_a_r(A,0,Perm1):-write_str(Perm1),nl,!,fail. 
b_a_r(A,N,Perm):-in_list_exlude(A,El, A1),N1 is N-1,b_a_r(A1,N1,[id1449472|Perm]). 
 
/*Задание 1.4*/ 
 
sub_set([],[]). 
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set). 
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set). 
pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail. 
 
/*Задание 1.5*/ 
 
sochet([],0,_):-!. 
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set). 
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set). 
pr_sochet:-read_str(A,N),read(K),sochet(B,K,A),write_str(B),nl,fail.

/*Задание 2*/

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

two_a_razm_p:-tell('C:/Users/Инесса/Desktop/ФиЛП/output.txt'),not(two_a_razm_P),nl,told.
two_a_razm_P:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_pos(Word,Pos_a,[97]),
in_list([98,99,100,101,102],S1),
to_free_pos(Word,S1),
in_list([98,99,100,101,102],S2),
to_free_pos(Word,S2),
in_list([98,99,100,101,102],S3),
to_free_pos(Word,S3),
write_str(Word),nl,fail.
put_pos(Word,[H1,H2],[Sim]):-select_pos(Word,H1,Sim),
select_pos(Word,H2,Sim).

select_pos(Word,H,Sim):-(H is 1->Word=[Sim,_,_,_,_],!),
(H is 2->Word=[_,Sim,_,_,_],!);
(H is 3->Word=[_,_,Sim,_,_],!);
(H is 4->Word=[_,_,_,Sim,_],!);
(H is 5->Word=[_,_,_,_,Sim]).

to_free_pos([H1,H2,H3,H4,H5],Sim):-(var(H1)->H1 is Sim),!;
(var(H2)->H2 is Sim),!;
(var(H3)->H3 is Sim),!;
(var(H4)->H4 is Sim),!;
(var(H5)->H5 is Sim).

/*Задание 3*/

two_a_razm:-tell('C:/Users/Инесса/Desktop/ФиЛП/output.txt'),not(two_a_razm_), nl, told.
two_a_razm_:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_pos(Word,Pos_a,[97]),
in_list_exlude([98,99,100,101,102],S1,NList),
to_free_pos(Word,S1),
in_list_exlude(NList,S2,NList1),
to_free_pos(Word,S2),
in_list_exlude(NList1,S3,NList2),
to_free_pos(Word,S3),
write_str(Word),nl,fail.