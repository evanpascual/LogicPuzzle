% Logic Puzzle

day(1). %tuesday
day(2).	%wednesday
day(3).	%thursday
day(4).	%friday

enthusiast(barrada).
enthusiast(gort).
enthusiast(klatu).
enthusiast(nikto).

ufo(balloon).
ufo(clothesline).
ufo(frisbee).
ufo(watertower).

% predicate functions for ordering the days
before(X, Y) :- X < Y.
after(X, Y) :- X > Y.

% getter function for 'Triples' data structure
getter([X|_], X).
getter([_|T], X) :- getter(T, X).

% Succeed if all elements of the argument list are bound and different.
% Fail if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.        % (1)
all_different([_ | T]) :- all_different(T).             % (2)
all_different([_]).                                     % (3)

% Write out an English sentence with the solution.
tell(X, Y, Z) :-
    write('Mr./Ms. '), write(X), write(' saw a '), write(Y),
    write(' on '), 
    		( Z =:= 1 ->
        	write('Tuesday');
          Z =:= 2 ->
        	write('Wednesday');
          Z =:= 3 ->
        	write('Thursday');
          Z =:= 4 ->
        	write('Friday') )
    , write('.'), nl.

solve :-
	ufo(BarradaUFO), ufo(GortUFO), ufo(KlatuUFO), ufo(NikitoUFO),
	all_different([BarradaUFO, GortUFO, KlatuUFO, NikitoUFO]),

	day(BarradaDay), day(GortDay), day(KlatuDay), day(NiktoDay),
	all_different([BarradaDay, GortDay, KlatuDay, NiktoDay]),
    
	Triples = [ [barrada, BarradaUFO, BarradaDay],
				[gort, GortUFO, GortDay],
				[klatu, KlatuUFO, KlatuDay],
				[nikto, NikitoUFO, NiktoDay] ],

	% 1 - Mr. Klatu made his sighting at some point earlier in the week than the one who saw the balloon, but at some point later in the week than the one who spotted the frisbee (who isnt Ms. Gort).
	getter(Triples, [_, balloon, BalloonDay]),
	getter(Triples, [_, frisbee, FrisbeeDay]),
	before(KlatuDay, BalloonDay),
	after(KlatuDay, FrisbeeDay),
	\+ member([gort, frisbee, _], Triples), % (   who isn't Ms.Gort	 ) 

	% 2 - Fridays sighting was made by either Ms. Barrada or the one who saw a clothesline (or both).
	( member([barrada, _, 4], Triples);
	  member([_, clothesline, 4], Triples);
	  member([barrada, clothesline, 4], Triples) ),

	% 3 - Mr. Nikto did not make his sighting on Tuesday.
	\+ member([nikto, _, 1], Triples),

	% 4 - Mr. Klatu is not the one whose object turned out to be a water tower.
	\+ member([klatu, watertower, _], Triples),

	tell(barrada, BarradaUFO, BarradaDay),
	tell(gort, GortUFO, GortDay),
	tell(klatu, KlatuUFO, KlatuDay),
	tell(nikto, NikitoUFO, NiktoDay).


