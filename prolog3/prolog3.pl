% flip_first_three/2
flip_first_three([H1, H2, H3 | T], [H3, H2, H1 | T]).

% reverse a list
%myreverse(X,Y) :- reverse(X,Y).
myreverse0([],[]).
myreverse0([H | T], [T1 | H]) :- myreverse0(T,T1).

myreverse1([X],[X]).
myreverse1([H | T], [T1 | H]) :- myreverse1(T,T1).

myreverse([],[]).
myreverse([H | T], Result) :- myreverse(T,T1), append(T1, [H], Result).

% append
myappend0([], X, X).
myappend0([H | T], X, [H | [T, X] ]).

myappend([], X, X).
myappend([H | T], X, [H | Result ]) :- myappend(T, X, Result).

% change for a dollar
change(H, Q, D, N, P) :- 
    member(N, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
    member(D, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
    member(Q, [0, 1, 2, 3, 4]),
    member(H, [0, 1, 2]),
	S is ( (H * 50) + (Q * 25) + (D * 10) + (N * 5) ),
	S =< 100, 
	P is 100 - S.


% source=red, center=green, destination=blue
hanoi(N) :- move(N, red, green, blue).
move(1, S, _, D) :- 
    write('Move top disk from '), 
	write(S), write(' to '), write(D), nl.
move(N, Source, Center, Destination) :- 
	N > 1, 
	M is N - 1,
	move(M, Source, Destination, Center),  % Move N-1 disks from source to center
	move(1, Source, _, Destination),       % Move bottom disk from source to destination
	move(M, Source, Center, Destination).  % Move N-1 disks from center to destination

double([], []) :- !.
double([H|T], [H2|T2]) :- !, double(H, H2), double(T, T2).
double(X, Y) :- Y is X * 2.

% Cut
%warm_blooded(dinosaur).
warm_blooded(cat).
warm_blooded(dog).
warm_blooded(chicken).
four_legs(cat).
four_legs(dog).
two_legs(chicken).

mammal0(M) :- warm_blooded(M), four_legs(M).
mammal1(M) :- !, warm_blooded(M), four_legs(M).
mammal1(dinosaur).
mammal2(M) :- warm_blooded(M), !, four_legs(M).
mammal2(greatwhiteshark).
mammal3(M) :- warm_blooded(M), four_legs(M), !.


% reverse order of clauses from mammal2
mammal4(M) :- four_legs(M), !, warm_blooded(M).

% same as mammal2, but after mammal5 facts
mammal5(greatwhiteshark).
mammal5(dinosaur).
mammal5(M) :- warm_blooded(M), !, four_legs(M).


all_mammals(X) :- findall(M, mammal0(M), X).
