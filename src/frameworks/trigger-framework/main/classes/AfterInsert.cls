/**
 * @description Trigger Handler Interface to handle
 * afterInsert trigger events
 */
public interface AfterInsert {

    /**
     * @description handle afterInsert trigger events
     * @param newItems Map of the items being inserted
     */
    void afterInsert(Map<Id, SObject> newItems);
}
