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
                <h1>University Faculties</h1>
                <xsl:apply-templates select="university/faculties/faculty" />
            </body>
        </html>
    </xsl:template>

    <!-- Template to transform faculty data -->
    <xsl:template match="faculty">
        <h2>
            <xsl:value-of select="name" />
        </h2>
        <table>
            <tr>
                <th>Attribute</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>Number of Students</td>
                <td><xsl:value-of select="numberOfStudents" /></td>
            </tr>
            <tr>
                <td>Number of Teachers</td>
                <td><xsl:value-of select="numberOfTeachers" /></td>
            </tr>
        </table>

        <!-- Teachers -->
        <h3>Teachers</h3>
        <xsl:if test="teachers/teacher">
            <table>
                <tr>
                    <th>Teacher ID</th>
                    <th>Given Name</th>
                    <th>Family Name</th>
                </tr>
                <xsl:for-each select="teachers/teacher">
                    <tr>
                        <td><xsl:value-of select="teacherID" /></td>
                        <td><xsl:value-of select="givenName" /></td>
                        <td><xsl:value-of select="familyName" /></td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        <xsl:if test="not(teachers/teacher)">
            <p>No teachers available.</p>
        </xsl:if>

        <!-- Students -->
        <h3>Students</h3>
        <xsl:if test="students/student">
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Given Name</th>
                    <th>Family Name</th>
                </tr>
                <xsl:for-each select="students/student">
                    <tr>
                        <td><xsl:value-of select="studentID" /></td>
                        <td><xsl:value-of select="givenName" /></td>
                        <td><xsl:value-of select="familyName" /></td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        <xsl:if test="not(students/student)">
            <p>No students available.</p>
        </xsl:if>

        <!-- Research Projects -->
        <h3>Research Projects</h3>
        <xsl:if test="researchProjects/researchProject">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
                <xsl:for-each select="researchProjects/researchProject">
                    <tr>
                        <td><xsl:value-of select="title" /></td>
                        <td><xsl:value-of select="description" /></td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        <xsl:if test="not(researchProjects/researchProject)">
            <p>No research projects available.</p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>