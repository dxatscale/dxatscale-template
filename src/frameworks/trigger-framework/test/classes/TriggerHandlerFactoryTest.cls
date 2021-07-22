@isTest
@SuppressWarnings('PMD.ApexDoc, sf:CommentRequired, sf:MethodNamingConventions')
private class TriggerHandlerFactoryTest {

    @isTest static void should_return_instances_of_handlers() {
        TriggerHandlerFactory.setConfigProvider((HandlerConfigProvider)new MockHandlerConfigProvider());
        final List<Object> handlers = TriggerHandlerFactory.getHandlersForSObjectType('Mock');
        System.assert(handlers[0] instanceOf MockHandler, 'Instance returned not of the right type');
    }

    @isTest static void should_return_empty_list_when_config_invalid() {
        TriggerHandlerFactory.setConfigProvider((HandlerConfigProvider)new MockInvalidHandlerConfigProvider());
        final List<Object> handlers = TriggerHandlerFactory.getHandlersForSObjectType('Mock');
        System.assert(handlers.isEmpty(), 'Instance returned not of the right type');
    }

    public class MockHandlerConfigProvider implements HandlerConfigProvider {
        public List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType) {
            List<TriggerHandlerConfig> handlers = new List<TriggerHandlerConfig>();
            final TriggerHandlerConfig h1 = new TriggerHandlerConfig.Builder()
                                                                    .triggerHandler('TriggerHandlerFactoryTest.MockHandler')
                                                                    .description('Mock Handler')
                                                                    .build();
            handlers.add(h1);
            return handlers;
        }
    }

    public class MockInvalidHandlerConfigProvider implements HandlerConfigProvider {
        public List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType) {
            List<TriggerHandlerConfig> handlers = new List<TriggerHandlerConfig>();
            final TriggerHandlerConfig h1 = new TriggerHandlerConfig.Builder()
                                                                    .triggerHandler('Invalid')
                                                                    .description('Invalid Mock Handler')
                                                                    .build();
            handlers.add(h1);
            return handlers;
        }
    }

    public class MockHandler {}
}
