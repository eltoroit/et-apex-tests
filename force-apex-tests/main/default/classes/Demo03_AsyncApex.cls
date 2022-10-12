public with sharing class Demo03_AsyncApex implements Queueable {
    List<Account> accounts;

    public Demo03_AsyncApex(List<Account> accounts) {
        this.accounts = accounts;
    }

    public void execute(QueueableContext context) {
        for (Account account : accounts) {
            account.Site = 'Queueable';
        }
        update accounts;
    }

    @future
    public static void futureMethod(Set<Id> accountIds) {
        for (List<Account> accounts : [SELECT ID FROM Account WHERE Id = :accountIds]) {
            for (Account account : accounts) {
                account.Site = 'Future';
            }
            update accounts;
        }
    }
}

/*
List<Account> accounts = new List<Account>();
accounts.add(new Account(name = 'TEST'));
insert accounts;

// Invoking a Queueable class
System.enqueueJob(new Demo02_AsyncApex(accounts));

// Invoking a future method
Map<Id, Account> mapAccounts = new Map<ID, Account>([SELECT Id FROM Account WHERE ID IN :accounts]);
Demo02_AsyncApex.someFutureMethod(mapAccounts.keySet());
*/

