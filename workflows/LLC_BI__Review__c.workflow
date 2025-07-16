<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Field_Update_Approved_Date</fullName>
        <field>cm_Approved_Date__c</field>
        <formula>TODAY()</formula>
        <name>Field Update: Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Record_Type_Update_Review_Complete</fullName>
        <field>RecordTypeId</field>
        <lookupValue>LLC_BI__Account_Review_Complete</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record Type Update: Review Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Update_Approval</fullName>
        <field>cm_Review_Stage__c</field>
        <literalValue>Approval</literalValue>
        <name>Stage Update: Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Update_Complete</fullName>
        <field>cm_Review_Stage__c</field>
        <literalValue>Complete</literalValue>
        <name>Stage Update: Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Update_Final_Review</fullName>
        <field>cm_Review_Stage__c</field>
        <literalValue>Final Review</literalValue>
        <name>Stage Update: Final Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update_Complete</fullName>
        <field>LLC_BI__Status__c</field>
        <literalValue>Complete</literalValue>
        <name>Status Update - Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update_In_Progress</fullName>
        <field>LLC_BI__Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>Status Update: In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update_Pending_Approval</fullName>
        <field>LLC_BI__Status__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Status Update: Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Record_Type</fullName>
        <description>Updates record type to: Account Review In Progress</description>
        <field>RecordTypeId</field>
        <lookupValue>LLC_BI__Account_Review_In_Progress</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>