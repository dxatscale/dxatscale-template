/**
 * @description Bypass Strategy Implementation using a heirarchical
 * custom setting
 */
public with sharing class TriggerBypassStrategy implements Disableable {

    /**
     * @description Checks if the triggers are disabled for the running user
     * @return true if disabled
     */
    public Boolean isDisabled() {
        return BypassTriggers__c.getInstance().Bypass__c;
    }
}
