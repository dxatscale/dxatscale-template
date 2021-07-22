/**
 * @description Trigger Handler Interface to handle
 * beforeDelete trigger events
 */
public interface BeforeDelete {

    /**
     * @description handle beforeDelete trigger events
     * @param oldItems Map of the items being deleted
     */
    void beforeDelete(Map<Id, SObject> oldItems);
}
