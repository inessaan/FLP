man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(svyatogor).
man(zloba).
man(gorinya).
man(dobrinya).
man(venceslav).
man(stanimir).
man(ostromir).
man(ognedar).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(vera).
woman(iskra).
woman(dragomira).
woman(zabava).
woman(miroslava).
woman(mlada).
woman(marfa).
woman(roksana).


parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(ratibor,zloba).
parent(ratibor,iskra).
parent(lubomila,zloba).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).
parent(lubomila,iskra).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(boguslav,svyatogor).
parent(boguslav,vera).
parent(bratislava,bogomil).
parent(bratislava,svyatogor).
parent(bratislava,bozhedara).
parent(bratislava,vera).

parent(velerad,broneslava).
parent(velerad,gorinya).
parent(velerad,dragomira).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,gorinya).
parent(veslava,veselina).
parent(veslava,dragomira).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(duhovlad,zabava).
parent(duhovlad,dobrinya).
parent(zhdana,zdislava).
parent(zhdana,dobrinya).
parent(zhdana,zlatomir).
parent(zhdana,zabava).

parent(venceslav,boguslav).
parent(miroslava,boguslav).
parent(stanimir,lubomila).
parent(mlada,lubomila).
parent(ostromir,veslava).
parent(marfa,veslava).
parent(ognedar,duhovlad).
parent(roksana,duhovlad).


men:-man(X),write(X),write(","),fail.
women:- woman(X), write(X), write(","),fail.

children(X,Y):-parent(Y,X).
allchildren(Y):-children(X,Y),write(X),write(","),fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

father(X,Y):-parent(X,Y),man(X),!.
father(X):-father(Y,X),write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),man(Z),man(X),not(X=Y),!.
brother_for_all(X,Y):-parent(Z,X),parent(Z,Y),man(Z),man(X),not(X=Y).
brothers(X):-brother_for_all(Y,X),write(Y),write(","),fail.

sister(X,Y):-parent(Z,X),parent(Z,Y),man(Z),woman(X),not(X=Y),!.
sister_for_all(X,Y):-parent(Z,X),parent(Z,Y),man(Z),woman(X),not(X=Y).
sisters(X):-sister_for_all(Y,X),write(Y),write(","),fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),!. /*если родные брат/сестра, выводит true, иначе false*/
b_s_for_all(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y).
b_s(X):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),write(Y),write(","),fail.
cousins(X):-parent(Y,X),parent(Z,Y),man(Z),children(W,Z),not(W=Y),allchildren(W),!.

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X),!.
grand_pas(X):-parent(Y,X),parent(Z,Y),man(Z),write(Z),write(","),fail.
grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X),!.
grand_mas(X):-parent(Y,X),parent(Z,Y),woman(Z),write(Z),write(","),fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y),!;grand_pa(Y,X),man(X),!.


uncle(X,Y):-parent(Z,Y),brother(X,Z).
uncles(X):-parent(Z,X),brother_for_all(Y,Z),write(Y),write(","),fail.
aunt(X,Y):-parent(Z,Y),sister(X,Z),!.
aunts(X):-parent(Z,X),sister_for_all(Y,Z),write(Y),write(","),fail.
