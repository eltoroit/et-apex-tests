@IsTest
public with sharing class Demo02_Data_Test {
    @TestSetup
    static void makeData(){
        System.assertEquals(0, countProducts());
        List<Product_Family__c> productFamilies = Test.loadData(Product_Family__c.sObjectType, 'testDataProductFamily');
        List<Product__c> products = Test.loadData(Product__c.sObjectType, 'testDataProduct');
        System.assertEquals(products.size(), countProducts());
    }

    @IsTest
    private static void updateProducts() {
        List<Product__c> products = getProducts();
        Test.startTest();
        update products;
        Test.stopTest();
        for (Product__c product : getProducts()) {
            System.assert(product.Description__c == 'Default description');
        }
    }

    @IsTest
    private static void assertInsertedProducts() {
    }

    private static Integer countProducts() {
        Integer count = [SELECT COUNT() FROM Product__c];
        return count;
    }

    private static List<Product__c> getProducts() {
        List<Product__c> products = [SELECT Id, Description__c, Product_Family__r.Name FROM Product__c];
        return products;
    }
}