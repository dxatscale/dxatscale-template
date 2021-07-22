@isTest
@SuppressWarnings('sf:CommentRequired')
private class CustomMetadataHandlerConfigProviderTest {
    @SuppressWarnings('sf:MethodNamingConventions, sf:AvoidCatchingGenericException')
    @isTest static void should_throw_an_exception_for_unknown_handler() {
        final HandlerConfigProvider configProvider = new CustomMetadataHandlerConfigProvider();

        try {
            configProvider.loadConfigurationBySObjectType('non existing sObject');
        } catch (Exception ex) {
            System.assert(ex != null, 'Exception should have been thrown');
        }
    }
}
