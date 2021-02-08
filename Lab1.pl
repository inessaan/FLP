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

men:-man(X),write(X),write(","),fail.
women:- woman(X), write(X), write(","),fail.
