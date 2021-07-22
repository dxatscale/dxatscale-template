/**
 * @description Trigger Handler Interface to handle
 * afterUndelete trigger events
 */
public interface AfterUndelete {

    /**
     * @description handle afterUndelete trigger events
     * @param oldItems Map of the items being undeleted
     */
    void afterUndelete(Map<Id, SObject> oldItems);
}
