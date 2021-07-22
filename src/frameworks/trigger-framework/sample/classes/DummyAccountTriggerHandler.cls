public with sharing class DummyAccountTriggerHandler implements Disableable,
                                                                BeforeInsert,
                                                                BeforeUpdate,
                                                                BeforeDelete {

    public void beforeInsert(List<SObject> newItems) {
        System.debug('Dummy beforeInsert');
    }

    public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Dummy beforeUpdate');
    }

    public void beforeDelete(Map<Id, SObject> oldItems) {
        System.debug('Dummy beforeDelete');
    }

    public Boolean isDisabled() {
        final TriggerBypassStrategy bypass = new TriggerBypassStrategy();
        return bypass.isDisabled();
    }
}
