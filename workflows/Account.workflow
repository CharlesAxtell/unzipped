<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Update_NAICS_Code</fullName>
        <field>LLC_BI__Naics_Code__c</field>
        <formula>cm_Industry_Code__r.cm_Industry_Code__c</formula>
        <name>Account - Update NAICS Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>