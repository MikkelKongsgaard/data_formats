.["@graph"] | map(select(.["@type"] == "ex:Faculty")) | map(.numberOfFacultyStudents) | add
