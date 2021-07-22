/**
 * @description Trigger Handler Interface to handle
 * beforeInsert trigger events
 */
public interface BeforeInsert {

    /**
     * @description handle beforeInsert trigger events
     * @param newItems List of objects being created
     */
    void beforeInsert(List<SObject> newItems);
}
