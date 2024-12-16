<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://example.org/vocabulary/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <xsl:output method="text" indent="yes"/>

    <!-- RDF Prefixes -->
    <xsl:template match="/">
        <xsl:text>@prefix ex: &lt;http://example.org/vocabulary/&gt; .&#10;</xsl:text>
        <xsl:text>@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .&#10;</xsl:text>
        <xsl:text>@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .&#10;</xsl:text>
        <xsl:text>@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .&#10;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Universities -->
    <xsl:template match="university">
        ex:<xsl:value-of select="@id"/> a ex:University ;
            ex:universityName "<xsl:value-of select="universityName"/>"@<xsl:value-of select="universityName/@xml:lang"/> ;
            ex:numberOfFaculties <xsl:value-of select="numberOfFaculties"/> ;
            ex:numberOfTeachers <xsl:value-of select="numberOfTeachers"/> 
            <xsl:if test="emails/email"> ; <xsl:for-each select="emails/email">    
            ex:email &lt;mailto:<xsl:value-of select="."/>&gt;<xsl:if test="position() != last()"> ;</xsl:if>
            </xsl:for-each>
            </xsl:if> .
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="faculties/faculty"/>
        <xsl:apply-templates select="canteens/canteen"/>
        <xsl:apply-templates select="students/student"/>
        <xsl:apply-templates select="teachers/teacher"/>
        <xsl:apply-templates select="researchProjects/researchProject"/>
    </xsl:template>


    <!-- Faculties -->
    <xsl:template match="faculty">
        ex:<xsl:value-of select="@id"/> a ex:Faculty ;
            ex:facultyName "<xsl:value-of select="facultyName"/>"@<xsl:value-of select="facultyName/@xml:lang"/> ;
            ex:numberOfFacultyStudents <xsl:value-of select="numberOfFacultyStudents"/> ;
            ex:numberOfFacultyTeachers <xsl:value-of select="numberOfFacultyTeachers"/> ;
            ex:facultyOf ex:<xsl:value-of select="facultyOf"/> .
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Canteens -->
    <xsl:template match="canteen">
        ex:<xsl:value-of select="@id"/> a ex:Canteen ;
            ex:menu "<xsl:value-of select="menu"/>"@<xsl:value-of select="menu/@xml:lang"/> ;
            ex:capacity <xsl:value-of select="capacity"/> ;
            ex:belongsTo ex:<xsl:value-of select="belongsTo"/> .
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Students -->
    <xsl:template match="student">
        ex:<xsl:value-of select="@id"/> a ex:Student ;
            ex:studentId "<xsl:value-of select="studentId"/>" ;
            ex:enrolledIn ex:<xsl:value-of select="enrolledIn"/> ;
            ex:givenName "<xsl:value-of select="givenName"/>"@<xsl:value-of select="givenName/@xml:lang"/> ;
            ex:familyName "<xsl:value-of select="familyName"/>"@<xsl:value-of select="familyName/@xml:lang"/> .
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Teachers -->
    <xsl:template match="teacher">
        ex:<xsl:value-of select="@id"/> a ex:Teacher ;
            ex:teacherId "<xsl:value-of select="teacherId"/>" ;
            ex:teachesAt ex:<xsl:value-of select="teachesAt"/> ;
            ex:givenName "<xsl:value-of select="givenName"/>"@<xsl:value-of select="givenName/@xml:lang"/> ;
            ex:familyName "<xsl:value-of select="familyName"/>"@<xsl:value-of select="givenName/@xml:lang"/> .
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Research Projects -->
    <xsl:template match="researchProject">
        ex:<xsl:value-of select="@id"/> a ex:ResearchProject ;
            ex:projectTitle "<xsl:value-of select="projectTitle"/>"@<xsl:value-of select="projectTitle/@xml:lang"/> ;
            ex:projectDescription "<xsl:value-of select="projectDescription"/>"@<xsl:value-of select="projectDescription/@xml:lang"/> ;
            ex:leads ex:<xsl:value-of select="leads"/> .
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>