<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Default_Opportunity_Name</fullName>
        <description>Enforces an Opportunity naming convention. Added for the Commercial Accelerate project.</description>
        <field>Name</field>
        <formula>IF(LEN(Account.Name) &gt; 120,
LEFT(Account.Name, 89),
Account.Name
) &amp; &apos; - &apos; &amp; &apos;$&apos; &amp;
IF(ISBLANK(Amount),
&apos;0&apos;,
IF(
Amount &gt;= 1000000,
TEXT(FLOOR(Amount / 1000000)) &amp; &apos;,&apos;,
&apos;&apos;) &amp;
IF(
Amount &gt;= 1000,
RIGHT(TEXT(FLOOR(Amount / 1000)), 3) &amp; &apos;,&apos;,
&apos;&apos;) &amp;
RIGHT(TEXT(FLOOR(Amount)), 3) &amp; &apos;.&apos; &amp;
IF(
MOD(Amount, 1) * 100 &lt; 10,
&apos;0&apos; &amp; TEXT(ROUND(MOD(Amount, 1), 2) * 100),
TEXT(MIN(ROUND(MOD(Amount, 1), 2) * 100, 99))
)) &amp; &apos; - &apos; &amp; TEXT(MONTH(DATEVALUE(CreatedDate))) &amp; &apos;/&apos; &amp; TEXT(DAY(DATEVALUE(CreatedDate))) &amp; &apos;/&apos; &amp; TEXT(YEAR(DATEVALUE(CreatedDate)))</formula>
        <name>Default Opportunity Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Update_Qualification</fullName>
        <field>StageName</field>
        <literalValue>Qualification</literalValue>
        <name>Stage Update - Qualification</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_to_Prospecting</fullName>
        <description>Updates Opportunity stage to Prospecting. Added for the Commercial Accelerate project.</description>
        <field>StageName</field>
        <literalValue>Prospecting</literalValue>
        <name>Update Stage to Prospecting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>