@IsTest
private with sharing class Demo03_AsyncApex_Test {
    @TestSetup
    static void makeData() {
        System.assertEquals(0, [SELECT COUNT() FROM Account]);
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(name = 'Test Account: ' + i));
        }
        insert accounts;
    }

    @isTest
    private static void testFuture() {
        Map<Id, Account> mapAccounts = new Map<ID, Account>([SELECT Id FROM Account]);
        Test.startTest();
        Demo03_AsyncApex.futureMethod(mapAccounts.keySet());
        Test.stopTest();
        for (Account account : [SELECT Id, Site FROM Account]) {
            System.assertEquals('Future', account.Site);
        }
    }

    @isTest
    private static void testQueueable() {
        List<Account> accounts = [SELECT Id FROM Account];
        Test.startTest();
        System.enqueueJob(new Demo03_AsyncApex(accounts));
        Test.stopTest();
        for (Account account : [SELECT Id, Site FROM Account]) {
            System.assertEquals('Queueable', account.Site);
        }
    }
}
