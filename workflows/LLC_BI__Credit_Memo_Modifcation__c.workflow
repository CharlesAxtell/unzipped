<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_Memo_Change_Memo_Flag</fullName>
        <field>cm_ChangeMemoFlag__c</field>
        <literalValue>1</literalValue>
        <name>Change Memo - Change Memo Flag = True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Memo_Set_Status_to_Approved</fullName>
        <field>LLC_BI__Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Change Memo - Set Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Memo_Set_Status_to_Rejected</fullName>
        <field>LLC_BI__Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Change Memo - Set Status to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LLC_BI__Update_Approval_Status_Field_Approved</fullName>
        <field>LLC_BI__Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Approval Status Field To Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LLC_BI__Update_Approval_Status_Field_Rejected</fullName>
        <field>LLC_BI__Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Update Approval Status Field To Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LLC_BI__Update_Approval_Status_Field_Review</fullName>
        <field>LLC_BI__Approval_Status__c</field>
        <literalValue>In Review</literalValue>
        <name>Update Approval Status Field In Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>