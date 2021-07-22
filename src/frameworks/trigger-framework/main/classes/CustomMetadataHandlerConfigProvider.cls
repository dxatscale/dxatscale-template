/**
 * @description Configuration Provider for Trigger Handlers based on custom
 * metadata
 */
public with sharing class CustomMetadataHandlerConfigProvider implements HandlerConfigProvider {
    /**
     * @description Provides the trigger configuration for the handlers that
     * need to be instantiated for a specific SObject
     * @param sObjectType filter on the SObject
     * @return trigger configurations for the SObject
     */
    public List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType) {
        /** @description Trigger handlers configurations */
        final List<TriggerHandlerConfig> handlers = new List<TriggerHandlerConfig>();

        for (TriggerHandler__mdt config : this.getMetadataConfig(sObjectType)) {
            handlers.add(buildConfiguration(config));
        }

        return handlers;
    }

    /**
     * @description Fetches the required information to eventually dynamically
     * instantiate the Trigger Handler
     * @param sObjectType filter on the SObject
     * @return custom metadata entries for the SObject type
     */
    private List<TriggerHandler__mdt> getMetadataConfig(String sObjectType) {
        @SuppressWarnings('PMD.ApexCRUDViolation, sf:FieldLevelSecurity')
        final List<TriggerHandler__mdt> config =
            [SELECT MasterLabel,
                    HandlerClass__c,
                    HandlerDescription__c
                FROM TriggerHandler__mdt
                WHERE MasterLabel =: sObjectType];

        return config;
    }

    /** @description Builds a trigger handler configuration from a custom
     *  metadata record
     * @param config custom metadata record holding the configuration
     * @return a trigger handler configuration used to instantiate the trigger
     *  handler dynamically
     */
    private TriggerHandlerConfig buildConfiguration(TriggerHandler__mdt config) {
        return new TriggerHandlerConfig.Builder()
                    .triggerHandler(config.HandlerClass__c)
                    .description(config.HandlerDescription__c)
                    .build();
    }
}
