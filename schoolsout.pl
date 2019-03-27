







/* definitions (facts) */
teacher(appleton).
teacher(gross).
teacher(knight).
teacher(mcevoy).
teacher(parnell).

man(knight).
man(mcevoy).
woman(appleton).
woman(gross).
woman(parnell).

subject(english).
subject(gym).
subject(history).
subject(math).
subject(science).

state(california).
state(florida).
state(maine).
state(oregon).
state(virginia).

activity(antiquing).
activity(camping).
activity(sightseeing).
activity(spelunking).
activity(waterskiing).


solve(Groups) :-
   /*This is an enumeration of eveything we need to find*/
   subject(AppletonSubject),
   subject(GrossSubject),
   subject(KnightSubject),
   subject(McevoySubject),
   subject(ParnellSubject),
   all_different([AppletonSubject,
      GrossSubject,
      KnightSubject,
      McevoySubject,
      ParnellSubject]),

   state(AppletonState),
   state(GrossState),
   state(KnightState),
   state(McevoyState),
   state(ParnellState),
   all_different([AppletonState,
      GrossState,
      KnightState,
      McevoyState,
      ParnellState]),

   activity(AppletonActivity),
   activity(GrossActivity),
   activity(KnightActivity),
   activity(McevoyActivity),
   activity(ParnellActivity),
   all_different([AppletonActivity,
      GrossActivity,
      KnightActivity,
      McevoyActivity,
      ParnellActivity]),

   Groups  = [ [appleton, AppletonSubject, AppletonState, AppletonActivity],
                  [gross, GrossSubject, GrossState, GrossActivity],
                  [knight, KnightSubject, KnightState, KnightActivity],
                  [mcevoy, McevoySubject, McevoyState, McevoyActivity],
                  [parnell, ParnellSubject, ParnellState, ParnellActivity]],

   %1

   ( member([gross, math, _, _], Groups) ; member([gross, science, _, _], Groups) ),
   ( member([gross, _, florida, antiquing], Groups) ;
      member([gross, _, california, _], Groups), \+ member([gross, _, _, antiquing], Groups) ),

   %2
   ( member([_, science, california, waterskiing], Groups) ;
      member([_, science, florida, waterskiing], Groups) ),
   ( member([mcevoy, history, maine, _], Groups) ;
      member([mcevoy, history, oregon, _], Groups) ),

    %3

   ( member([appleton, english, virginia, _], Groups) ;
      member([parnell, _, virginia, _], Groups) ),
   member([parnell, _, _, spelunking], Groups),


   %4 is good

   \+ member([_, gym, maine, _], Groups),
   \+ member([_, _, maine, sightseeing], Groups),

   %5 is good
   woman(X),
   woman(Y),
   \+ member([gross, _, _, camping], Groups),
   member([X, _, _, camping], Groups),
   member([Y, _, _, antiquing], Groups).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).
