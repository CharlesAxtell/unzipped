@isTest
global with sharing class csaTestDataFactory {
    /**
    * This method will create a Base structure for a Loan including these Records
    * Account - Individual and Business
    * Contact - linked to Individual
    * Loan - Linked to Business
    * Legal Entity linked to individual and business as gurantor and borrower respecfuly
    *
    **/
    global static void createLoanBaseStructure() {
        createProductHierarchy();
        LLC_BI__Product__c testProduct = [SELECT Id FROM LLC_BI__Product__c LIMIT 1];
        Account testIndividualAccount = createAccount(ACCOUNT_TYPE_INDIVIDUAL);
        Contact testContact = createContact(testIndividualAccount.Id);
        Account testBusinessAccount = createAccount(ACCOUNT_TYPE_CORPORATION);
        LLC_BI__Loan__c testLoan = createLoan(testBusinessAccount.Id, null, testProduct.Id);
        LLC_BI__Legal_Entities__c testBusinessLegalEntity = createLegalEntity(testBusinessAccount.Id, TestLoan.Id, null, BORROWER_TYPE_BORROWER);
        LLC_BI__Legal_Entities__c testIndividualLegalEntity = createLegalEntity(testIndividualAccount.Id, TestLoan.Id, null, BORROWER_TYPE_GUARANTOR);
    }

    /**
    * This method will create a structure for a Product Package including these Records
    * Account - Individual and Business
    * Contact - linked to Individual
    * Product Package - Linked to Business
    * Loan - Linked to Business and Product Package
    * Legal Entity - linked to individual and business as gurantor and borrower
    *                respecfuly and Product Package
    *
    **/
    global static void createProductPackageStructure() {
        createProductHierarchy();
        LLC_BI__Product__c testProduct = [SELECT Id FROM LLC_BI__Product__c LIMIT 1];
        Account testIndividualAccount = createAccount(ACCOUNT_TYPE_INDIVIDUAL);
        Contact testContact = createContact(testIndividualAccount.Id);
        Account testBusinessAccount = createAccount(ACCOUNT_TYPE_CORPORATION);
        LLC_BI__Product_Package__c testProductPackage = createProductPackage(testBusinessAccount.Id);
        LLC_BI__Loan__c testLoan = createLoan(testBusinessAccount.Id, testProductPackage.Id, testProduct.Id);
        LLC_BI__Legal_Entities__c testBusinessLegalEntity = createLegalEntity(testBusinessAccount.Id, TestLoan.Id, testProductPackage.Id, BORROWER_TYPE_BORROWER);
        LLC_BI__Legal_Entities__c testIndividualLegalEntity = createLegalEntity(testIndividualAccount.Id, TestLoan.Id, testProductPackage.Id, BORROWER_TYPE_GUARANTOR);
    }

    /**
    * This method will create a Collateral Structure including these Records
    * Loan Collateral Aggregate, Collateral Type, Collateral,
    * Collateral Pledged, Collateral Ownership
    *
    * Update Loan with Loan Collateral Aggregate Link
    *
    * @param loanId Id of the Loan Object
    * @param acctId Id of the Account Object
    **/
    global static void createCollateralStructure(Id loanId, Id acctId) {
        LLC_BI__Loan_Collateral_Aggregate__c testCollateralAgg = createLoanCollateralAggregate();
        LLC_BI__Loan__c testLoan = updateLoan(loanId, testCollateralAgg.Id);
        LLC_BI__Collateral_Type__c testCollateralType = createCollateralType();
        LLC_BI__Collateral__c testCollateral = createCollateral(testCollateralType.Id);
        LLC_BI__Loan_Collateral2__c testCollateralPledge = createCollateralPledged(testCollateral.Id, loanId, testCollateralAgg.Id);
        LLC_BI__Account_Collateral__c testCollateralOwnership = createCollateralOwnership(testCollateral.Id, acctId);
    }

    /**
    * This method will create a Covenant Structure including these Records
    * Covenant Type, Covenant, Account Covenant, Loan Covenant
    *
    * @param loanId Id of the Loan Object
    * @param acctId Id of the Account Object
    **/
    global static void createCovenantStructure(Id loanId, Id acctId) {
        LLC_BI__Covenant_Type__c testCovenantType = createCovenantType();
        LLC_BI__Covenant2__c testCovenant = createCovenant(testCovenantType.Id);
        LLC_BI__Loan_Covenant__c testLoanCovenant = createLoanCovenant(testCovenant.Id, loanId);
        LLC_BI__Account_Covenant__c testAccountCovenant = createAccountCovenant(testCovenant.Id, acctId);
    }

    /**
    * This method will create a Product Hierarchy with two Products
    *
    **/
    global static void createProductHierarchy() {
        LLC_BI__Product_Line__c testProductLine = createProductLine();
        LLC_BI__Product_Type__c testProductType = createProductType(testProductLine.Id);
        LLC_BI__Product__c testProduct1 = createProduct('TestProduct1', testProductType.Id);
        LLC_BI__Product__c testProduct2 = createProduct('TestProduct2', testProductType.Id);
    }

    /**
    * This method will create a Document Manager for a specific Object with one doc
    *
    * @param type String of the objectAPI Name
    **/
    global static void createDocumentManagerStructure(String type) {
        LLC_BI__DocManager__c testDocManager = createDocManager(type);
        LLC_BI__DocType__c testDocType = createDocType(testDocManager.Id);
        LLC_BI__DocClass__c testDocClass = createDocClass(testDocManager.Id, testDocType.Id);
        LLC_BI__ClosingChecklist__c testClosingChecklist = createClosingChecklist(testDocManager.Id, testDocType.Id, testDocClass.Id);
    }

    /**
    * This method will create a Credit Memo template for a specific object
    *
    * @param type String of the objectAPI Name
    * @param sectionResource String of the Section Resource
    **/
    global static void createCreditMemoStruture(String type, String sectionResource) {
        nFORCE__Screen__c testScreen = createScreen();
        nFORCE__View__c testView = createView();
        nFORCE__Widget__c testWidget = createWidget();
        nFORCE__Screen_Section__c testScreenSection = createScreenSection(testScreen.Id, testWidget.Id, testView.Id, sectionResource);
        nFORCE__Section_Configuration__c testSectionConfiguration = createSectionConfiguration(testScreenSection.Id);
        LLC_BI__Credit_Memo__c testCreditMemo = createCreditMemo(testScreen.Id, type);
    }

    /**
    * This method will create a Pricing Rate Streams for a Loan
    *
    * @param loanId Id of the Loan Object
    * @param isRate Boolean if Rate set to true, if Payment set to false
    **/
    global static void createRateAndPaymentStreams(Id loanId, Boolean isRate) {
        LLC_BI__Pricing_Stream__c testPricingStream = createPricingStream(loanId, isRate, !isRate);
        LLC_BI__Pricing_Rate_Component__c testPricingRateComponent = createPricingRateComponent(testPricingStream.Id);
    }

    /**
    * This method will create a User Interface Structure with the following objects
    * Group, Route, Route Group, Screen, Screen Section, and Section Configuration
    *
    **/
    global static void createUserInterface() {
        nFORCE__Group__c testGroup = createGroup('test-app-name');
        nFORCE__Screen__c testScreen = createScreen();
        nFORCE__Screen_Section__c testScreenSection = createScreenSection(testScreen.Id, null, null, SECTION_RESOURCE_MAPPED_SOBJECT);
        nFORCE__Section_Configuration__c testSectionConfiguration = createSectionConfiguration(testScreenSection.Id);
        nFORCE__Route__c testRoute = createRoute(testScreen.Id, NCDATAGRID_PAGE, 'test-app-name', null);
        nFORCE__Route_Group__c testRouteGroup1 = createRouteGroup(10, TestGroup.Id, TestRoute.Id, null);
        nFORCE__Route_Group__c testRouteGroup2 = createRouteGroup(11, TestGroup.Id, TestRoute.Id, TestRoute.Id);
    }

    /**
    * This method will create a Risk Grade Template Structure with the following objects
    * Risk Grade Template, Risk Grade Group, Risk Grade Factor, Risk Grade Criatera
    *
    * Note that Product Hierarchy must be in place prior to running this method
    *
    **/
    global static void createRiskGradeTemplateStructure() {
        Map<String, Object> factor1Params = new Map<String, Object>{
            'LLC_BI__Column_Number__c' => 1,
            'LLC_BI__Type__c' => 'Quantitative',
            'LLC_BI__Weight__c' => .5
        };

        Map<String, Object> factor2Params = new Map<String, Object>{
            'LLC_BI__Column_Number__c' => 1,
            'LLC_BI__Type__c' => 'Qualitative',
            'LLC_BI__Weight__c' => .5
        };
        
        LLC_BI__Risk_Grade_Template__c testTemplate = createRiskGradeTemplateWithFields('TestTemplate', null);
        LLC_BI__Risk_Grade_Group__c testGroup = createRiskGradeGroup('TestGroup', testTemplate.Id, 1, 1.00);
        LLC_BI__Risk_Grade_Factor__c testFactor1 = createRiskGradeFactorWithFields('Factor1', testGroup.Id, testTemplate.Id, factor1Params);
        LLC_BI__Risk_Grade_Factor__c testFactor2 = createRiskGradeFactorWithFields('Factor2', testGroup.Id, testTemplate.Id, factor2Params);
        LLC_BI__Risk_Grade_Criteria__c testCriteria1 = createRiskGradeCriteria(10, 0, null, '1', testFactor1.Id);
        LLC_BI__Risk_Grade_Criteria__c testCriteria2 = createRiskGradeCriteria(null, null, 'A Value', '1', testFactor2.Id);

        LLC_BI__CFG_ConfigKey__c cm_key_prefix = new LLC_BI__CFG_ConfigKey__c();
        cm_key_prefix.Name = 'KY_GBL_NamespacePrefixBI';
        insert cm_key_prefix;
        
        LLC_BI__CFG_ConfigValue__c ccfv_prefix = new LLC_BI__CFG_ConfigValue__c();
        ccfv_prefix.LLC_BI__Key__c = 'Bankr_BI_Prefix';
        ccfv_prefix.LLC_BI__FieldValue__c = '';
        ccfv_prefix.LLC_BI__Category__c = 'General';
        insert ccfv_prefix;
        
        LLC_BI__CFG_CKJ__c ckj5 = new LLC_BI__CFG_CKJ__c();
        ckj5.LLC_BI__CFG_ConfigKeys__c = cm_key_prefix.Id;
        ckj5.LLC_BI__CFG_ConfigValue__c = ccfv_prefix.Id;
        insert ckj5;

        //Configure Loan Stages
        LLC_BI__CFG_ConfigKey__c cfk = new LLC_BI__CFG_ConfigKey__c();
        cfk.Name = [SELECT LLC_BI__lookupKey__c FROM LLC_BI__Product_Type__c LIMIT 1].LLC_BI__lookupKey__c;
        insert cfk;
        
        LLC_BI__CFG_ConfigValue__c ccfv1 = new LLC_BI__CFG_ConfigValue__c();
        ccfv1.LLC_BI__Key__c = 'Complete';
        ccfv1.LLC_BI__Value__c = 'Complete';
        ccfv1.LLC_BI__fieldValue__c = 'Complete';
        ccfv1.LLC_BI__Category__c = 'Loan Stage';
        insert ccfv1;
        
        LLC_BI__CFG_CKJ__c ckj1 = new LLC_BI__CFG_CKJ__c();
        ckj1.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        ckj1.LLC_BI__CFG_ConfigValue__c = ccfv1.Id;
        insert ckj1;
        
        LLC_BI__CFG_ConfigValue__c ccfv2 = new LLC_BI__CFG_ConfigValue__c();
        ccfv2.LLC_BI__Key__c = 'Closed';
        ccfv2.LLC_BI__Value__c = 'Closed Funded';
        ccfv2.LLC_BI__fieldValue__c = 'Closed Funded';
        ccfv2.LLC_BI__Category__c = 'Loan Stage';
        insert ccfv2;
        
        LLC_BI__CFG_CKJ__c ckj2 = new LLC_BI__CFG_CKJ__c();
        ckj2.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        ckj2.LLC_BI__CFG_ConfigValue__c = ccfv2.Id;
        insert ckj2;
        
        LLC_BI__CFG_ConfigValue__c cvpt2 = new LLC_BI__CFG_ConfigValue__c();
        cvpt2.LLC_BI__Key__c = 'Closed';
        cvpt2.LLC_BI__Value__c = 'Closed Funded';
        cvpt2.LLC_BI__fieldValue__c = 'Closed Funded';
        cvpt2.LLC_BI__Category__c = 'Loan Stage';
        insert cvpt2;
        
        //Configure Loan Status's
        LLC_BI__CFG_ConfigValue__c ccfv3 = new LLC_BI__CFG_ConfigValue__c();
        ccfv3.LLC_BI__Key__c = 'Declined';
        ccfv3.LLC_BI__Value__c = 'Declined';
        ccfv3.LLC_BI__fieldValue__c = 'Declined';
        ccfv3.LLC_BI__Category__c = 'Loan Status';
        insert ccfv3;
        
        LLC_BI__CFG_CKJ__c ckj4 = new LLC_BI__CFG_CKJ__c();
        ckj4.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        ckj4.LLC_BI__CFG_ConfigValue__c = ccfv3.Id;
        insert ckj4;
        
        //Add our Doc Manager records so we can really test our CM move code
        LLC_BI__DocManager__c dm = new LLC_BI__DocManager__c();
        dm.Name = 'TestLoanDM';
        dm.LLC_BI__lookupKey__c = 'TestDocMan';
        insert dm;
        
        LLC_BI__DocTab__c dt = new LLC_BI__DocTab__c();
        dt.Name = 'Credit File Test';
        dt.LLC_BI__DocManager__c = dm.Id;
        dt.LLC_BI__lookupKey__c = 'TestDocTab';
        insert dt;
        
        LLC_BI__DocType__c dtype = new LLC_BI__DocType__c();
        dtype.Name = 'Underwriting Test';
        dtype.LLC_BI__DocManager__c = dm.Id;
        dtype.LLC_BI__DocTab__c = dt.Id;
        dtype.LLC_BI__lookupKey__c = 'TestDocType';
        insert dtype;
        
        //Configure the remainder of our Change Memo information now that we have docman Ids
        LLC_BI__CFG_ConfigValue__c cvdt = new LLC_BI__CFG_ConfigValue__c();
        cvdt.LLC_BI__Key__c = 'CM_DocTabLookupKey';
        cvdt.LLC_BI__Value__c = 'TestDocTab';
        cvdt.LLC_BI__fieldValue__c = 'TestDocTab';
        cvdt.LLC_BI__Category__c = 'Change Memo';
        insert cvdt;
            
        LLC_BI__CFG_CKJ__c cm_join1 = new LLC_BI__CFG_CKJ__c();
        cm_join1.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        cm_join1.LLC_BI__CFG_ConfigValue__c = cvdt.Id;
        insert cm_join1;

        LLC_BI__CFG_ConfigValue__c cvdty = new LLC_BI__CFG_ConfigValue__c();
        cvdty.LLC_BI__Key__c = 'CM_DocTypeLookupKey';
        cvdty.LLC_BI__Value__c = 'TestDocType';
        cvdty.LLC_BI__fieldValue__c = 'TestDocType';
        cvdty.LLC_BI__Category__c = 'Change Memo';
        insert cvdty;
        
        LLC_BI__CFG_CKJ__c cm_join2 = new LLC_BI__CFG_CKJ__c();
        cm_join2.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        cm_join2.LLC_BI__CFG_ConfigValue__c = cvdty.Id;
        insert cm_join2;
        
        LLC_BI__CFG_ConfigValue__c cvdm = new LLC_BI__CFG_ConfigValue__c();
        cvdm.LLC_BI__Key__c = 'CM_DocManLookupKey';
        cvdm.LLC_BI__Value__c = 'TestDocMan';
        cvdm.LLC_BI__fieldValue__c = 'TestDocMan';
        cvdm.LLC_BI__Category__c = 'Change Memo';
        insert cvdm;
        
        LLC_BI__CFG_CKJ__c cm_join3 = new LLC_BI__CFG_CKJ__c();
        cm_join3.LLC_BI__CFG_ConfigKeys__c = cfk.Id;
        cm_join3.LLC_BI__CFG_ConfigValue__c = cvdm.Id;
        insert cm_join3;
    }

    /**
    * This method will create a Account record with the name TestAccount for
    * Type Individual
    *
    * @param type String value of the type
    * @return Account record
    **/
    global static Account createAccount(String type) {
        return createAccountWithFields(type, null);
    }

    /**
    * This method will create a Account record with the name TestAccount and allows Custom Fields
    *
    * @param type String value of the type
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return Account record
    **/
    global static Account createAccountWithFields(String type, Map<String, Object> fieldValues) {
        Account acct = new Account(
            Name = 'TestAccount',
            Type = type
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                acct.put(s, fieldValues.get(s));
            }
        }

        insert acct;
        return acct;
    }

    /**
    * This method will create a Contact record with the name TestContact for
    * Account
    *
    * @param acctId Id of the Account object
    * @return Contact record
    **/
    global static Contact createContact(Id acctId) {
        return createContactWithFields(acctId, null);
    }

    /**
    * This method will create a Contact record with the name TestContact for
    * Account with Custom Fields
    *
    * @param acctId Id of the Account object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return Contact record
    **/
    global static Contact createContactWithFields(Id acctId, Map<String, Object> fieldValues) {
        Contact contact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            AccountId = acctId,
            LLC_BI__Primary_Contact__c = true
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                contact.put(s, fieldValues.get(s));
            }
        }

        insert contact;
        return contact;
    }

    /**
    * This method will create a Product Package record with the name TestProductPackage
    *
    * @param acctId Id of the Account object
    * @return LLC_BI__Product_Package__c record
    **/
    global static LLC_BI__Product_Package__c createProductPackage(Id acctId) {
        return createProductPackageWithFields(acctId, null);
    }

    /**
    * This method will create a Product Package record with the name TestProductPackage
    *
    * @param acctId Id of the Account object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Product_Package__c record
    **/
    global static LLC_BI__Product_Package__c createProductPackageWithFields(Id acctId, Map<String, Object> fieldValues) {
        LLC_BI__Product_Package__c productPackage = new LLC_BI__Product_Package__c(
            Name = 'TestProductPackage',
            LLC_BI__Account__c = acctId,
            LLC_BI__Status__c = STATUS_NEW
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                productPackage.put(s, fieldValues.get(s));
            }
        }

        insert productPackage;
        return productPackage;
    }

    /**
    * This method will create a Product Package Team record
    *
    * @param productPackageId Id of the Product Package object
    * @param userId Id of the User object
    * @param roleId Id of the Role object
    * @return LLC_BI__Product_Package_Team__c record
    **/
    global static LLC_BI__Product_Package_Team__c createProductPackageTeam(Id productPackageId,
                                                                            Id userId,
                                                                            Id roleId) {
        LLC_BI__Product_Package_Team__c productPackageTeam = new LLC_BI__Product_Package_Team__c(
            LLC_BI__Product_Package__c = productPackageId,
            LLC_BI__User__c = userId,
            LLC_BI__Assigned_Role__c = roleId
        );

        insert productPackageTeam;
        return productPackageTeam;
    }

    /**
    * This method will create a Loan record with the name TestLoan
    *
    * @param acctId Id of the Account object
    * @param ppId Id of the Product Package object
    * @param productId Id of the Product object
    * @return LLC_BI__Loan__c object
    **/
    global static LLC_BI__Loan__c createLoan(Id acctId, Id ppId, Id productId) {
        return createLoanWithFields(acctId, ppId, productId, null);
    }

    /**
    * This method will create a Loan record with the name TestLoan and allows Custom Fields
    *
    * @param acctId Id of the Account object
    * @param ppId Id of the Product Package object
    * @param productId Id of the Product object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Loan__c object
    **/
    global static LLC_BI__Loan__c createLoanWithFields(Id acctId, Id ppId, Id productId, Map<String, Object> fieldValues) {
        LLC_BI__Loan__c loan = new LLC_BI__Loan__c(
            Name = 'TestLoan',
            LLC_BI__Amount__c = 10000,
            LLC_BI__Account__c = acctId,
            LLC_BI__Product_Package__c = ppId,
            LLC_BI__Product_Reference__c = productId
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                loan.put(s, fieldValues.get(s));
            }
        }

        insert loan;
        return loan;
    }

    /**
    * This method will update a Loan record with the name LCA record link
    *
    * @param loanId Id of the Loan object
    * @param loanCollateralAggId Id of the Loan Collateral Aggregate object
    * @return LLC_BI__Loan__c object
    **/
    global static LLC_BI__Loan__c updateLoan(Id loanId, Id loanCollateralAggId) {
        LLC_BI__Loan__c loan = new LLC_BI__Loan__c(
            Id = loanId,
            LLC_BI__Loan_Collateral_Aggregate__c = loanCollateralAggId
        );

        update loan;
        return loan;
    }

    /**
    * This method will create a Review Record with Custom Fields Mapped in
    *
    * @param acctId Id of the Account object
    * @param ppId Id of the Product Package object
    * @return LLC_BI__Review__c object
    **/
    global static LLC_BI__Review__c createReview(Id acctId, Id ppId) {
        return createReviewWithFields(acctId, ppId, null);
    }

    /**
    * This method will create a Review Record with Custom Fields Mapped in
    *
    * @param acctId Id of the Account object
    * @param ppId Id of the Product Package object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Review__c object
    **/
    global static LLC_BI__Review__c createReviewWithFields(Id acctId, Id ppId, Map<String, Object> fieldValues) {
        LLC_BI__Review__c review = new LLC_BI__Review__c(
            LLC_BI__Product_Package__c = ppId,
            LLC_BI__Account__c = acctId,
            LLC_BI__Status__c = STATUS_NEW
        );
        
        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                review.put(s, fieldValues.get(s));
            }
        }

        insert review;
        return review;
    }

    /**
    * This method will create a Review Loan Record
    *
    * @param loanId Id of the Loan object
    * @param reviewId Id of the Review object
    * @return LLC_BI__Review_Loan__c object
    **/
    global static LLC_BI__Review_Loan__c createReviewLoan(Id loanId, Id reviewId) {
        LLC_BI__Review_Loan__c reviewLoan = new LLC_BI__Review_Loan__c(
            LLC_BI__Loan__c = loanId,
            LLC_BI__Review__c = reviewId
        );

        insert reviewLoan;
        return reviewLoan;
    }

    /**
    * This method will create a Review Account Record
    *
    * @param acctId Id of the Account object
    * @param reviewId Id of the Review object
    * @return LLC_BI__Review_Account__c object
    **/
    global static LLC_BI__Review_Account__c createReviewAccount(Id acctId, Id reviewId) {
        LLC_BI__Review_Account__c reviewAccount = new LLC_BI__Review_Account__c(
            LLC_BI__Account__c = acctId,
            LLC_BI__Review__c = reviewId
        );

        insert reviewAccount;
        return reviewAccount;
    }

    /**
    * This method will create a Loan Compliance record and allows Custom Fields
    *
    * @param loanId Id of the Loan object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Loan_Compliance__c object
    **/
    global static LLC_BI__Loan_Compliance__c createLoanCompliance(Id loanId, Map<String, Object> fieldValues) {
        LLC_BI__Loan_Compliance__c loanCompliance = new LLC_BI__Loan_Compliance__c(
            LLC_BI__Loan__c = loanId
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                loanCompliance.put(s, fieldValues.get(s));
            }
        }

        insert loanCompliance;
        return loanCompliance;
    }

    /**
    * This method will create a Loan Compliance record and allows Custom Fields
    *
    * @param acctId Id of the Account object
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Entity_Compliance__c object
    **/
    global static LLC_BI__Entity_Compliance__c createEntityCompliance(Id acctId, Map<String, Object> fieldValues) {
        LLC_BI__Entity_Compliance__c entityCompliance = new LLC_BI__Entity_Compliance__c(
            LLC_BI__Entity__c = acctId
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                entityCompliance.put(s, fieldValues.get(s));
            }
        }

        insert entityCompliance;
        return entityCompliance;
    }

    /**
    * This method will create a Legal Entity record Linked to an Account, Loan,
    * and Product Package (if applicable)
    *
    * @param acctId Id of the Account object
    * @param loanId Id of the Loan object
    * @param ppId Id of the Product Package object
    * @param borrowerType String of the borrower Type used
    * @return LLC_BI__Legal_Entities__c object
    **/
    global static LLC_BI__Legal_Entities__c createLegalEntity(Id acctId,
                                                              Id loanId,
                                                              Id ppId,
                                                              String borrowerType) {
        return createLegalEntityWithFields(acctId, loanId, ppId, borrowerType, null);
    }

    /**
    * This method will create a Legal Entity record Linked to an Account, Loan,
    * and Product Package (if applicable) With Field Map of Custom Fields
    *
    * @param acctId Id of the Account object
    * @param loanId Id of the Loan object
    * @param ppId Id of the Product Package object
    * @param borrowerType String of the borrower Type used
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Legal_Entities__c object
    **/
    global static LLC_BI__Legal_Entities__c createLegalEntityWithFields(Id acctId,
                                                                        Id loanId,
                                                                        Id ppId,
                                                                        String borrowerType,
                                                                        Map<String, Object> fieldValues) {
        LLC_BI__Legal_Entities__c legalEntity = new LLC_BI__Legal_Entities__c(
            Name = 'TestLegalEntity',
            LLC_BI__Account__c = acctId,
            LLC_BI__Loan__c = loanId,
            LLC_BI__Product_Package__c = ppId,
            LLC_BI__Borrower_Type__c = borrowerType
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                legalEntity.put(s, fieldValues.get(s));
            }
        }

        insert legalEntity;
        return legalEntity;
    }

    /**
    * This method will create a Loan Collateral Aggregate record
    *
    * @return LLC_BI__Loan_Collateral_Aggregate__c object
    **/
    global static LLC_BI__Loan_Collateral_Aggregate__c createLoanCollateralAggregate() {
        LLC_BI__Loan_Collateral_Aggregate__c loanCA = new LLC_BI__Loan_Collateral_Aggregate__c(
            Name = 'TestLoanCollateralAggregate'
        );

        insert loanCA;
        return loanCA;
    }

    /**
    * This method will create a Collateral Type record
    *
    * @return LLC_BI__Collateral_Type__c object
    **/
    global static LLC_BI__Collateral_Type__c createCollateralType() {
        LLC_BI__Collateral_Type__c collateralType = new LLC_BI__Collateral_Type__c(
            Name = 'TestCollateralType',
            LLC_BI__Type__c = 'TestType',
            LLC_BI__Subtype__c = 'TestSubType',
            LLC_BI__Collateral_Code__c = '4000',
            LLC_BI__Advance_Rate__c = 100
        );

        insert collateralType;
        return collateralType;
    }

    /**
    * This method will create a Collateral record
    *
    * @param collateralTypeId Id of the Collateral Type Object
    * @return LLC_BI__Collateral__c object
    **/
    global static LLC_BI__Collateral__c createCollateral(Id collateralTypeId) {
        LLC_BI__Collateral__c collateral = new LLC_BI__Collateral__c(
            LLC_BI__Collateral_Type__c = collateralTypeId
        );

        insert collateral;
        return collateral;
    }

    /**
    * This method will create a Collateral Pledged record
    *
    * @param collateralId Id of the Collateral Object
    * @param loanId Id of the Loan Object
    * @param loanCollateralAggId Id of the Loan Collateral Aggregate Object
    * @return LLC_BI__Loan_Collateral2__c object
    **/
    global static LLC_BI__Loan_Collateral2__c createCollateralPledged(
        Id collateralId, Id loanId, Id loanCollateralAggId
    ) {
        LLC_BI__Loan_Collateral2__c collateralPledged = new LLC_BI__Loan_Collateral2__c(
            LLC_BI__Loan_Collateral_Aggregate__c = loanCollateralAggId,
            LLC_BI__Collateral__c = collateralId,
            LLC_BI__Loan__c = loanId
        );

        insert collateralPledged;
        return collateralPledged;
    }

    /**
    * This method will create a Collateral Ownership record
    *
    * @param collateralId Id of the Collateral Object
    * @param acctId Id of the Account Object
    * @return LLC_BI__Account_Collateral__c object
    **/
    global static LLC_BI__Account_Collateral__c createCollateralOwnership(Id collateralId, Id acctId) {
        LLC_BI__Account_Collateral__c collateralOwnership = new LLC_BI__Account_Collateral__c(
            LLC_BI__Collateral__c = collateralId,
            LLC_BI__Account__c = acctId
        );

        insert collateralOwnership;
        return collateralOwnership;
    }

    /**
    * This method will create a Covenant Type record
    *
    * @return LLC_BI__Covenant_Type__c object
    **/
    global static LLC_BI__Covenant_Type__c createCovenantType() {
        LLC_BI__Covenant_Type__c covenantType = new LLC_BI__Covenant_Type__c(
            Name = 'TestCovenantType',
            LLC_BI__Category__c = 'TestCategory'
        );

        insert covenantType;
        return covenantType;
    }

    /**
    * This method will create a Covenant record
    *
    * @param covenantTypeId Id of the Covenant Type Object
    * @return LLC_BI__Covenant2__c object
    **/
    global static LLC_BI__Covenant2__c createCovenant(Id covenantTypeId) {
        LLC_BI__Covenant2__c covenant = new LLC_BI__Covenant2__c(
            LLC_BI__Covenant_Type__c = covenantTypeId
        );

        insert covenant;
        return covenant;
    }

    /**
    * This method will create a Loan Covenant record
    *
    * @param covenantId Id of the Covenant Object
    * @param loanId Id of the Loan Object
    * @return LLC_BI__Account_Covenant__c object
    **/
    global static LLC_BI__Loan_Covenant__c createLoanCovenant(Id covenantId, Id loanId) {
        LLC_BI__Loan_Covenant__c loanCovenant = new LLC_BI__Loan_Covenant__c(
            LLC_BI__Covenant2__c = covenantId,
            LLC_BI__Loan__c = loanId
        );

        insert loanCovenant;
        return loanCovenant;
    }

    /**
    * This method will create a Account Covenant record
    *
    * @param covenantId Id of the Covenant Object
    * @param acctId Id of the Account Object
    * @return LLC_BI__Account_Covenant__c object
    **/
    global static LLC_BI__Account_Covenant__c createAccountCovenant(Id covenantId, Id acctId) {
        LLC_BI__Account_Covenant__c accountCovenant = new LLC_BI__Account_Covenant__c(
            LLC_BI__Covenant2__c = covenantId,
            LLC_BI__Account__c = acctId
        );

        insert accountCovenant;
        return accountCovenant;
    }

    /**
    * This method will create a Loan Team Member record
    *
    * @param loanId Id of the Loan Object
    * @param userId Id of the User Object
    * @param roleId Id of the Role Object
    * @return LLC_BI__LoanTeam__c object
    **/
    global static LLC_BI__LoanTeam__c createLoanTeamMember(Id loanId, Id userId, Id roleId) {
        LLC_BI__LoanTeam__c loanTeam = new LLC_BI__LoanTeam__c(
            LLC_BI__Loan__c = loanId,
            LLC_BI__Assigned_Role__c = roleId,
            LLC_BI__User__c = userId
        );

        insert loanTeam;
        return loanTeam;
    }

    /**
    * This method will create a Product Line record
    *
    * @return LLC_BI__Product_Line__c object
    **/
    global static LLC_BI__Product_Line__c createProductLine() {
        LLC_BI__Product_Line__c productLine = new LLC_BI__Product_Line__c(
            Name = 'TestProductLine',
            LLC_BI__Product_Object__c = LOAN_OBJECTS_API_NONAMESPACE
        );

        insert productLine;
        return productLine;
    }

    /**
    * This method will create a Product Type record
    *
    * @param productLineId Id of the Product Line Object
    * @return LLC_BI__Product_Type__c object
    **/
    global static LLC_BI__Product_Type__c createProductType(Id productLineId) {
        LLC_BI__Product_Type__c productType = new LLC_BI__Product_Type__c(
            Name = 'TestProductType',
            LLC_BI__Product_Line__c = productLineId
        );

        insert productType;
        return productType;
    }

    /**
    * This method will create a Product record
    *
    * @param productName String of the product Name
    * @param productTypeId Id of the Product Type Object
    * @return LLC_BI__Product__c object
    **/
    global static LLC_BI__Product__c createProduct(String productName, Id productTypeId) {
        LLC_BI__Product__c product = new LLC_BI__Product__c(
            Name = productName,
            LLC_BI__Product_Type__c = productTypeId
        );

        insert product;
        return product;
    }

    /**
    * This method will create a DocManager record
    *
    * @param type String of the objectAPI Name
    * @return LLC_BI__DocManager__c object
    **/
    global static LLC_BI__DocManager__c createDocManager(String type) {
        LLC_BI__DocManager__c docManager = new LLC_BI__DocManager__c(
            Name = type
        );

        insert docManager;
        return docManager;
    }

    /**
    * This method will create a DocType record
    *
    * @param docManId Id of the DocManager Object
    * @return LLC_BI__DocType__c object
    **/
    global static LLC_BI__DocType__c createDocType(Id docManId) {
        LLC_BI__DocType__c docType = new LLC_BI__DocType__c(
            Name = 'TestDocType',
            LLC_BI__docManager__c = docManId
        );

        insert docType;
        return docType;
    }

    /**
    * This method will create a DocClass record
    *
    * @param docManId Id of the DocManager Object
    * @param docTypeId Id of the DocType Object
    * @return LLC_BI__DocClass__c object
    **/
    global static LLC_BI__DocClass__c createDocClass(Id docManId, Id docTypeId) {
        LLC_BI__DocClass__c docClass = new LLC_BI__DocClass__c(
            Name = 'TestDocument',
            LLC_BI__docManager__c = docManId,
            LLC_BI__DocType__c = docTypeId
        );

        insert docClass;
        return docClass;
    }

    /**
    * This method will create a Closing Checklist record
    *
    * @param docManId Id of the DocManager Object
    * @param docTypeId Id of the DocType Object
    * @return LLC_BI__ClosingChecklist__c object
    **/
    global static LLC_BI__ClosingChecklist__c createClosingChecklist(Id docManId, Id docTypeId, Id docClassId) {
        LLC_BI__ClosingChecklist__c closingChecklist = new LLC_BI__ClosingChecklist__c(
            Name = 'TestDocument',
            LLC_BI__docManager__c = docManId,
            LLC_BI__DocType__c = docTypeId,
            LLC_BI__docClass__c = docClassId
        );

        insert closingChecklist;
        return closingChecklist;
    }

    /**
    * This method will create a Credit Memo record Not a Template
    *
    * @param screenId Id of the Screen Object
    * @param type String of the objectAPI Name
    * @return LLC_BI__Credit_Memo__c object
    **/
    global static LLC_BI__Credit_Memo__c createCreditMemo(Id screenId, String type) {
        LLC_BI__Credit_Memo__c creditMemo = new LLC_BI__Credit_Memo__c(
            Name = 'TestCreditMemo',
            LLC_BI__FScreen__c = screenId,
            LLC_BI__Object_API_Name__c = type,
            LLC_BI__Is_Template__c = false
        );

        insert creditMemo;
        return creditMemo;
    }

    /**
    * This method will create a Screen Record
    *
    * @return nFORCE__Screen__c object
    **/
    global static nFORCE__Screen__c createScreen() {
        nFORCE__Screen__c screen = new nFORCE__Screen__c(
            Name = 'TestScreen'
        );

        insert screen;
        return screen;
    }

    /**
    * This method will create a Screen Record
    *
    * @param screenId Id of the Screen Object
    * @param widgetId Id of the Widget Object
    * @param viewId Id of the View Object
    * @param sectionResource String of the Section Resource used
    * @return nFORCE__Screen_Section__c object
    **/
    global static nFORCE__Screen_Section__c createScreenSection(Id screenId, Id widgetId, Id viewId, String sectionResource) {
        nFORCE__Screen_Section__c screenSection = new nFORCE__Screen_Section__c(
            Name = 'TestScreenSection',
            nFORCE__sObject_Type__c = LOAN_OBJECTS_API,
            nFORCE__Section_Resource__c = sectionResource,
            nFORCE__Display_Order__c = 10,
            nFORCE__Widget__c = widgetId,
            nFORCE__Screen_View__c = viewId,
            nFORCE__Screen__c = screenId
        );

        insert screenSection;
        return screenSection;
    }

    /**
    * This method will create a Widget Record
    *
    * @return nFORCE__Widget__c object
    **/
    global static nFORCE__Widget__c createWidget() {
        nFORCE__Widget__c widget = new nFORCE__Widget__c(
            Name = 'LifeCycle.KO_Narrative',
            nFORCE__View__c = '<div data-bind="template: { name: \'narrative-template\' }"></div>'
        );

        insert widget;
        return widget;
    }

    /**
    * This method will create a View Record
    *
    * @return nFORCE__View__c object
    **/
    global static nFORCE__View__c createView() {
        nFORCE__View__c view = new nFORCE__View__c(
            nFORCE__Read_Only__c = ''
        );

        insert view;
        return view;
    }

    /**
    * This method will create a Section Configuration Record
    *
    * @param screenSectionId Id of the Screen Section Object
    * @return nFORCE__Section_Configuration__c object
    **/
    global static nFORCE__Section_Configuration__c createSectionConfiguration(Id screenSectionId) {
        nFORCE__Section_Configuration__c sectionConfig = new nFORCE__Section_Configuration__c(
            nFORCE__sObject_Type__c = LOAN_OBJECTS_API,
            nFORCE__Screen_Section__c = screenSectionId,
            nFORCE__Display_Order__c = 1.00,
            nFORCE__lookupKey__c = '345678236157fyhjd'
        );

        insert sectionConfig;
        return sectionConfig;
    }

    /**
    * This method will create a Pricing Stream Record
    *
    * @param recordId String of the Record Id
    * @param isRate Boolean of if is Rate Stream
    * @param isPayment Boolean of if is Payment Stream
    * @return LLC_BI__Pricing_Stream__c object
    **/
    global static LLC_BI__Pricing_Stream__c createPricingStream(String recordId, Boolean isRate, Boolean isPayment) {
        LLC_BI__Pricing_Stream__c pricingStream = new LLC_BI__Pricing_Stream__c(
            LLC_BI__Context_Id__c = recordId,
            LLC_BI__Is_Rate_Stream__c = isRate,
            LLC_BI__Is_Payment_Stream__c = isPayment
        );

        insert pricingStream;
        return pricingStream;
    }

    /**
    * This method will create a Pricing Rate Component Record
    *
    * @param pricingStreamId Id of the Pricing Stream Object
    * @return LLC_BI__Pricing_Rate_Component__c object
    **/
    global static LLC_BI__Pricing_Rate_Component__c createPricingRateComponent(Id pricingStreamId) {
        LLC_BI__Pricing_Rate_Component__c pricingRateComponent = new LLC_BI__Pricing_Rate_Component__c(
            LLC_BI__Pricing_Stream__c = pricingStreamId
        );

        insert pricingRateComponent;
        return pricingRateComponent;
    }

    /**
    * This method will create a Risk Rating Review Record
    *
    * @param acctId Id of the Account Object
    * @param loanId Id of the Loan Object
    * @return LLC_BI__Annual_Review__c object
    **/
    global static LLC_BI__Annual_Review__c createAnnualReview(Id acctId, Id loanId) {
        LLC_BI__Annual_Review__c annualReview = new LLC_BI__Annual_Review__c(
            LLC_BI__Account__c = acctId,
            LLC_BI__Loan__c = loanId,
            LLC_BI__Computed_Risk_Grade_Value__c = 10.54,
            LLC_BI__Display_In_Credit_Memo__c = true,
            LLC_BI__Overridden_Risk_Grade_Value__c = 6,
            LLC_BI__Comments__c = 'Because I am',
            LLC_BI__Status__c = 'Approved'
        );

        insert annualReview;
        return annualReview;
    }

    /**
    * This method will create a Risk Grade Template Record
    *
    * @param name String of the Risk Grade Template Name
    * @param fieldValues Map of field API names and there values Map<String, Object>
    * @return LLC_BI__Risk_Grade_Template__c object
    **/
    global static LLC_BI__Risk_Grade_Template__c createRiskGradeTemplateWithFields(String name, Map<String, Object> fieldValues) {
        LLC_BI__Risk_Grade_Template__c riskGradeTemplate = new LLC_BI__Risk_Grade_Template__c(
            Name = name,
            LLC_BI__Template_Object_Field_Name__c = 'Name',
            LLC_BI__Template_Object_Field_Value__c = 'TestLoan',
            LLC_BI__Template_Object_Type__c = 'LLC_BI__Loan__c'
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                riskGradeTemplate.put(s, fieldValues.get(s));
            }
        }

        insert riskGradeTemplate;
        return riskGradeTemplate;
    }

    /**
    * This method will create a Risk Grade Group Record
    *
    * @param name String of the Risk Grade Group Name
    * @param templateId Id of the Risk Grade Template
    * @param order Integer of the Group Number
    * @param weight Decimal of the weight
    * @return LLC_BI__Risk_Grade_Group__c object
    **/
    global static LLC_BI__Risk_Grade_Group__c createRiskGradeGroup(String name,
                                                                    Id templateId,
                                                                    Integer order,
                                                                    Decimal weight) {
        LLC_BI__Risk_Grade_Group__c riskGradeGroup = new LLC_BI__Risk_Grade_Group__c(
            Name = name,
            LLC_BI__Risk_Grade_Template__c = templateId,
            LLC_BI__Group_Number__c = order,
            LLC_BI__Weight__c = weight
        );

        insert riskGradeGroup;
        return riskGradeGroup;
    }

    /**
    * This method will create a Risk Grade Factor Record
    *
    * @param name String of the Risk Grade Factor Name
    * @param groupId Id of the Risk Grade Group Object
    * @param templateId Id of the Risk Grade Template Object
    * @param fieldValues Map of field API names and there values Map<String, Object>    
    * @return LLC_BI__Risk_Grade_Factor__c object
    **/
    global static LLC_BI__Risk_Grade_Factor__c createRiskGradeFactorWithFields(String name,
                                                                                Id groupId,
                                                                                Id templateId,
                                                                                Map<String, Object> fieldValues) {
        LLC_BI__Risk_Grade_Factor__c riskGradeFactor = new LLC_BI__Risk_Grade_Factor__c(
            Name = name,
            LLC_BI__Risk_Grade_Group__c = groupId,
            LLC_BI__Risk_Grade_Template__c = templateId
        );

        if(fieldValues != null) {
            for(String s: fieldValues.keySet()) {
                riskGradeFactor.put(s, fieldValues.get(s));
            }
        }

        insert riskGradeFactor;
        return riskGradeFactor;
    }

    /**
    * This method will create a Risk Grade Criteria Record
    *
    * @param high Decimal value of the High Value
    * @param low Decimal value of the Low Value
    * @param qual String value of the Qualitative Value
    * @param grade String value of the Risk Grade Value
    * @param factorId Id value of the Risk Grade Factor Object
    * @return LLC_BI__Risk_Grade_Criteria__c object
    **/
    global static LLC_BI__Risk_Grade_Criteria__c createRiskGradeCriteria(Decimal high,
                                                                         Decimal low,
                                                                         String qual,
                                                                         String grade,
                                                                         Id factorId) {
        LLC_BI__Risk_Grade_Criteria__c riskGradeCriteria = new LLC_BI__Risk_Grade_Criteria__c(
            LLC_BI__High__c = high,
            LLC_BI__Low__c = low,
            LLC_BI__Description__c = qual,
            LLC_BI__Risk_Grade__c = grade,
            LLC_BI__Risk_Grade_Factor__c = factorId
        );

        insert riskGradeCriteria;
        return riskGradeCriteria;
    }

    /**
    * This method will create a Risk Grade Factor Value Record
    *
    * @param name String of the Risk Grade Factor Value
    * @return LLC_BI__Risk_Grade_Factor_Value__c object
    **/
    global static LLC_BI__Risk_Grade_Factor_Value__c createRiskGradeFactorValue(String name,
                                                                                String qual,
                                                                                Decimal quant,
                                                                                Id factorId,
                                                                                Id templateId,
                                                                                Id annualReviewId) {
        LLC_BI__Risk_Grade_Factor_Value__c riskGradeFactorValue = new LLC_BI__Risk_Grade_Factor_Value__c(
            Name = name,
            LLC_BI__Qualitative_Value__c = qual,
            LLC_BI__Quantitative_Value__c = quant,
            LLC_BI__Risk_Grade_Factor__c = factorId,
            LLC_BI__Risk_Grade_Template__c = templateId
        );

        insert riskGradeFactorValue;
        return riskGradeFactorValue;
    }

    /**
    * This method will create a Group Record
    *
    * @return nFORCE__Group__c object
    **/
    global static nFORCE__Group__c createGroup(String app) {
        nFORCE__Group__c newGroup = new nFORCE__Group__c(
            Name = 'TestGroup',
            nFORCE__App__c = app
        );

        insert newGroup;
        return newGroup;
    }

    /**
    * This method will create a Route Record
    *
    * @param screenId Id of the Screen Object
    * @return nFORCE__Route__c object
    **/
    global static nFORCE__Route__c createRoute(Id screenId, String body, String app, String lookupKey) {
        nFORCE__Route__c route = new nFORCE__Route__c(
            Name = 'TestRoute',
            nFORCE__App__c = app,
            nFORCE__Body__c = body,
            nFORCE__Navigation__c = NAVIGATION_PAGE,
            nFORCE__Sub_Navigation__c = SUB_NAVIGATION_PAGE,
            nFORCE__Topbar__c = TOPBAR_PAGE,
            nFORCE__Screen__c = screenId,
            nFORCE__lookupKey__c = lookupKey
        );

        insert route;
        return route;
    }

    /**
    * This method will create a Group Record
    *
    * @param order Decimal of the Route Ordering
    * @param groupId Id of the Group Object
    * @param routeId Id of the Route Object
    * @param parentId Id of the Route Object as a Parent
    * @return nFORCE__Route_Group__c object
    **/
    global static nFORCE__Route_Group__c createRouteGroup(Decimal order, Id groupId, Id routeId, Id parentId) {
        nFORCE__Route_Group__c routeGroup = new nFORCE__Route_Group__c(
            nFORCE__Order__c = order,
            nFORCE__Group__c = groupId,
            nFORCE__Parent_Route__c = parentId,
            nFORCE__Route__c = routeId
        );

        insert routeGroup;
        return routeGroup;
    }

    /**
    * This method will create a Role Record
    *
    * @param name String of the Role Name
    * @return LLC_BI__Role__c object
    **/
    global static LLC_BI__Role__c createRole(String name) {
        LLC_BI__Role__c newRole = new LLC_BI__Role__c(
            Name = name,
            LLC_BI__Type__c = 'TEAM_ROLES'
        );

        insert newRole;
        return newRole;
    }

    /**
    * This method will create a nFORCE System Property
    *
    * @param category String of the Category
    * @param key String of the Key
    * @param value String of the Value
    * @param active Boolean if Proeprty is active or not
    * @param description String of the Description
    * @return nFORCE__System_Properties__c object
    **/
    global static nFORCE__System_Properties__c createForceSystemProperty(String category, String key, String value, Boolean active, String description) {
        nFORCE__System_Properties__c prop = new nFORCE__System_Properties__c(
      			Name = key,
      			nFORCE__Category_Name__c = category,
      			nFORCE__Key__c = key,
      			nFORCE__Value__c = value,
      			nFORCE__Is_Active__c = active,
      			nFORCE__Description__c = description
    		);

        insert prop;
        return prop;
    }

    /**
    * This method will create a User Record
    *
    * @param username String username you wish to use
    * @return User object
    **/
    global static User createUser(String username) {
        User sUser = new User(
      			Email = username,
      			CompanyName = 'nCino',
      			Username = username,
      			LastName = 'LastName',
      			Alias = 'Alias',
      			CommunityNickname = 'Community' + username,
      			TimeZoneSidKey = 'America/Los_Angeles',
      			LocaleSidKey = 'en_US',
      			EmailEncodingKey = 'ISO-8859-1',
      			LanguageLocaleKey = 'en_US',
      			ProfileId = getSystemAdministrationUserProfileId()
  		);
  		insert sUser;
  		return sUser;
      }

    /**
    * This method will find the System Adminstrator Profile Id
    *
    * @return Id of the Profile
    **/
    global static Id getSystemAdministrationUserProfileId() {
        Profile p = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];
        return p.Id;
    }

    /**
    * This method will find the Standard User Profile Id
    *
    * @return Id of the Profile
    **/
    global static Id getStandardUserProfileId() {
        Profile p = [SELECT Id, Name FROM Profile WHERE Name = 'Standard User'];
        return p.Id;
    }

    /**
    * This method will create a Group Record
    *
    * @param groupName String name of the Group
    * @return Group Object
    **/
    global static Group createPublicGroup(String groupName) {
        Group testGroup = new Group(
            Name = groupName
        );

        insert testGroup;
        return testGroup;
    }

    /**
    * This method will create a Group Member Record
    *
    * @param groupId Id of the Group Object
    * @param userId Id of the User Object
    * @return Group Member Object
    **/
    global static GroupMember createGroupMember(Id groupId, Id userId) {
        GroupMember testGroupMember = new GroupMember(
            GroupId = groupId,
            UserOrGroupId = userId
        );

        insert testGroupMember;
        return testGroupMember;
    }

    /**
    * This method will create a Approval Process for an Object
    *
    * @param testUser User the user you want to use
    * @param testRecord SObject the Record you want to use
    **/
    global static void createApprovalProcessWorkflow(User testUser, SObject testRecord) {
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
    		req1.setComments('Submitting Request');
    		req1.setObjectId(testRecord.Id);
    		req1.setNextApproverIds(new List<Id>{testUser.Id});

    		Approval.ProcessResult result = Approval.process(req1);
    		System.assert(result.isSuccess());
    		System.assertEquals('Pending', result.getInstanceStatus(),
                                'Instance Status ' + result.getInstanceStatus());
    		List<Id> newWorkItemIds = result.getNewWorkitemIds();

    		Approval.ProcessWorkItemRequest req2 = new Approval.ProcessWorkItemRequest();
    		req2.setComments('Approving Request');
    		req2.setAction('Approve');
    		req2.setNextApproverIds(new List<Id>{testUser.Id});
    		req2.setWorkitemId(newWorkItemIds.get(0));

    		Approval.ProcessResult result2 = Approval.process(req2);
    		System.assert(result2.isSuccess(), 'Result Status:'+ result2.isSuccess());
    		System.assertEquals('Approved', result2.getInstanceStatus(),
                                'Instance Status ' + result2.getInstanceStatus());
    }
    public static final String BLANK = '';
    public static final String PERIOD = '.';
    public static final String DASH = '-';
    public static final String UNDERSCORE = '_';
    public static final String IDVALUE = 'Id';
    public static final String ACCOUNT_TYPE_INDIVIDUAL = 'Individual';
    public static final String ACCOUNT_TYPE_CORPORATION = 'Coporation';
    public static final String STATUS_NEW = 'New';
    public static final String BORROWER_TYPE_BORROWER = 'Borrower';
    public static final String BORROWER_TYPE_GUARANTOR = 'Guarantor';
    public static final String SECTION_RESOURCE_MAPPED_SOBJECT = 'MappedSObjectScreenResource';
    public static final String NAVIGATION_PAGE = 'nforce__navigation';
    public static final String SUB_NAVIGATION_PAGE = 'nforce__sub_navigation';
    public static final String TOPBAR_PAGE = 'nforce__topbar';
    public static final String NCDATAGRID_PAGE = 'nforce__ncdatagrid';
    public static final String LOAN_OBJECTS_API = 'LLC_BI__Loan__c';
    public static final String LOAN_OBJECTS_API_NONAMESPACE = 'Loan__c';
    public static final String NUMBERSFORRANDOMIZER = '0123456789';
    public static final String ALPHAFORRANDOMIZER = 'abcdefghijklmnopqrstuvwxyz';
    public static final String ALPHANUMBERSFORRANDOMIZER = '0123456789abcdefghijklmnopqrstuvwxyz';
    public static final String CSASYSTEMPROPERTYCATEGORY = 'csa Data Installer';
    public static final String CSADATAINSTALLER_APPNAME_PREFIX = 'csa-data-installer';
    public static final String ADMINDASHBOARD_ROUTEKEY = 'R-23rfvs293ihrjefk';
    public static final String ADMINGROUP_APPNAME = 'admin';
    public static final String CSAADMINDASHBOARD_APPNAME = 'csa-dashboard-admin';
}