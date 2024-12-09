// Return the full names of all teachers and the faculties they teach at
MATCH (teacher:Teacher)-[:TEACHES_AT]->(faculty:Faculty)
RETURN teacher.givenName, teacher.familyName, faculty.name