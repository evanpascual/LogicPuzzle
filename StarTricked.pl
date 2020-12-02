% Logic Puzzle

day(1). %sunday
day(2).	%monday
day(3).	%tuesday
day(4).	%wednesday
day(5).	%thursday
day(6).	%friday
day(7).	%saturday

enthusiast(barrada).
enthusiast(gort).
enthusiast(klatu).
enthusiast(nikto).

ufo(balloon).
ufo(clothesline).
ufo(fisbee).
ufo(watertower).




sighting(D, E, U) :- day(D), enthusiast(E), ufo(U). 

%Mr. Klatu made his sighting at some point earlier 
%in the week than the one who saw the balloon, but 
%at some point later in the week that the one who 
%spotted the frisbee (who isnt Ms. Gort)


%Fridays sighting was made by either Ms. Barrada
%or the one who saw a clothesline (or both)
sighting(D, E, U) :- D=6, E=barrada, U=_.
sighting(D, E, U) :- D=6, E=_, U=clothesline.
sighting(D, E, U) :- D=6, E=barrada, U=clothesline.

%Mr. Nikito did not make his sighting on tuesday
sighting(D, E, U) :- E=nikito, D\=3, U=_.

%Mr. Klatu isnt the one whose object turned out 
%to be a water tower
sighting(D, E, U) :- E=klatu, U\=watertower, D=_.





%PLACE EVERYTHING IN A SOLVE BLOCK LATER TO SOLVE AND PRINT RESULTS
%solve :-