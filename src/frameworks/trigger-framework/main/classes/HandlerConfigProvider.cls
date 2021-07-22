/**
 * @description Interface to load configuration of the trigger handlers based
 * on SObject Type
 */
public interface HandlerConfigProvider {

    /**
     * @description Provides the trigger configuration for the handlers that
     * need to be instantiated for a specific SObject
     * @param sObjectType filter on the SObject
     * @return trigger configurations for the SObject
     */
    List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType);
}
