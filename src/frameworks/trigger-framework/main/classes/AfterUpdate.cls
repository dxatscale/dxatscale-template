/**
 * @description Trigger Handler Interface to handle
 * afterUpdate trigger events
 */
public interface AfterUpdate {

    /**
     * @description handle afterUpdate trigger events
     * @param newItems Map of the items being updated in their new state
     * @param oldItems Map of the items being updated in their old state
     */
    void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);
}
