@SuppressWarnings('sf:CommentRequired, sf:MethodNamingConventions')
@isTest
private class TriggerDispatcherTest {

    @isTest static void should_dispatch_beforeInsert_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.BEFORE_INSERT);
        System.assert(handler.beforeInsertCalled, 'Before insert should have been called');
    }

    @isTest static void should_dispatch_beforeUpdate_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.BEFORE_UPDATE);
        System.assert(handler.beforeUpdateCalled, 'Before update should have been called');
    }

    @isTest static void should_dispatch_beforeDelete_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.BEFORE_DELETE);
        System.assert(handler.beforeDeleteCalled, 'Before delete should have been called');
    }

    @isTest static void should_dispatch_afterInsert_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.AFTER_INSERT);
        System.assert(handler.afterInsertCalled, 'After insert should have been called');
    }

    @isTest static void should_dispatch_afterUpdate_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.AFTER_UPDATE);
        System.assert(handler.afterUpdateCalled, 'After update should have been called');
    }

    @isTest static void should_dispatch_afterDelete_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.AFTER_DELETE);
        System.assert(handler.afterDeleteCalled, 'After delete should have been called');
    }

    @isTest static void should_dispatch_afterUndelete_event() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        TriggerDispatcher.dispatch(handler, TriggerOperation.AFTER_UNDELETE);
        System.assert(handler.afterUndeleteCalled, 'After Undelete should have been called');
    }

    @isTest static void should_bypass_a_disabled_handler() {
        final MockTriggerHandler handler = new MockTriggerHandler();
        handler.isDisabled = true;
        TriggerDispatcher.dispatch(handler, TriggerOperation.BEFORE_INSERT);
        System.assert(!handler.beforeInsertCalled, 'Before Insert should not have been called');
    }

    @isTest static void should_dispatch_events_to_multiple_handlers() {
        final MockTriggerHandler handler1 = new MockTriggerHandler();
        final MockTriggerHandler handler2 = new MockTriggerHandler();
        final List<Object> handlers = new List<Object>();
        handlers.add(handler1);
        handlers.add(handler2);
        TriggerDispatcher.dispatch(handlers, TriggerOperation.AFTER_INSERT);
        System.assert(handler1.afterInsertCalled, 'After Insert should have been called in a multiple handler scenario');
        System.assert(handler2.afterInsertCalled, 'After Insert should have been called in a multiple handler scenario');
    }


    /** @description Mock Trigger Handler */
    public class MockTriggerHandler implements Disableable, BeforeInsert, BeforeUpdate,
                                               BeforeDelete, AfterInsert, AfterUpdate,
                                               AfterDelete, AfterUndelete {

        public Boolean beforeInsertCalled = false;
        public Boolean beforeUpdateCalled = false;
        public Boolean beforeDeleteCalled = false;
        public Boolean afterInsertCalled = false;
        public Boolean afterUpdateCalled = false;
        public Boolean afterDeleteCalled = false;
        public Boolean afterUndeleteCalled = false;
        public Boolean isDisabled = false;

        /**
         * @description Mock Before Insert - sets before insert called
         * to true
         * @param newItems
         */
        public void beforeInsert(List<SObject> newItems) {
            this.beforeInsertCalled = true;
        }

        /**
         * @description Mock Before Update - sets before update called
         * to true
         * @param newItems
         * @param oldItems
         */
        public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
            this.beforeUpdateCalled = true;
        }

        /**
         * @description Mock Before Delete - sets before delete called
         * to true
         * @param oldItems
         */
        public void beforeDelete(Map<Id, SObject> oldItems) {
            this.beforeDeleteCalled = true;
        }

        /**
         * @description Mock After Insert - sets after insert called
         * to true
         * @param newItems
         */
        public void afterInsert(Map<Id, SObject> newItems) {
            this.afterInsertCalled = true;
        }

        /**
         * @description Mock After Update - sets after update called
         * to true
         * @param newItems
         * @param oldItems
         */
        public void afterupdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
            this.afterUpdateCalled = true;
        }

        /**
         * @description Mock After Delete - sets after delete called
         * to true
         * @param oldItems
         */
        public void afterDelete(Map<Id, SObject> oldItems) {
            this.afterDeleteCalled = true;
        }

        /**
         * @description Mock After Undelete - sets after undelete called
         * to true
         * @param oldItems
         */
        public void afterUndelete(Map<Id, SObject> oldItems) {
            this.afterUndeleteCalled = true;
        }

        /**
         * @description returns true if disabled
         * @return true if disabled
         */
        public Boolean isDisabled() {
            return this.isDisabled;
        }
    }
}
