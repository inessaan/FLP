write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).


read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

pr:- see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List), seen, write_list_str(List),tell('C:/Users/Инесса/Desktop/ФиЛП/input.txt'), write_list_str(List),told.

/*Задание 1.1*/

prExc1:- see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'), read_list_str(_, LengthList), seen, max(LengthList, Max), write(Max).


read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

/*Задание 1.2*/

prExc1_2:-  see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List), seen, string_space(List,0,Num),nl,write(Num).

string_space([],Num,Num):-!.
string_space([H|T],Num,Space):-(count_space(H)->name(H1,H), write(H1),nl,Num1 is Num+1,string_space(T,Num1,Space);string_space(T,Num,Space)).

count_space([]):-!.
count_space([H|_]):-H is 32,!,fail.
count_space([_|T]):-count_space(T).

/*Задание 1.3*/
prExc1_3:- see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List),seen,
    count_A(List,[],ListCount),average(ListCount,Ave),more_a(List,Ave).

count_A([],List_Count,List_Count):-!.
count_A([H|T],I,List_Count):-a_str(H,0,Count_A),append(I,[Count_A],NI),
    count_A(T,NI,List_Count).

a_str([],N,N):-!.
a_str([H|T],I,N):-(H is 65->NI is I+1,a_str(T,NI,N);a_str(T,I,N)).

average(Count,Ave):-average(Count,0,Sum,0,N),Ave is Sum/N.
average([],Sum,Sum,N,N):-!.
average([H|T],I_Sum,Sum,I_N,N):-Sum1 is I_Sum+H,N1 is I_N+1, average(T,Sum1,Sum,N1,N).

more_a([],_):-!.
more_a([H|T],Ave):-a_str(H,0,CountA),(CountA>Ave->name(H1,H),writeln(H1),more_a(T,Ave);more_a(T,Ave)).

/*Задание 1.4*/

prExc1_4:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List), seen, words_all_str(List,[],List_frequent),unique_elems(List_frequent,Unique_words),counts(Unique_words,C,List_frequent),indOfMax(C,Ind),el_by_number(Unique_words,Ind,Word),name(Word1,Word),write("Most frequent word : "),write(Word1).

words_all_str([],List_frequent,List_frequent):-!.

words_all_str([Head|Tail],I,List_frequent):-get_words(Head,Words), append(I,Words,I1),wordsAllStr(Tail,I1,List_frequent).


get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str), get_word(New_Str,Word,New_Str_after_word), Word \=[],append(Words,[Word],New_list_word), get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).

unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):- not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList),!.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

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

skip_space([32|Tail],New_Str):-skip_space(Tail,New_Str),!.
skip_space(New_Str,New_Str).

get_word([],[],[]):-!.
get_word(Str,Word,New_Str_after_word):-get_word(Str,[],Word,New_Str_after_word).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,New_Str_after_word):-append(W,[H],W1),
    get_word(T,W1,Word,New_Str_after_word).

/*Задание 1.5*/

prExc1_5:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List), seen, words_all_str(List,[],AllWords),not_repeat(AllWords,UniqueWords), tell('C:/Users/Инесса/Desktop/ФиЛП/output.txt'),no_incidence(List,UniqueWords),told.

no_incidence([],_):-!.
no_incidence([H|T],UniqueWords):-(get_words(H,WordsHead), coin_str(WordsHead,UniqueWords)->write_str(H),nl, no_incidence(T,UniqueWords);no_incidence(T,UniqueWords)).

coin_str([],_):-!.
coin_str([H|T],UniqueWords):-in_list(UniqueWords,H),coin_str(T,UniqueWords).

del(_,[],[]):-!.
del(H,[H|T],Res):-del(H,T,Res),!.
del(H,[H1|T],[H1|Res]):-not(H=H1),del(H,T,Res).

not_repeat([],[]):-!.
not_repeat([H|T],[H|Res]):-not(in_list(T,H)), not_repeat(T,Res),!.
not_repeat([H|T],Res):-del(H,T,H1),not_repeat(H1,Res).

