<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:ex="http://example.org/university#"
xmlns:foaf="http://xmlns.com/foaf/0.1/">

<xsl:output method="text" indent="yes" />

<!-- RDF Prefixes -->
<xsl:template match="/">
    <xsl:text>@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .&#10;</xsl:text>
    <xsl:text>@prefix ex: &lt;http://example.org/university#&gt; .&#10;</xsl:text>
    <xsl:text>@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .&#10;</xsl:text>
    <xsl:apply-templates/>
</xsl:template>

    <!-- University -->
<xsl:template match="university">
    ex:<xsl:call-template name="generate-university-id"/> a ex:University ;
        ex:universityName "<xsl:value-of select="name" />"@en ;
        ex:numberOfFaculties <xsl:value-of select="count(faculties/faculty)" /> ;
        ex:numberOfTeachers <xsl:value-of select="numberOfTeachers" /> ; <xsl:for-each select="email">
        ex:email &lt;mailto:<xsl:value-of select="." />&gt; <xsl:if test="position() != last()"> ;</xsl:if>
        </xsl:for-each>
    <xsl:text>.</xsl:text>
    <xsl:value-of select="'&#10;'" />
    <xsl:apply-templates select="faculties/faculty"/>
</xsl:template>

<!-- Generate University ID -->
<xsl:template name="generate-university-id">
    <xsl:text>uni</xsl:text>
    <xsl:value-of select="position()"/>
</xsl:template>

<!-- Faculties -->
<xsl:template match="faculty">
    ex:<xsl:value-of select="translate(name, ' ', '_')" /> a ex:Faculty ;
        ex:name "<xsl:value-of select="name" />"@en ;
        ex:numberOfStudents <xsl:value-of select="numberOfStudents" /> ;
        ex:numberOfTeachers <xsl:value-of select="numberOfTeachers" /> ;
        ex:facultyOf ex:uni1 .
    <xsl:value-of select="'&#10;'" />
    <xsl:apply-templates select="canteen"/>
    <xsl:apply-templates select="teachers/teacher"/>
    <xsl:apply-templates select="students/student"/>
    <xsl:apply-templates select="researchProjects/researchProject"/>
</xsl:template>

<!-- Teachers -->
<xsl:template match="teacher">
    ex:teacher_<xsl:value-of select="generate-id()"/> a ex:Teacher ;
        ex:teacherId "<xsl:value-of select="teacherID" />" ;
        ex:teachesAt ex:<xsl:value-of select="translate(../../name, ' ', '_')" /> ;
        foaf:givenName "<xsl:value-of select="givenName" />"@en ;
        foaf:familyName "<xsl:value-of select="familyName" />"@en .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Students -->
<xsl:template match="student">
    ex:student_<xsl:value-of select="generate-id()"/> a ex:Student ;
        ex:studentId "<xsl:value-of select="studentID" />" ;
        ex:studiesAt ex:<xsl:value-of select="translate(../../name, ' ', '_')" /> ;
        foaf:givenName "<xsl:value-of select="givenName" />"@en ;
        foaf:familyName "<xsl:value-of select="familyName" />"@en .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Canteen -->
<xsl:template match="canteen">
    ex:canteen_<xsl:value-of select="generate-id()"/> a ex:Canteen ;
        ex:menu "<xsl:value-of select="menu" />"@en ;
        ex:capacity <xsl:value-of select="capacity" /> ;
        ex:belongsTo ex:<xsl:value-of select="translate(../name, ' ', '_')" /> .
    <xsl:value-of select="'&#10;'" />
</xsl:template>

<!-- Research Projects -->
<xsl:template match="researchProject">
    ex:researchProject_<xsl:value-of select="generate-id()"/> a ex:ResearchProject ;
        ex:title "<xsl:value-of select="title" />"@en ;
        ex:description "<xsl:value-of select="description" />"@en ;
        ex:leads ex:<xsl:value-of select="translate(../../name, ' ', '_')" /> .
    <xsl:value-of select="'&#10;'" />
</xsl:template>



</xsl:stylesheet>