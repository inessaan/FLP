sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).
/*Задание 2*/
pr_boys :- Boys = [_, _, _],

		in_list(Boys, [belokurov, _]),
		in_list(Boys, [chernov, _]),
		in_list(Boys, [rijov, _]),
		in_list(Boys, [_, white]),
		in_list(Boys, [_, black]),
		in_list(Boys, [_, ginger]),

		not(in_list(Boys, [belokurov, white])),
		not(in_list(Boys, [chernov, black])),
		not(in_list(Boys, [rijov, ginger])),

		write(Boys), !.
/*Задание 3*/
  pr_girls :- Girls = [_, _, _],

		in_list(Girls, [_, white, _]),
		in_list(Girls, [_, _, white]),
		in_list(Girls, [_, green, _]),
		in_list(Girls, [_, _, green]),
		in_list(Girls, [_, blue, _]),
		in_list(Girls, [_, _, blue]),
		in_list(Girls, [anya, _, _]),
		in_list(Girls, [natasha, _, green]),
		in_list(Girls, [valya, _, _]),

		not(in_list(Girls, [natasha, green, _])),
		not(in_list(Girls, [valya, white, white])),

		write(Girls), !.
/*Задание 4*/

pr_friends :- Friends = [_, _, _],

		in_list(Friends, [slesar, _, 0, 0, _]),
		in_list(Friends, [tokar, _, _, 1, _]),
		in_list(Friends, [svarschik, _, _, _, _]),
		in_list(Friends, [_, borisov, 1, _, _]),
		in_list(Friends, [_, ivanov, _, _, _]),
		in_list(Friends, [_, semenov, _, 2, borisov]),

		write(Friends), !.
/*Задание 5*/
pr_vessels :- Vessels = [_, _, _, _],

		in_list(Vessels, [bottle, _]),
		in_list(Vessels, [glass, _]),
		in_list(Vessels, [jug, _]),
		in_list(Vessels, [jar, _]),

		in_list(Vessels, [_, milk]),
		in_list(Vessels, [_, lemonade]),
		in_list(Vessels, [_, kvass]),
		in_list(Vessels, [_, water]),

		not(in_list(Vessels, [bottle, water])),
		not(in_list(Vessels, [bottle, milk])),

		sprava_next([jug, _], [_, lemonade], Vessels),
		sprava_next([_, lemonade], [_, kvass], Vessels),

		not(in_list(Vessels, [jar, lemonade])),
		not(in_list(Vessels, [jar, water])),

		next_to([jar, _], [glass, _], Vessels),
		next_to([jar, _], [_, milk], Vessels),

		write(Vessels),!.
