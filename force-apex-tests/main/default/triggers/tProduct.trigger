trigger tProduct on Product__c(before update) {
    for (Product__c product : trigger.new) {
        if (product.Description__c != null && product.Description__c?.startsWith('Lorem ipsum')) {
            product.Description__c = 'Default description';
        }
    }
}
