path(fresno,seattle).
path(fresno,albany).
path(fresno,boston).
path(seattle,omaha).
path(seattle,dallas).
path(omaha,albany).
path(omaha,atlanta).
path(albany,dallas).
path(albany,seattle).
path(atlanta,albany).
path(atlanta,boston).
path(atlanta,dallas).
path(dallas,seattle).
path(dallas,albany).

route(A,B) :- path(A,B).
route(A,B) :- route(A,X),path(X,B).