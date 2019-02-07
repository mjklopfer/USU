%Nathan Tipton A01207112
%Father of Ares: zeus
%Mother of Apollo:leto
%Children of Uranus:cyclope,chronos,coeus,oceanus
%Son of Zeus: apollo, ares
%Daughter of Gaea:false
%All siblings of Hades:poseidon,zeus
%Aunt of Leto: false




father(F,Y) :- parent(F,Y),male(F).
mother(M,Y) :- parent(M,Y),female(M).
child(X,P) :- parent(P,X).
son(X,P) :- child(X,P),male(X).
daughter(X,P) :- child(X,P),female(X).
sibling(X,Y) :- father(F,X),father(F,Y),mother(M,X),mother(M,Y),X\=Y.
aunt(A,X) :- female(A),((sibling(A,M),mother(M,X));(sibling(A,F),father(F,X))).


parent(chaos, gaea). 
parent(gaea, cyclope). 
parent(gaea, chronos). 
parent(gaea, coeus). 
parent(gaea, oceanus). 
parent(uranus, cyclope). 
parent(uranus, chronos). 
parent(uranus, coeus). 
parent(uranus, oceanus). 
parent(chronos, hades). 
parent(chronos, poseidon). 
parent(chronos, zeus). 
parent(rhea, hades). 
parent(rhea, poseidon). 
parent(rhea, zeus). 
parent(coeus, leto). 
parent(phoebe, leto). 
parent(leto, apollo). 
parent(leto, artemis). 
parent(zeus, apollo). 
parent(zeus, artemis).
parent(oceanus, iapetus). 
parent(tethys, iapetus). 
parent(hera, ares). 
parent(zeus, ares). 
male(chaos). 
male(cyclope). 
male(uranus). 
male(chronos). 
male(coeus). 
male(oceanus). 
male(hades). 
male(poseidon). 
male(zeus). 
male(ares). 
male(apollo). 
male(iapetus). 
female(gaea). 
female(rhea). 
female(leto). 
female(hera). 
female(phoebe). 
female(tethys). 
female(artemis).