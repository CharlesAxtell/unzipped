<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Loan_Approved</fullName>
        <description>Loan - Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSO_Email_Templates/ET16_Loan_Approved</template>
    </alerts>
    <alerts>
        <fullName>Loan_Booked</fullName>
        <description>Loan - Booked</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>LLC_BI__Loan_Officer__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSO_Email_Templates/ET17_Loan_Booked</template>
    </alerts>
    <alerts>
        <fullName>Loan_Rejected</fullName>
        <description>Loan - Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSO_Email_Templates/ET30_Loan_Rejected</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assign_Commercial_Record_Type</fullName>
        <description>Assign the Commercial Record type</description>
        <field>RecordTypeId</field>
        <lookupValue>Commercial_Loan_Record_Type</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Assign Commercial Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Loan_Name</fullName>
        <description>Enforces a Loan naming convention. Added for the Commercial Accelerate project.</description>
        <field>Name</field>
        <formula>LLC_BI__Account__r.Name &amp; &apos; - &apos; &amp; TEXT(LLC_BI__Product__c) &amp; &apos; - &apos; &amp; &apos;$&apos; &amp; IF(ISBLANK(LLC_BI__Amount__c),
&apos;0&apos;,
IF(
LLC_BI__Amount__c &gt;= 1000000,
TEXT(FLOOR(LLC_BI__Amount__c / 1000000)) &amp; &apos;,&apos;,
&apos;&apos;) &amp;
IF(
LLC_BI__Amount__c &gt;= 1000,
RIGHT(TEXT(FLOOR(LLC_BI__Amount__c / 1000)), 3) &amp; &apos;,&apos;,
&apos;&apos;) &amp;
RIGHT(TEXT(FLOOR(LLC_BI__Amount__c)), 3) &amp; &apos;.&apos; &amp;
IF(
MOD(LLC_BI__Amount__c, 1) * 100 &lt; 10,
&apos;0&apos; &amp; TEXT(ROUND(MOD(LLC_BI__Amount__c, 1), 2) * 100),
TEXT(MIN(ROUND(MOD(LLC_BI__Amount__c, 1), 2) * 100, 99))
))</formula>
        <name>Default Loan Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Blank_Out_Submitted_for_Approval</fullName>
        <description>Removes the original Submitted for Approval Date when a Loan is Rejected or Recalled</description>
        <field>Submitted_for_Approval_Date__c</field>
        <name>Loan - Blank Out Submitted for Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Default_App</fullName>
        <field>LLC_BI__Default_App__c</field>
        <formula>IF(
AND(
ISPICKVAL(LLC_BI__Product_Line__c, &quot;Commercial&quot;),
OR(
ISPICKVAL(LLC_BI__Stage__c, &quot;Qualification&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Proposal&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Credit Underwriting&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Final Review&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Approval / Loan Committee&quot;)
)
),
&apos;m-loan.dashboard-loan&apos;,
IF(
AND(
ISPICKVAL(LLC_BI__Product_Line__c, &quot;Commercial&quot;),
OR(
ISPICKVAL(LLC_BI__Stage__c, &quot;Processing&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Doc Prep&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Credit Underwriting&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Closing&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Boarding&quot;)
)
),
&apos;m-loan-post-approval.post-approval-loan-dashboard&apos;,
IF(
AND(
ISPICKVAL(LLC_BI__Product_Line__c, &quot;Commercial&quot;),
OR(
ISPICKVAL(LLC_BI__Stage__c, &quot;Booked&quot;),
ISPICKVAL(LLC_BI__Stage__c, &quot;Complete&quot;)
)
),
&apos;m-loan-booked.booked-loan-dashboard&apos;,
IF(
ISPICKVAL(LLC_BI__Product_Line__c, &quot;Consumer&quot;),
&apos;m-retail.m-retail-loan-details&apos;,
&apos;m-loan.dashboard-loan&apos;
)
)
)
)</formula>
        <name>Loan - Default App</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Employee_Loan_Equals_True</fullName>
        <field>LLC_BI__Employee_Loan__c</field>
        <literalValue>1</literalValue>
        <name>Loan - Employee Loan Equals True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Loan_Lock</fullName>
        <description>This can be used in the UI as a parameter.</description>
        <field>LLC_BI__Is_Locked__c</field>
        <literalValue>1</literalValue>
        <name>Loan - Loan Lock</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Loan_Unlock</fullName>
        <description>This field can be referenced in the UI as the parameters field.</description>
        <field>LLC_BI__Is_Locked__c</field>
        <literalValue>0</literalValue>
        <name>Loan - Loan Unlock</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Reg_O_Equals_True</fullName>
        <field>LLC_BI__Reg_O_Loan__c</field>
        <literalValue>1</literalValue>
        <name>Loan - Reg O Equals True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Application_Date_to_Today</fullName>
        <description>Sets the Application Date to &apos;Today&apos; when a loan record is created</description>
        <field>Application_Date__c</field>
        <formula>Today()</formula>
        <name>Loan - Set Application Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Credit_Approval_Date_to_Today</fullName>
        <description>The Credit Approval Date will be automatically updated when a loan is approved</description>
        <field>LLC_BI__Credit_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Loan - Set Credit Approval Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Stage_to_Approval</fullName>
        <description>Update the Loan Stage to Approval / Loan Committee</description>
        <field>LLC_BI__Stage__c</field>
        <literalValue>Approval / Loan Committee</literalValue>
        <name>Loan - Set Stage to Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Stage_to_Final_Review</fullName>
        <description>Updates the Loan Stage to Final Review</description>
        <field>LLC_BI__Stage__c</field>
        <literalValue>Final Review</literalValue>
        <name>Loan - Set Stage to Final Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Stage_to_Qualification</fullName>
        <field>LLC_BI__Stage__c</field>
        <literalValue>Qualification</literalValue>
        <name>Loan - Set Stage to Qualification</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Set_Status_to_Open</fullName>
        <field>LLC_BI__Status__c</field>
        <literalValue>Open</literalValue>
        <name>Loan - Set Status to Open</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Update_Stage_to_Processing</fullName>
        <description>The loan stage will automatically update to &apos;Processing&apos; when a loan is approved</description>
        <field>LLC_BI__Stage__c</field>
        <literalValue>Processing</literalValue>
        <name>Loan - Update Stage to Processing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Loan_Update_Submitted_for_Approval</fullName>
        <description>Updates the Submitted for Approval Date to Today</description>
        <field>Submitted_for_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Loan - Update Submitted for Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Is_Review_Ready_to_False</fullName>
        <description>Added for Commercial Accelerate project.</description>
        <field>LLC_BI__Is_Review_Ready__c</field>
        <literalValue>0</literalValue>
        <name>Set Is Review Ready to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>