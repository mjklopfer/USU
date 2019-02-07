paths = {'Fresno':['Seattle','Albany','Boston'],
	'Seattle':['Omaha','Dallas'],
	'Omaha':['Albany','Atlanta'],
	'Albany':['Dallas','Seattle'],
	'Boston':[],
	'Atlanta':['Boston','Albany','Dallas'],
	'Dallas':['Albany','Seattle'] }

def find_route(paths,start,end,route=[]):
	route=route+[start]
	if start==end:
		return route
	if not paths.has_key(start):
		return None
	for city in paths[start]:
		if city not in route:
			newroute=find_route(paths,city,end,route)
			if newroute:return newroute
	return None

print "Route from Fresno to Dallas:"
print find_route(paths,'Fresno','Dallas')
print "Route from Seattle to Boston:"
print find_route(paths,'Seattle','Boston')
print "Route from Atlanta to Fresno:"
print find_route(paths,'Atlanta','Fresno')


