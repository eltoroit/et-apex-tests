@IsTest
public with sharing class Demo02_Data_Test {
    @TestSetup
    static void makeData(){
    }

    @IsTest
    private static void updateProducts() {
    }

    @IsTest
    private static void assertInsertedProducts() {
    }

    private static Integer countProducts() {
        return 0;
    }

    private static List<Product__c> getProducts() {
        return new List<Product__c>();
    }
}