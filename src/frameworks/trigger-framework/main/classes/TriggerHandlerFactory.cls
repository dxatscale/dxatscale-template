/**
 * @description Instantiates dynamically a trigger handler object of the back
 * of the specified configuration
 */
public with sharing class TriggerHandlerFactory {
    /** @description singleton */
    private static TriggerHandlerFactory instance;
    /** @description trigger handler configuration provider */
    @SuppressWarnings('sf:ImmutableField')
    private HandlerConfigProvider configProvider;

    /**
     * @description Sets a default configuration provider
     */
    public TriggerHandlerFactory() {
        this.configProvider = new CustomMetadataHandlerConfigProvider();
    }

    /**
     * @description this constructor provides the ability to select a
     * configuration provider to the factory, this can be useful from an
     * isolated testing perspctive
     * @param configProvider Instance of a HandlerConfigProvider
     */
    public TriggerHandlerFactory(HandlerConfigProvider configProvider) {
        this.configProvider = configProvider;
    }

    public static void setConfigProvider(HandlerConfigProvider provider) {
        instance = new TriggerHandlerFactory(provider);
    }

    /**
     * @description Provides the instances of handlers for a specific SObject
     * @param sObj SObject on which the trigger is firing, ie. Account, Case,
     * CustomObject__c
     * @return instances of trigger handlers
     */
    public static List<Object> getHandlersForSObjectType(String sObj) {
        if (instance == null) {
            instance = new TriggerHandlerFactory(new CustomMetadataHandlerConfigProvider());
        }

        final List<Object> handlers = new List<Object>();

        for (TriggerHandlerConfig config : instance.configProvider.loadConfigurationBySObjectType(sObj)) {
            final Object handler = createHandler(config);
            if (handler != null) {
                handlers.add(handler);
            }
        }
        return handlers;
    }

    /**
     * @description Dynamically create instances of the specified Type
     * @param config Trigger handler configuration
     * @return an instance of a trigger handler
     */
    @SuppressWarnings('sf:OnlyOneReturn, sf:AvoidCatchingGenericException')
    private static Object createHandler(TriggerHandlerConfig config) {
        if (config == null) {
            return null;
        }
        try {
            final Object handler = config.triggerHandler.newInstance();
            return handler;
        } catch (Exception e) {
            return null;
        }
    }
}
