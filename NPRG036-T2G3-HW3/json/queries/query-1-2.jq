.universities[].facultyOf[] | 
    (.enrolledIn[] | {type: "Student", fullName: (.givenName["@value"] + " " + .familyName["@value"])}),
    (.teachesAt[] | {type: "Teacher", fullName: (.givenName["@value"] + " " + .familyName["@value"])})
