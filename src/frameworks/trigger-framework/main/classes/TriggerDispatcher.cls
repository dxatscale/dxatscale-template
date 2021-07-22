/**
 * @description Generic Trigger Event Dispatcher. Responsible for dispatching trigger
 * events to the relevant trigger handler.
 *
 * This method has a high complexity because of the hardening of the handler
 * calls
 */
@SuppressWarnings('PMD.StdCyclomaticComplexity, PMD.CyclomaticComplexity, sf:useSingleton, sf:CollapsibleIfStatements')
public class TriggerDispatcher {

    /**
     * @description fires handler methods depending on trigger context
     * call this method from your trigger passing in an instance of
     * a trigger handler which must implement the different interfaces depending
     * on the scenario.
     * Disableable if the trigger can be disabled
     * AfterInsert, AfterDelete, AfterUndelete, AfterUpdate
     * BeforeInsert, BeforeDelete, BeforeUpdate
     * @param handler the trigger handler to use
     * @param triggerEvent any of the above trigger event
     */
    public static void dispatch(Object handler, System.TriggerOperation triggerEvent) {
        if (handler instanceOf Disableable) {
            if (((Disableable) handler).isDisabled()) {
                return;
            }
        }

        switch on triggerEvent {
            when AFTER_DELETE {
                if (handler instanceOf AfterDelete) {
                    ((AfterDelete) handler).afterDelete(Trigger.oldMap);
                }
            }
            when AFTER_INSERT {
                if (handler instanceOf AfterInsert) {
                    ((AfterInsert) handler).afterInsert(Trigger.newMap);
                }
            }
            when AFTER_UNDELETE {
                if (handler instanceOf AfterUndelete) {
                    ((AfterUndelete) handler).afterUndelete(Trigger.oldMap);
                }
            }
            when AFTER_UPDATE {
                if (handler instanceOf AfterUpdate) {
                    ((AfterUpdate) handler).afterUpdate(Trigger.newMap, Trigger.oldMap);
                }
            }
            when BEFORE_DELETE {
                if (handler instanceOf BeforeDelete) {
                    ((BeforeDelete) handler).beforeDelete(Trigger.oldMap);
                }
            }
            when BEFORE_INSERT {
                if (handler instanceOf BeforeInsert) {
                    ((BeforeInsert) handler).beforeInsert(Trigger.new);
                }
            }
            when BEFORE_UPDATE {
                if (handler instanceOf BeforeUpdate) {
                    ((BeforeUpdate)handler).beforeUpdate(Trigger.newMap, Trigger.oldMap);
                }
            }
        }
    }

    /**
     * @description Dispatches the trigger handlers for processing
     * @param handlers trigger handlers that need to be invoked
     * @param triggerEvent any of the above trigger event
     */
    public static void dispatch(List<Object> handlers, System.TriggerOperation triggerEvent) {
        for (Object handler : handlers) {
            if (handler != null) {
                dispatch(handler, triggerEvent);
            }
        }
    }
}
