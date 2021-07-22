/**
 * @description Trigger Handler Interface to handle
 * afterDelete trigger events
 */
public interface AfterDelete {

    /**
     * @description handle afterDelete trigger events
     * @param oldItems Map of the items being deleted
     */
    void afterDelete(Map<Id, SObject> oldItems);
}
