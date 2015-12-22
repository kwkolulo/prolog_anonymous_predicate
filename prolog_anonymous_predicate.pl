%?-s_new,[-'prolog_anonymous_predicate.pl'],test_anonymous_predicate(2,3,D,E).
test_anonymous_predicate(A,B,D,E):-
	X = ( 
	func(_0,_1,D):- (nonvar(_0),nonvar(_1) -> _2 is _0 + _1,D is _2 + 5 ;
                      var(_0),nonvar(_1) -> _2 is 1 + _1,D is _2 + 5 )
	),
	arg(1,X,X1),
	arg(1,X1,A),
	arg(2,X1,B),
	
	arg(2,X,X2),
	call(X2),


	Y = ( 
	func(_0,_1,E):- (nonvar(_0),nonvar(_1) -> _3 is _0 + _1 + 5,E is _3 + 10 ;
                      var(_0),nonvar(_1) -> _3 is 5 + _1,E is _3 + 10 )
	),
	arg(1,Y,Y1),
	arg(1,Y1,A),
	arg(2,Y1,B),
	
	arg(2,Y,Y2),
	call(Y2).

/*
||?-test_anonymous_predicate(2,3,D,E).
D	= 10,
E	= 20
yes
LOOP = 28
||?-test_anonymous_predicate(_,3,D,E).
_.4	= __10,
D	= 9,
E	= 18
yes
LOOP = 34
||?-func(_,3,D,E).
no

*/
