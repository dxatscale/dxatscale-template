public with sharing class FooAccountTriggerHandler implements Disableable,
                                                              BeforeInsert,
                                                              BeforeUpdate,
                                                              BeforeDelete,
                                                              AfterInsert,
                                                              AfterUpdate,
                                                              AfterDelete,
                                                              AfterUndelete {

    public void beforeInsert(List<SObject> newItems) {
        System.debug('Dummy beforeInsert');
    }

    public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Dummy beforeUpdate');
    }

    public void beforeDelete(Map<Id, SObject> oldItems) {
        System.debug('Dummy beforeDelete');
    }

    public void afterInsert(Map<Id, SObject> newItems) {
        System.debug('Bar afterInsert');
    }

    public void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Bar afterUpdate');
    }

    public void afterDelete(Map<Id, SObject> oldItems) {
        System.debug('Bar afterDelete');
    }

    public void afterUndelete(Map<Id, SObject> oldItems) {
        System.debug('Bar afterUndelete');
    }

    public Boolean isDisabled() {
        final TriggerBypassStrategy bypass = new TriggerBypassStrategy();
        return bypass.isDisabled();
    }
}
