// Find the name of the faculty that Marek is enrolled in
MATCH (fac:Faculty)<-[:ENROLLED_IN]-(s:Student {givenName: 'Marek'})
RETURN fac.name