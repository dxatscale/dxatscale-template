@SuppressWarnings('sf:CommentRequired, sf:MethodNamingConventions')
@isTest
private class TriggerBypassStrategyTest {

    @isTest
    private static void should_not_be_disabled_if_no_settings_for_the_user() {
        final User runningUser = createUser('FirstName', 'LastName');
        Boolean isDisabled;
        System.runAs(runningUser) {
            isDisabled = new TriggerBypassStrategy().isDisabled();
        }

        System.assert(!isDisabled, 'Is Disabled should be false');
    }

    @SuppressWarnings('sf:AvoidDMLInUnitTests')
    @isTest
    private static void should_not_be_disabled_if_setting_is_set_to_false() {
        final User runningUser = createUser('FirstName2', 'LastName2');
        final BypassTriggers__c setting = new BypassTriggers__c(
            SetupOwnerId = runningUser.Id,
            Bypass__c = false
        );

        insert setting;
        Boolean isDisabled;
        System.runAs(runningUser) {
            isDisabled = new TriggerBypassStrategy().isDisabled();
        }

        System.assert(!isDisabled, 'Is Disabled should be false');
    }

    @isTest
    private static void should_be_disabled_if_setting_is_set_to_true() {
        final User runningUser = createUser('FirstName2', 'LastName2');
        final BypassTriggers__c setting = new BypassTriggers__c(
            SetupOwnerId = runningUser.Id,
            Bypass__c = true
        );
        insert setting;
        Boolean isDisabled;
        System.runAs(runningUser) {
            isDisabled = new TriggerBypassStrategy().isDisabled();
        }

        System.assert(isDisabled, 'Is Disabled should be true');
    }

    private static User createUser(String fName, String lName) {
        @SuppressWarnings('sf:shortVariable')
        final User u = new User(
                            LastName = lName,
                            FirstName = fName,
                            Email = 'testing@test.com',
                            Alias = 'TestAl',
                            Username = 'testing@test.com' + System.currentTimeMillis(),
                            TimeZoneSidKey = 'Australia/Sydney',
                            LanguageLocaleKey = 'en_US',
                            LocaleSidKey = 'en_AU',
                            EmailEncodingKey = 'ISO-8859-1',
                            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id
        );
        insert u;
        return u;
    }

}
