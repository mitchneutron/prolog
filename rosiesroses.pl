







/* definitions (facts) */
customer(hugh).
customer(ida).
customer(jeremy).
customer(leroy).
customer(stella).

rose(cottageBeauty).
rose(goldenSunset).
rose(mountainBloom).
rose(pinkParadise).
rose(sweetDreams).

event(anniversaryParty).
event(charityAuction).
event(retirementBanquet).
event(seniorProm).
event(wedding).

item(balloons).
item(candles).
item(chocolates).
item(placeCards).
item(streamers).

solve(Groups) :-
   /*This is an enumeration of eveything we need to find*/
   rose(HughRose), rose(IdaRose), rose(JeremyRose), rose(LeroyRose), rose(StellaRose),
   all_different([HughRose, IdaRose, JeremyRose, LeroyRose, StellaRose]),

   event(HughEvent), event(IdaEvent), event(JeremyEvent), event(LeroyEvent), event(StellaEvent),
   all_different([HughEvent, IdaEvent, JeremyEvent, LeroyEvent, StellaEvent]),

   item(HughItem), item(IdaItem), item(JeremyItem), item(LeroyItem), item(StellaItem),
   all_different([HughItem, IdaItem, JeremyItem, LeroyItem, StellaItem]),




   Groups  = [ [hugh, HughRose, HughItem, HughEvent],
                  [ida, IdaRose, IdaItem, IdaEvent],
                  [jeremy, JeremyRose, JeremyItem, JeremyEvent],
                  [leroy, LeroyRose, LeroyItem, LeroyEvent],
                  [stella, StellaRose, StellaItem, StellaEvent] ],

/*
   rel(jeremy, seniorProm).
   rel(stella, cottageBeauty).
   rel(hugh, pinkParadise).
   rel(anniversaryParty, streamers).
   rel(wedding, balloons).
   rel(sweetDreams, chocolates).
   rel(seniorProm, candles).
   \+ rel(stella, wedding).
   \+ rel(hugh, charityAuction).
   \+ rel(hugh, wedding).
   \+ rel(jeremy, mountainBloom).
   rel(leroy, retirementBanquet).
*/
   \+ member([stella, _, _, wedding], Groups),
   \+ member([hugh, _, _, charityAuction], Groups),
   \+ member([hugh, _, _, wedding], Groups),
   \+ member([jeremy, mountainBloom, _, _], Groups),
   member([leroy, _, _, retirementBanquet], Groups),
   member([jeremy, _, _, seniorProm], Groups),
   member([stella, cottageBeauty, _, _], Groups),
   member([hugh, pinkParadise, _, _], Groups),
   member([_, _, streamers, anniversaryParty], Groups),
   member([_, _, balloons, wedding], Groups),
   member([_, sweetDreams, chocolates, _], Groups),
   member([_, _, candles, seniorProm], Groups).

/*
   tell(hugh, HughRose, HughItem, HughEvent),
   tell(ida, IdaRose, IdaItem, IdaEvent),
   tell(jeremy, JeremyRose, JeremyItem, JeremyEvent),
   tell(leroy, LeroyRose, LeroyItem, LeroyEvent),
   tell(stella, StellaRose, StellaItem, StellaEvent).
*/




/*
group(Customer, Rose, Event, Item) :-
rel(Customer, Rose),
rel(Customer, Event),
rel(Customer, Item),
customer(Customer),
rose(Rose),
event(Event),
item(Item).

rel(X, Y) :- rel(X, B), !, rel(B, Y).

rel(X,Y) :- rel(Y,X).
*/

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).
