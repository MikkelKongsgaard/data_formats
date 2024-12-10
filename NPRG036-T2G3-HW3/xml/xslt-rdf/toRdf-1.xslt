<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:ex="http://example.org/vocabulary/"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

<xsl:output method="text" indent="yes" />

<!-- RDF Prefixes -->
<xsl:template match="/">
    <xsl:text>@prefix ex: &lt;http://example.org/vocabulary/&gt; .&#10;</xsl:text>
    <xsl:text>@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .&#10;</xsl:text>
    <xsl:text>@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .&#10;</xsl:text>
    <xsl:text>@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .&#10;</xsl:text>
    <xsl:apply-templates/>
</xsl:template>

<!-- University -->
<xsl:template match="university">
    ex:<xsl:value-of select="@id"/> a ex:University ;
        ex:universityName "<xsl:value-of select="universityName" />"@en ;
        ex:numberOfFaculties <xsl:value-of select="numberOfFaculties" /> ;
        ex:numberOfTeachers <xsl:value-of select="numberOfTeachers" /> ; <xsl:for-each select="emails/email">
        ex:email &lt;mailto:<xsl:value-of select="." />&gt; <xsl:if test="position() != last()"> ;</xsl:if>
        </xsl:for-each>
    <xsl:text>.</xsl:text>
    <xsl:value-of select="'&#10;'" />
    <xsl:apply-templates select="faculties/faculty"/>
</xsl:template>

<!-- Faculties -->
<xsl:template match="faculty">
    ex:<xsl:value-of select="@id" /> a ex:Faculty ;
        ex:facultyName" <xsl:value-of select="facultyName" />"@en ;
        ex:numberOfFacultyStudents <xsl:value-of select="numberOfFacultyStudents" /> ;
        ex:numberOfFacultyTeachers <xsl:value-of select="numberOfFacultyTeachers" /> ;
        ex:facultyOf ex:<xsl:value-of select="facultyOf"/> .
    <xsl:value-of select="'&#10;'" />
    <xsl:apply-templates select="canteen"/>
    <xsl:apply-templates select="teachers/teacher"/>
    <xsl:apply-templates select="students/student"/>
    <xsl:apply-templates select="researchProjects/researchProject"/>
</xsl:template>

<!-- Teachers -->
<xsl:template match="teacher">
    ex:<xsl:value-of select="@id"/> a ex:Teacher ;
        ex:teacherId "<xsl:value-of select="teacherId" />" ;
        ex:teachesAt ex:<xsl:value-of select="teachesAt" /> ;
        ex:givenName "<xsl:value-of select="givenName" />"@en ;
        ex:familyName "<xsl:value-of select="familyName" />"@en .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Students -->
<xsl:template match="student">
    ex:<xsl:value-of select="@id"/> a ex:Student ;
        ex:studentId "<xsl:value-of select="studentId" />" ;
        ex:enrolledIn ex:<xsl:value-of select="enrolledIn" /> ;
        ex:givenName "<xsl:value-of select="givenName" />"@en ;
        ex:familyName "<xsl:value-of select="familyName" />"@en .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Canteen -->
<xsl:template match="canteen">
    ex:<xsl:value-of select="@id"/> a ex:Canteen ;
        ex:menu "<xsl:value-of select="menu" />"@en ;
        ex:capacity <xsl:value-of select="capacity" /> ;
        ex:belongsTo ex:<xsl:value-of select="belongsTo" /> .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Research Projects -->
<xsl:template match="researchProject">
    ex:<xsl:value-of select="@id"/> a ex:ResearchProject ;
        ex:projectTitle "<xsl:value-of select="projectTitle" />"@en ;
        ex:projectDescription "<xsl:value-of select="projectDescription" />"@en ;
        ex:leads ex:<xsl:value-of select="leads" /> .
    <xsl:value-of select="'&#10;'" />
</xsl:template>



</xsl:stylesheet>