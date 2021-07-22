/**
 * @description Disableable Interface to disable handlers
 * from processing trigger events
 */
public interface Disableable {

    /**
     * @description Returns true if handler is disabled
     * @return true if handler is disabled
     */
    Boolean isDisabled();
}
