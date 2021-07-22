/**
 * @description Apex representation of a HandlerConfiguration
 * This object contains the parameters required to dynamically instantiate a
 * trigger handler
 */
@SuppressWarnings('sf:MissingStaticMethodInNonInstantiatableClass')
public class TriggerHandlerConfig {

    /** @description Trigger handler type */
    public Type triggerHandler { get; private set; }

    /** @description Description of the Trigger handler */
    @SuppressWarnings('sf:LongVariable')
    public String triggerHandlerDescription { get; private set; }

    /**
     * @description Private constructor to return a new instance only after
     * Type has been validated
     *
     * @param builder Builder Object for handler configuration
     */
    private TriggerHandlerConfig(TriggerHandlerConfig.Builder builder) {
        this.triggerHandler = builder.triggerHandler;
        this.triggerHandlerDescription = builder.description;
    }

    /**
     * @description Builder class for Handler Configuration
     */
    public class Builder {
        /** @description Trigger handler type */
        @SuppressWarnings('sf:AvoidFieldNameMatchingMethodName, sf:VariableDeclarationHidesAnother')
        private Type triggerHandler;
        /** @description Description of the Trigger handler */
        @SuppressWarnings('sf:AvoidFieldNameMatchingMethodName')
        private String description;

        /**
         * @description Augments the builder with the triggerHandler name
         *
         * @param triggerHandler Name of the trigger handler
         * @return a builder augmented with the trigger handler type
         */
        public Builder triggerHandler(String triggerHandler) {
            System.debug('>>>' + Type.forName(triggerHandler));
            if (Type.forName(triggerHandler) != null) {
                this.triggerHandler = Type.forName(triggerHandler);
            }

            return this;
        }

        /**
         * @description Augments the builder with the triggerHandler description
         *
         * @param description Description of the trigger handler
         * @return a builder augmented with the description
         */
        public Builder description(String description) {
            this.description = description;
            return this;
        }


        /**
         * @description Builds a Trigger Handler Configuration
         * @return a valid TriggerHandler configuration if it passes the
         * validation, null otherwise
         */
        public TriggerHandlerConfig build() {
            if (this.triggerHandler == null) {
                return null;
            }

            return new TriggerHandlerConfig(this);
        }
    }
}
