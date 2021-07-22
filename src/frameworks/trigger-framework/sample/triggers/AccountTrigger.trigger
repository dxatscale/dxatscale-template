trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

   /*
   Logger logger = LoggerFactory.getLogger(
      'AccountTrigger'
   );

   logger.info()
      .property('Trigger Event', Trigger.operationType)
      .write('Entering Account Trigger');
   */

   TriggerDispatcher.dispatch(
      TriggerHandlerFactory.getHandlersForSObjectType('Account'), 
      Trigger.operationType
   );

   /*
   LoggerFactory.flush();
   */
}