/*Задание 2.1*/

prExc2_1:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_str(List, _, _),seen,rus(List,0,C), write(C).

rus([],C,C):-!.
rus([H|T], Count, C):-((H>1039, H<1104)->Count1 is Count + 1, rus(T, Count1, C); rus(T, Count, C)).

/*Задание 2.9*/ 
 
prExc2_9:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_str(List,N,1),reverse(List,B),N1 is N div 2, palindrome(List, B, N1),seen. 
 
palindrome([_|_],[_|_],0):-!. 
palindrome([H1|T1],[H2|T2], I):-H1=H2,I1 is I-1, palindrome(T1,T2, I1),!. 
palindrome([_|_],[_|_],_):-fail,!.

/*Задание 2.18*/ 
 
prExc2_18:- see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List,N),seen, d(List,N). 
 
d([],[]):-!. 
d([H|T],[H1|T1]):-(H1>9->date(H, H1), d(T,T1); d(T, T1)). 
 
date([],_):-!. 
date(_, L):-L<10,!. 
date([H1, H2, H3, H4, H5, H6, H7, H8, H9, H10|T], L):-(H1>47, H1<52, H2>47,H2<58, H3==46, H4>47,H4<50, H5>47,H5<58, H6==46, H7>47, H7<58, H8>47, H8<58,H9>47,H9<58, H10>47, H10<58-> put(H1), put(H2), put(H3), put(H4), put(H5), put(H6), put(H7), put(H8), put(H9), put(H10),nl,L1 is L-10, date(T, L1); L1 is L - 1,date([H2, H3, H4, H5, H6, H7, H8, H9, H10|T], L-1)).

/*Задание 3*/ 
 
prExc3:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_str(List,_,1),seen,append(List,[32],A1),date_time(A1). 
 
date_time([]):-!. 
date_time([32|Tail]):-date_time(Tail),!. 
date_time([Head|Tail]):-(day([Head|Tail],[],Day,After_Day)->(month(After_Day,[],Month,After_Month)->(year(After_Month,[],Year,After_Year)-> 
write_str(Day),write(" "),write_str(Month),write(" "),write_str(Year),nl,date_time(After_Year);date_time(After_Month)); date_time(After_Day));date_time(Tail)). 
 
day([32|Tail],Day,Day,Tail):-!. 
day([Head|Tail],I,Day,After_Day):-Head >=48,Head =<57,append(I,[Head],I1),day(Tail,I1,Day,After_Day),!. 
day([_|_],_,_,_):-!,false. 
 
month([32|Tail],Month,Month,Tail):-!. 
month([Head|Tail],I,Month,After_Month):-Head >=97,Head =<122,append(I,[Head],I1),month(Tail,I1,Month,After_Month),!. 
month([_|_],_,_,_):-!,false. 
 
year([32|Tail],Year,Year,Tail):-!. 
year([Head|Tail],I,Year,After_Year):-Head >=48,Head =<57,append(I,[Head],I1),year(Tail,I1,Year,After_Year),!. 
year([_|_],_,_,_):-!,false.

/*Задание 5*/

prExc5:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(List,N),seen,regul(List, N,[]).
regul([],[],A):-write_list_str(A),!.

regul([H|T],[HL|TL],A):-Max =HL, Max_str=H, regul1([H|T],[HL|TL], Max, Max_str, String, Num),append(A,[String],B),remove_str([H|T], String, List),remove_str([HL|TL], Num, ListL), regul(List, ListL,B),!.

regul1([],[], Max, Max_str,Max_str, Max):-!.
regul1([H|T], [HL|TL], Max, Max_str, Str,Num):- (HL>Max-> Max1 = HL, Max_str1 = H,regul1(T, TL, Max1, Max_str1, Str,Num); regul1(T, TL, Max, Max_str,Str,Num)).

