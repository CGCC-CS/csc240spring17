father(ruwee, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
mother(jobal, padme).
mother(shmi, anakin).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).
alias(darthvader,anakin).
alias(luke,skywalker).
alias(X,Y) :- alias(Y,X).


male(luke).
male(john).
male(bob).
male(mike).
female(sarah).
weather(tempe, summer, hot).
weather(tempe, winter, warm).
weather(tempe, fall, hot).
weather(newyork, summer, warm).
weather(seattle, summer, cool).
weather(buenasaires, winter, warm).
weather(City, Temp) :- weather(City, _, Temp).

avg_temp(berlin, 49).
avg_temp(karlsruhe, 60).
avg_temp(paris, 55).
avg_temp(belgrade, 52).
avg_temp(chicago, 50).
avg_temp(boston, 48).
avg_temp(johannesburg, 55).
avg_temp(phoenix, 80).
avg_temp(jerusalem, 61).


% Caluclate average temperature in Celsius
avg_temp_celsius(Location, C_temp) :-    % head of rule
	avg_temp(Location, F_temp),          % get the avg temp of Location
    C_temp is round((F_temp - 32) * 5 / 9).

baseball_season(spring).
baseball_season(summer).
reasonable(warm).
reasonable(hot).
playball(City) :- weather(City, Season, Temp),
	baseball_season(Season), reasonable(Temp).

president(washington).
president(lincoln).
president(kennedy).
president(X) :- member(X,[washington, adams, jefferson, bush]).

score(suns, 124).
score(mavericks, 97).
won(X) :- score(X, ScoreX), score(_, ScoreY), ScoreX > ScoreY.
beatthespread(X) :- score(X, ScoreX), score(Y, ScoreY),
		AdjScore is ScoreX + 4, AdjScore >= ScoreY, 
		X \= Y.      % Do not unify (match) X & Y

happy(bob).
happy(alice).
talkative(bob).
annoying(jarjar).
annoying(X) :- talkative(X), happy(X).

% Robot AI
badguy(darthvader).       % badguy/1
badguy(darthsidious).
badguy(kyloren).
badguy(batman, twoface).  % badguy/2
badguy(batman, joker).
badguy(superman, lexluthor).
fight(X) :- badguy(X).
fight(X) :- badguy(_, X).
% Poor bob & alice!
fight(X) :- annoying(X).
fight(alice).

fight(_).  % Noooooooo!

% write output when a file is consulted!
:- badguy(superman, X), write('Superman has defeated '), write(X), nl.
%:- badguy(wonderwoman, X), write('Wonder Woman has defeated '), write(X), nl.


same(X,X).

% equation A + B = C
equation(A, B, C) :- 
	same(Integer,[0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20]),
	member(A, Integer),
	member(B, Integer),
	C is A + B.

is_integer(0) :- !.
is_integer(X) :- Y is X - 1, is_integer(Y).

