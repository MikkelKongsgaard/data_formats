// finds the name of the university where the student with studentID 'S001' is enrolled
MATCH (student:Student {studentID: 'S001'})-[:ENROLLED_IN]->(faculty:Faculty)-[:BELONGS_TO]->(uni:Uni)
RETURN uni.name AS UniversityName