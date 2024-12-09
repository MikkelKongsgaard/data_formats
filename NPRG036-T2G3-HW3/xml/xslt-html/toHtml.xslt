<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml">

    <!-- Root template -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>University Data</title>
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        margin: 20px 0;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f4f4f4;
                    }
                </style>
            </head>
            <body>
                <h1>Universities</h1>
                <!-- Iterate over universities -->
                <xsl:for-each select="universities/university">
                    <h2>
                        <xsl:value-of select="universityName" />
                    </h2>
                    <p>Number of Faculties: <xsl:value-of select="numberOfFaculties" /></p>
                    <p>Number of Teachers: <xsl:value-of select="numberOfTeachers" /></p>
                    <p>
                        Emails:
                        <xsl:for-each select="emails/email">
                            <span><xsl:value-of select="." /></span>
                            <xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                </xsl:for-each>

                <h1>Faculties</h1>
                <!-- Iterate over faculties -->
                <xsl:apply-templates select="universities/faculties/faculty" />
            </body>
        </html>
    </xsl:template>

    <!-- Template to transform faculty data -->
    <xsl:template match="faculty">
        <h2>
            <xsl:value-of select="facultyName" />
        </h2>
        <table>
            <tr>
                <th>Attribute</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>Number of Students</td>
                <td><xsl:value-of select="numberOfFacultyStudents" /></td>
            </tr>
            <tr>
                <td>Number of Teachers</td>
                <td><xsl:value-of select="numberOfFacultyTeachers" /></td>
            </tr>
        </table>

        <!-- Canteen -->
        <h3>Canteen</h3>
        <xsl:for-each select="/universities/canteens/canteen[belongsTo=current()/@id]">
            <table>
                <tr>
                    <th>Menu</th>
                    <th>Capacity</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="menu" /></td>
                    <td><xsl:value-of select="capacity" /></td>
                </tr>
            </table>
        </xsl:for-each>

        <!-- Teachers -->
        <h3>Teachers</h3>
        <xsl:for-each select="/universities/teachers/teacher[teachesAt=current()/@id]">
            <table>
                <tr>
                    <th>Teacher ID</th>
                    <th>Given Name</th>
                    <th>Family Name</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="teacherId" /></td>
                    <td><xsl:value-of select="givenName" /></td>
                    <td><xsl:value-of select="familyName" /></td>
                </tr>
            </table>
        </xsl:for-each>

        <!-- Students -->
        <h3>Students</h3>
        <xsl:for-each select="/universities/students/student[enrolledIn=current()/@id]">
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Given Name</th>
                    <th>Family Name</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="studentId" /></td>
                    <td><xsl:value-of select="givenName" /></td>
                    <td><xsl:value-of select="familyName" /></td>
                </tr>
            </table>
        </xsl:for-each>

        <!-- Research Projects -->
        <h3>Research Projects</h3>
        <xsl:for-each select="/universities/researchProjects/researchProject[leads=current()/@id]">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="projectTitle" /></td>
                    <td><xsl:value-of select="projectDescription" /></td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
