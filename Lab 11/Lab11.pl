:- dynamic eat/2.
:- dynamic hooves/2.
:- dynamic water/2.
:- dynamic cat/2.
:- dynamic color/2.

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

% eat
eat_r(X,Y):-repeat,(eat(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(eat(X,Y))) ;X=nil,Y=nil).

prEatTell:-tell('C:/Users/Inessa/Desktop/eat.txt'),eat_r(X,_),X=nil,told.

prEatSee:-see('C:/Users/Inessa/Desktop/eat.txt'),get0(Sym),readEat(Sym),seen.

readEat(-1):-!.
readEat(_):-read_str(Lang),name(X,Lang),read(Y),asserta(eat(X,Y)),
                get0(Sym),readEat(Sym).

% hooves
hooves_r(X,Y):-repeat,(hooves(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(hooves(X,Y))) ;X=nil,Y=nil).

prHoovesTell:-tell('C:/Users/Inessa/Desktop/hooves.txt'),hooves_r(X,_),X=nil,told.

prHoovesSee:-see('C:/Users/Inessa/Desktop/hooves.txt'),get0(Sym),readHooves(Sym),seen.

readHooves(-1):-!.
readHooves(_):-read_str(Lang),name(X,Lang),read(Y),asserta(hooves(X,Y)),
                get0(Sym),readHooves(Sym).

% water
water_r(X,Y):-repeat,(water(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(water(X,Y))) ;X=nil,Y=nil).

prWaterTell:-tell('C:/Users/Inessa/Desktop/water.txt'),water_r(X,_),X=nil,told.

prWaterSee:-see('C:/Users/Inessa/Desktop/water.txt'),get0(Sym),readWater(Sym),seen.

readWater(-1):-!.
readWater(_):-read_str(Lang),name(X,Lang),read(Y),asserta(water(X,Y)),
                get0(Sym),readWater(Sym).

% cat
cat_r(X,Y):-repeat,(cat(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(cat(X,Y))) ;X=nil,Y=nil).

prCatTell:-tell('C:/Users/Inessa/Desktop/cat.txt'),cat_r(X,_),X=nil,told.

prCatSee:-see('C:/Users/Inessa/Desktop/cat.txt'),get0(Sym),readCat(Sym),seen.

readCat(-1):-!.
readCat(_):-read_str(Lang),name(X,Lang),read(Y),asserta(cat(X,Y)),
                get0(Sym),readCat(Sym).

% color
color_r(X,Y):-repeat,(color(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(color(X,Y))) ;X=nil,Y=nil).

prColorTell:-tell('C:/Users/Inessa/Desktop/color.txt'),color_r(X,_),X=nil,told.

prColorSee:-see('C:/Users/Inessa/Desktop/color.txt'),get0(Sym),readColor(Sym),seen.

readColor(-1):-!.
readColor(_):-read_str(Lang),name(X,Lang),read(Y),asserta(color(X,Y)),
                get0(Sym),readColor(Sym).


% Easy life

prSeeAll:-prEatSee,prHoovesSee,prWaterSee,prCatSee,prColorSee.
prTellAll:-prEatTell,prHoovesTell,prWaterTell,prCatTell,prColorTell.



question1(X1):- write("1. What does it eat?"),nl,
				write("1. carnivorous"),nl,
				write("0. herbivore"),nl,
                                write("2. omnivore"),nl,
				read(X1).
question2(X2):-	write("2. Does it have hooves?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X2).
question3(X3):-	write("3. Does it live in water?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X3).
question4(X4):-	write("4. Is it from the cat family?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X4).
question5(X5):-	write("5. Does it have any color features?"),nl,
				write("1. stripes"),nl,
				write("0. not always"),nl,
                                write("2. spotted"),nl,
				read(X5).
pr:-prSeeAll,

     question1(X1),
     question2(X2),
     question3(X3),
     question4(X4),
     question5(X5),

     (eat(X,X1),
     hooves(X,X2),
     water(X,X3),
     cat(X,X4),
     color(X,X5),
     write("Your animal: "),writeln(X),!;newOne(X1,X2,X3,X4,X5)),fail.

newOne(X1,X2,X3,X4,X5):-writeln("Is it new animal?"),
    writeln("1 - Yes"),writeln("0 - No"),read(Ans),
    (Ans is 1 ->writeln("It's name is "),read(Name),
     addNewOne(X1,X2,X3,X4,X5,Name);writeln("Ok "),fail).

addNewOne(X1,X2,X3,X4,X5,Name):-
    append('C:/Users/Inessa/Desktop/eat.txt'),
    nl, write(Name), nl,write(X1),write("."), told,

    append('C:/Users/Inessa/Desktop/hooves.txt'),
    nl, write(Name), nl,write(X2),write("."), told,

    append('C:/Users/Inessa/Deskto/water.txt'),
    nl, write(Name), nl,write(X3),write("."), told,

    append('C:/Users/Inessa/Desktop/cat.txt'),
    nl, write(Name), nl,write(X4),write("."), told,

    append('C:/Users/Inessa/Desktop/color.txt'),
    nl, write(Name), nl,write(X5),write("."), told.
