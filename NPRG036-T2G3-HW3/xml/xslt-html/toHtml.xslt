<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Define the HTML output -->
    <xsl:output method="html" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Universities Overview</title>
            <style>
                body { font-family: Arial, sans-serif; line-height: 1.5; }
                table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
                th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                th { background-color: #f4f4f4; }
                h2, h3 { color: #333; }
                .section { margin-bottom: 40px; }
            </style>
        </head>
        <body>
            <h1>Universities Overview</h1>
            <!-- Select only the first university -->
            <xsl:apply-templates select="universities/university[1]"/>
        </body>
    </html>
</xsl:template>

<!-- University template -->
<xsl:template match="university">
    <div class="section">
        <h2>
            <xsl:value-of select="universityName"/>
            <span style="font-size: 0.8em; color: #666;"> (ID: <xsl:value-of select="@id"/>)</span>
        </h2>
        <p>Faculties: <xsl:value-of select="numberOfFaculties"/>, Teachers: <xsl:value-of select="numberOfTeachers"/></p>
        <p><strong>Emails:</strong>
            <xsl:for-each select="emails/email">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
        </p>

        <!-- Faculties Table -->
        <h3>Faculties</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Students</th>
                    <th>Teachers</th>
                </tr>
            </thead>
            <tbody>
                <!-- Select only the first faculty -->
                <xsl:apply-templates select="faculties/faculty[1]"/>
            </tbody>
        </table>

        <!-- Students Table -->
        <h3>Students</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Enrolled In</th>
                </tr>
            </thead>
            <tbody>
                <!-- Select only the first student -->
                <xsl:apply-templates select="students/student[1]"/>
            </tbody>
        </table>

        <!-- Teachers Table -->
        <h3>Teachers</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Teaches At</th>
                </tr>
            </thead>
            <tbody>
                <!-- Select only the first teacher -->
                <xsl:apply-templates select="teachers/teacher[1]"/>
            </tbody>
        </table>

        <!-- Research Projects Table -->
        <h3>Research Projects</h3>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Leads</th>
                </tr>
            </thead>
            <tbody>
                <!-- Select only the first research project -->
                <xsl:apply-templates select="researchProjects/researchProject[1]"/>
            </tbody>
        </table>
    </div>
</xsl:template>

<!-- Faculty template -->
<xsl:template match="faculty">
    <tr>
        <td><xsl:value-of select="facultyName"/></td>
        <td><xsl:value-of select="numberOfFacultyStudents"/></td>
        <td><xsl:value-of select="numberOfFacultyTeachers"/></td>
    </tr>
</xsl:template>

<!-- Student template -->
<xsl:template match="student">
    <tr>
        <td>
            <xsl:value-of select="givenName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="familyName"/>
        </td>
        <td><xsl:value-of select="enrolledIn"/></td>
    </tr>
</xsl:template>

<!-- Teacher template -->
<xsl:template match="teacher">
    <tr>
        <td>
            <xsl:value-of select="givenName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="familyName"/>
        </td>
        <td><xsl:value-of select="teachesAt"/></td>
    </tr>
</xsl:template>

<!-- Research Project template -->
<xsl:template match="researchProject">
    <tr>
        <td><xsl:value-of select="projectTitle"/></td>
        <td><xsl:value-of select="projectDescription"/></td>
        <td><xsl:value-of select="leads"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>