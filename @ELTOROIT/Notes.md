NOTES.md

## SFDX Export

```
sfdx force:data:soql:query --resultformat=csv --query="SELECT Id, name FROM Account"

sfdx force:data:soql:query --resultformat=csv --query="SELECT Id, Category__c, Description__c, Name FROM Product_Family__c" > ProductFamily.csv

sfdx force:data:soql:query --resultformat=csv --query="SELECT Id, Product_Family__c, Description__c, Battery__c, Category__c, Charger__c, Fork__c, Frame_Color__c, Front_Brakes__c, Handlebar_Color__c, Level__c, Material__c, Motor__c, MSRP__c, Picture_URL__c, Name, Rear_Brakes__c, Seat_Color__c, Waterbottle_Color__c FROM Product__c" > Product.csv
```

## Topics

===
-   System.runAs(u) {...}
    -   Apex code runs in system mode
    -   The system method runAs enables you to write test methods that change the user context to an existing user or a new user so that the user’s **record sharing** is enforced.
    -   The runAs method **doesn’t enforce user permissions or field-level permissions, only record sharing.**
    -   The runAs method ignores user license limits. You can create new users with runAs even if your organization has no additional user licenses.
    -   Every call to runAs counts against the total number of DML statements issued in the process.
    -   You can also use the runAs method to perform mixed DML operations in your test by enclosing the DML operations within the runAs block. In this way, you bypass the mixed DML error that is otherwise returned when inserting or updating setup objects together with other sObjects. See [sObjects That Cannot Be Used Together in DML Operations](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dml_non_mix_sobjects.htm#apex_dml_non_mix_sobjects).

-   Parallel Testing
    -   In particular, data contention issues and UNABLE_TO_LOCK_ROW errors can occur in the following cases:
        -   When tests update the same records at the same time. Updating the same records typically occurs when tests don’t create their own data and turn off data isolation to access the organization’s data.
        -   When a deadlock occurs in tests that are running in parallel and that try to create records with duplicate index field values. A deadlock occurs when two running tests are waiting for each other to roll back data. Such a wait can happen if two tests insert records with the same unique index field values in different orders.