remove_str([H|T], X, List):-remove_str([H|T],[],List,X, 1).
remove_str([],List,List,_,_):-!.
remove_str([H|T], Temp, List, X, 1):-(H=X-> remove_str(T, Temp,List,X, 0)),!.
remove_str([H|T], Temp, List, X, 1):-append1(Temp,[H], Temp1), remove_str(T, Temp1, List, X,1).
remove_str([H|T], Temp, List, X, 0):-append1(Temp,[H], Temp1), remove_str(T, Temp1, List, X,1).

/*Задание 6*/

prExc6:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(A), seen,tell('C:/Users/Инесса/Desktop/ФиЛП/output.txt'),list_word(A,[],List_Word),bubble_sort(List_Word,_,A,Sorted_A),write_sort(Sorted_A),told.

list_word([],Res,Res):-!.
list_word([Head|Tail],I,Res):-get_words(Head,Words),lenght(Words,Count_Words),append(I,[Count_Words],I1),list_word(Tail,I1,Res).

write_sort([]):-!.
write_sort([Head|Tail]):-name(Head1,Head),write(Head1),nl,write_sort(Tail).

lenght([],L,L):-!.
lenght([_|Tail],I,L):-I1 is I+1,lenght(Tail,I1,L).
lenght(List,L):-lenght(List,1,L).

list_lenght([],Res,Res):-!.
list_lenght([Head|Tail],I,Res):-lenght(Head,Lenght_Head),append(I,[Lenght_Head],I1),list_lenght(Tail,I1,Res).


sort1([], [],[],[]):-!.
sort1([Head], [Head],[HeadStr],[HeadStr]):-!.
sort1([First, Second|Tail], [Second|ListWithMaxEnd],[FirstStr, SecondStr|TailStr],[SecondStr|ListWithMaxEndStr]):-First > Second, !, sort1([First|Tail], ListWithMaxEnd,[FirstStr|TailStr],ListWithMaxEndStr).
sort1([First, Second|Tail], [First|ListWithMaxEnd],[FirstStr, SecondStr|TailStr], [FirstStr|ListWithMaxEndStr]):-sort1([Second|Tail], ListWithMaxEnd,[SecondStr|TailStr], ListWithMaxEndStr).


bubble_sort(SortedList, SortedList,SortedList_Str,SortedList_Str):- sort1(SortedList, DoubleSortedList,SortedList_Str,DoubleSortedList_Str),SortedList = DoubleSortedList,SortedList_Str = DoubleSortedList_Str,!.
bubble_sort(List, SortedList,List_Str,SortedList_Str):-sort1(List, SortedPart,List_Str,SortedPart_List_Str),bubble_sort(SortedPart, SortedList,SortedPart_List_Str,SortedList_Str).

/*Задание 7*/

prExc7:-see('C:/Users/Инесса/Desktop/ФиЛП/input.txt'),read_list_str(A), seen,tell('C:/Users/Инесса/Desktop/ФиЛП/output.txt'),list_word_after_digit(A,[],List_Word),bubble_sort(List_Word,_,A,Sorted_A),write_sort(Sorted_A),told.

list_word_after_digit([],Res,Res):-!.
list_word_after_digit([Head|Tail],I,Res):-get_words(Head,Words),count_words_after_digit(Words,0,Count_Words),append(I,[Count_Words],I1),list_word_after_digit(Tail,I1,Res).

count_words_after_digit([_],Count_Words,Count_Words):-!.
count_words_after_digit([Head|Tail],I,Count_Words):-count_digit(Head,0,Count_Digit),(Count_Digit>0->I1 is I+1,count_words_after_digit(Tail,I1,Count_Words);count_words_after_digit(Tail,I,Count_Words)).

count_digit([],Count,Count):-!.
count_digit([Head|Tail],I,Count):-Head>=48,Head=<57->I1 is I+1,count_digit(Tail,I1,Count);count_digit(Tail,I,Count).
