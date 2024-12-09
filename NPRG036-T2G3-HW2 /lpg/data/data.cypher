// Creating the nodes
CREATE (:Uni {name: 'CUNI', numberOfStudents: 1000, numberOfTeachers: 500, email: ['info@cuni.edu', 'admissions@cuni.edu']});
CREATE (:Uni {name: 'CVUT', numberOfStudents: 1200, numberOfTeachers: 600});
CREATE (:Uni {name: 'VSE', numberOfStudents: 800, numberOfTeachers: 450, email: ['admin@vse.cz', 'info@vse.cz']});

CREATE (:Faculty {name: 'MFF', numberOfStudents: 200, numberOfTeachers: 100});
CREATE (:Faculty {name: 'Faculty of History', numberOfStudents: 150, numberOfTeachers: 75});
CREATE (:Faculty {name: 'Faculty of Engineering', numberOfStudents: 180, numberOfTeachers: 90});

CREATE (:Canteen {menu: 'Pizza, Salad, Soup', capacity: 200});
CREATE (:Canteen {menu: 'Sushi, Rice Bowls, Noodles', capacity: 150});
CREATE (:Canteen {menu: 'Burgers, Fries, Coffee', capacity: 100});

CREATE (:Student {studentID: 'S001', givenName: 'Marek', familyName: 'Most'});
CREATE (:Student {studentID: 'S002', givenName: 'Petra', familyName: 'Zima'});
CREATE (:Student {studentID: 'S003', givenName: 'Andrea', familyName: 'Misuk'});

CREATE (:Teacher {teacherID: 'T001', givenName: 'Martin', familyName: 'Jakov'});
CREATE (:Teacher {teacherID: 'T002', givenName: 'Filip', familyName: 'Cerny'});
CREATE (:Teacher {teacherID: 'T003', givenName: 'Vojtech', familyName: 'Mraz'});

CREATE (:ResearchProject {projectTitle: 'AI for Climate Change', projectDescription: 'Research on AI models for climate action'});
CREATE (:ResearchProject {projectTitle: 'Art History Analysis', projectDescription: 'Digital tools for art history'});
CREATE (:ResearchProject {projectTitle: 'Sustainable Engineering', projectDescription: 'Research on sustainable engineering practices'});

// Creating relationships with LPG properties

MERGE (uni:Uni {name: 'CUNI'}) 
MERGE (faculty:Faculty {name: 'MFF'})
MERGE (faculty)-[:FACULTY_OF {since: 1990}]->(uni);

MERGE (uni:Uni {name: 'CVUT'}) 
MERGE (faculty:Faculty {name: 'Faculty of History'})
MERGE (faculty)-[:FACULTY_OF {since: 1915}]->(uni);

MERGE (uni:Uni {name: 'VSE'}) 
MERGE (faculty:Faculty {name: 'Faculty of Engineering'})
MERGE (faculty)-[:FACULTY_OF {since: 1952}]->(uni);

MERGE (faculty:Faculty {name: 'MFF'}) 
MERGE (canteen:Canteen {menu: 'Pizza, Salad, Soup'})
MERGE (canteen)-[:BELONGS_TO {operatingHours: '8am - 6pm'}]->(faculty);

MERGE (faculty:Faculty {name: 'Faculty of History'}) 
MERGE (canteen:Canteen {menu: 'Sushi, Rice Bowls, Noodles'})
MERGE (canteen)-[:BELONGS_TO {operatingHours: '9am - 7pm'}]->(faculty);

MERGE (faculty:Faculty {name: 'Faculty of Engineering'}) 
MERGE (canteen:Canteen {menu: 'Burgers, Fries, Coffee'})
MERGE (canteen)-[:BELONGS_TO {operatingHours: '7am - 5pm'}]->(faculty);

MERGE (student:Student {studentID: 'S001'}) 
MERGE (faculty:Faculty {name: 'MFF'})
MERGE (student)-[:ENROLLED_IN {enrollmentDate: '2020-09-01'}]->(faculty);

MERGE (student:Student {studentID: 'S002'}) 
MERGE (faculty:Faculty {name: 'Faculty of History'})
MERGE (student)-[:ENROLLED_IN {enrollmentDate: '2021-09-01'}]->(faculty);

MERGE (student:Student {studentID: 'S003'}) 
MERGE (faculty:Faculty {name: 'Faculty of Engineering'})
MERGE (student)-[:ENROLLED_IN {enrollmentDate: '2022-09-01'}]->(faculty);

MERGE (teacher:Teacher {teacherID: 'T001'}) 
MERGE (faculty:Faculty {name: 'MFF'})
MERGE (teacher)-[:TEACHES_AT {startDate: '2015-08-01'}]->(faculty);

MERGE (teacher:Teacher {teacherID: 'T002'}) 
MERGE (faculty:Faculty {name: 'Faculty of History'})
MERGE (teacher)-[:TEACHES_AT {startDate: '2017-01-15'}]->(faculty);

MERGE (teacher:Teacher {teacherID: 'T003'}) 
MERGE (faculty:Faculty {name: 'Faculty of Engineering'})
MERGE (teacher)-[:TEACHES_AT {startDate: '2020-05-01'}]->(faculty);

MERGE (project:ResearchProject {projectTitle: 'AI for Climate Change'}) 
MERGE (faculty:Faculty {name: 'MFF'})
MERGE (project)-[:LEAD_BY {funding: 'government'}]->(faculty);

MERGE (project:ResearchProject {projectTitle: 'Art History Analysis'}) 
MERGE (faculty:Faculty {name: 'Faculty of History'})
MERGE (project)-[:LEAD_BY {funding: 'private'}]->(faculty);

MERGE (project:ResearchProject {projectTitle: 'Sustainable Engineering'}) 
MERGE (faculty:Faculty {name: 'Faculty of Engineering'})
MERGE (project)-[:LEAD_BY {funding: 'corporate'}]->(faculty);
