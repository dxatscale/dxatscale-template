/**
 * @description Trigger Handler Interface to handle
 * beforeUpdate trigger events
 */
public interface BeforeUpdate {

    /**
     * @description handle afterUpdate trigger events
     * @param newItems Map of the items being updated in their new state
     * @param oldItems Map of the items being updated in their old state
     */
    void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);
}
