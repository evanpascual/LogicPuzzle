% Logic Puzzle

day(sunday).
day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).
day(saturday).

enthusiast(berrada).
enthusiast(gort).
enthusiast(klatu).
enthusiast(nikto).

ufo(balloon).
ufo(clothesline).
ufo(fisbee).
ufo(watertower).

sighting(D, E, U) :- day(D), enthusiast(E), ufo(U).

%solve :-
    
    %Mr. Klatu isnt the one whose object turned out 
    %to be a water tower
    
    
    %Mr. Nikito did not make his sighting on tuesday
    
    
	%Fridays sighting was made by either Ms. Barrada
    %or the one who saw a clothesline (or both)
    
    
    %Mr. Klatu made his sighting at some point earlier 
    %in the week than the one who saw the balloon, but 
    %at some point later in the week that the one who 
    %spotted the frisbee (who isnt Ms. Gort)