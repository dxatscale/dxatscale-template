public with sharing class BarAccountTriggerHandler implements Disableable,
                                                              AfterInsert,
                                                              AfterUpdate,
                                                              AfterDelete,
                                                              AfterUndelete {

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
