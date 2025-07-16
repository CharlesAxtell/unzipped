<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>PP_Approval_Step_1</fullName>
        <field>LLC_BI__Status__c</field>
        <literalValue>Approval Step 1</literalValue>
        <name>PP-Approval Step 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PP_Approval_Step_2</fullName>
        <description>Changes the PP Status to Approval Step 2 for propagation</description>
        <field>LLC_BI__Status__c</field>
        <literalValue>Approval Step 2</literalValue>
        <name>PP-Approval Step 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PP_Approval_Step_3</fullName>
        <description>Changes the PP Status to Approval Step 3 for propagation</description>
        <field>LLC_BI__Status__c</field>
        <literalValue>Approval Step 3</literalValue>
        <name>PP-Approval Step 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PP_Approval_Step_4</fullName>
        <description>Changes the PP Status to Approval Step 4 for propagation</description>
        <field>LLC_BI__Status__c</field>
        <literalValue>Approval Step 4</literalValue>
        <name>PP-Approval Step 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product_Package_Default_App</fullName>
        <field>LLC_BI__Default_App__c</field>
        <formula>&apos;m-pp-details.dashboard-pp-sn-details&apos;</formula>
        <name>Product Package - Default App</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>