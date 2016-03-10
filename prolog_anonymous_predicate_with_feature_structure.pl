/*
?-s_new,macro_consult('prolog_anonymous_predicate_with_feature_structure.pl').
    ab1c1
f_sum=3
f_num=6
f_div=5.0
factorial=243
f_fac=FA3_250
yes
LOOP = 70
*/

factorial(A,B,C):-C is A^B.

structure({
	a1:A1#(A=A1,B=b1,C=c1),
	a2:A2#(A=A2,B=b2,C=c2),
	appends:APPEND,

	f_sum:(S1,S2,S3),
	f_num:(N1,N2,N3),
	f_div:(D1,D2,D3),
	f_fac:(FA1,FA2,FA3),
	
	write:( write(X) ),
	writenl:( write(X),nl ),
	tab4_write_nl:( tab(4),write(X),nl ),


	true:true
	}
	
):-
	APPEND = atom_appends([A,B,C],X),

	%%f_sum
	freeze(S1,
		freeze(S2, S3 is S1 + S2)
	),

	%%f_num
	freeze(N1,
		freeze(N2, N3 is N1 * N2)
	),

	%%f_div
	freeze(D1,
		freeze(D2, D3 is D1 / D2)
	),

	%%f_uf
	freeze(FA1,
		freeze(FA2,factorial(FA1,FA2,FA3) )
	),
	
	true.
	
%%%%%
:-
	structure(X),
	X={
		a1:a,
	%	a2:a,
		appends:APPEND,
		tab4_write_nl:WRITE,
		
		f_sum:(S1,S2,S3),
		f_num:(N1,N2,N3),
		f_div:(10,2,D3),

		true:_
	},

	call(APPEND),
	call(WRITE),
	
	S1 is 1,S2 is 2,write(f_sum=S3),nl,
	N2 is 2,N1 is 3,write(f_num=N3),nl,
	write(f_div=D3),nl,


	factorial(3,5,FA),write(factorial=FA),nl,

	X = {f_fac:(5,_,FA3)},
	write(f_fac=FA3),nl,
	true.


