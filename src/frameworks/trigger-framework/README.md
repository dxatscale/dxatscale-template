# Lightweight Trigger Framework for Salesforce

This package allows for cleaner code when writing triggers.

It avoids writing boilerplate code in triggers, providing the
beginning of a clear separation of concern.

This package defines several interfaces that can be implemented in isolation.

## Example

### AccountTrigger.trigger

~~~java
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
   TriggerDispatcher.dispatch(TriggerHandlerFactory.getHandlersForSObjectType('Account'), Trigger.operationType);
}
~~~

### SampleAccountTriggerHandler.cls

~~~java
public with sharing class SampleAccountTriggerHandler implements Disableable,
                                                                 BeforeInsert,
                                                                 BeforeUpdate,
                                                                 BeforeDelete,
                                                                 AfterInsert,
                                                                 AfterUpdate,
                                                                 AfterDelete,
                                                                 AfterUndelete {
    public void beforeInsert(List<SObject> newItems) {
        System.debug('Account before insert');
    }

    public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Account before update');
    }

    public void beforeDelete(Map<Id, SObject> oldItems) {
        System.debug('Account before delete');
    }

    public void afterInsert(Map<Id, SObject> newItems) {
        System.debug('Account after insert');
    }

    public void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Account after update');
    }

    public void afterDelete(Map<Id, SObject> oldItems) {
        System.debug('Account after delete');
    }

    public void afterUndelete(Map<Id, SObject> oldItems) {
        System.debug('Account after undelete');
    }

    public Boolean isDisabled() {
        return false;
    }
}

~~~

## `Disableable` interface

When a trigger handler implements this interface, the handler informs the
dispatcher whether or not it should be executed.

## Why so many interfaces

Several reasons

* By looking at the declaration of the handler, one can clearly see what events it is responding to
* We avoid empty methods in the body of the handler
