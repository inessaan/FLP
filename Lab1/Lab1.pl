man(milovan).
man(darimir).
man(bogumir).
man(boris).
man(vsemil).
man(jelan).
man(dobrovit).
man(svetol).
man(chestimir).
man(svyatogor).
man(zloba).
man(gorinya).
man(dobrinya).
man(venceslav).
man(stanimir).
man(ostromir).
man(ognedar).
man(peresvet).

woman(belogora).
woman(vesea).
woman(vseoka).
woman(drozdana).
woman(doda).
woman(erga).
woman(krasnoslava).
woman(leda).
woman(chtava).
woman(vera).
woman(iskra).
woman(dragomira).
woman(zabava).
woman(miroslava).
woman(mlada).
woman(marfa).
woman(roksana).
woman(pavlina).

parent(milovan,darimir).
parent(milovan,vseoka).
parent(milovan,boris).
parent(milovan,doda).

parent(belogora,darimir).
parent(belogora,vseoka).
parent(belogora,boris).
parent(belogora,doda).

parent(darimir,jelan).
parent(darimir,dobrovit).
parent(darimir,zloba).
parent(darimir,iskra).
parent(vesea,zloba).
parent(vesea,jelan).
parent(vesea,dobrovit).
parent(vesea,iskra).

parent(bogumir,svetol).
parent(bogumir,erga).
parent(bogumir,svyatogor).
parent(bogumir,vera).
parent(vseoka,svetol).
parent(vseoka,svyatogor).
parent(vseoka,erga).
parent(vseoka,vera).

parent(boris,krasnoslava).
parent(boris,gorinya).
parent(boris,dragomira).
parent(boris,leda).
parent(drozdana,krasnoslava).
parent(drozdana,gorinya).
parent(drozdana,leda).
parent(drozdana,dragomira).

parent(vsemil,chtava).
parent(vsemil,chestimir).
parent(vsemil,zabava).
parent(vsemil,dobrinya).
parent(doda,chtava).
parent(doda,dobrinya).
parent(doda,chestimir).
parent(doda,zabava).

parent(venceslav,bogumir).
parent(miroslava,bogumir).
parent(stanimir,vesea).
parent(mlada,vesea).
parent(ostromir,drozdana).
parent(marfa,drozdana).
parent(ognedar,vsemil).
parent(roksana,vsemil).

parent(milovan,pavlina).
parent(belogora,pavlina).

parent(milovan,peresvet).
parent(belogora,peresvet).


men:-man(X),write(X),nl,fail.
women:- woman(X), write(X), nl,fail.

children(X,Y):-parent(Y,X).
allchildren(Y):-children(X,Y),write(X),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

father(X,Y):-parent(X,Y),man(X),!.
father(X):-father(Y,X),write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),man(Z),man(X),not(X=Y),!.
brothers(X):-mother(Z,X),mother(Z,Y),man(Y),X\=Y,write(Y),nl,fail.

sister(X,Y):-parent(Z,X),parent(Z,Y),man(Z),woman(X),not(X=Y),!.
sisters(X):-mother(Z,X),mother(Z,Y),woman(Y),X\=Y,write(Y),nl,fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),!. /*если родные брат/сестра, выводит true, иначе false*/
b_s_for_all(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y).
b_s(X):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),write(Y),nl,fail.
cousins(X):-parent(Y,X),parent(Z,Y),man(Z),children(W,Z),not(W=Y),allchildren(W),!.

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X),!.
grand_pas(X):-parent(Y,X),parent(Z,Y),man(Z),write(Z),nl,fail.
grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X),!.
grand_mas(X):-parent(Y,X),parent(Z,Y),woman(Z),write(Z),nl,fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y),!;grand_pa(Y,X),man(X),!.
grand_ma_and_son(X,Y):-grand_ma(X,Y),man(Y),!;grand_ma(Y,X),man(X),!.

uncle(X,Y):-parent(Z,Y),brother(X,Z),!.
uncles(X):-parent(Z,X),brothers(Z).
aunt(X,Y):-parent(Z,Y),sister(X,Z),!.
aunts(X):-parent(Z,X),sisters(Z).
