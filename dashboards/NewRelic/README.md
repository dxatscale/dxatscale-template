This folder houses the export for NewRelic Dashboard that captures CI/CD performance metrics for this project.

Importing Dashboard to NewRelic

1. Replace <accountId> with your NewRelic Account ID, in your cicd-dashboard.json (make sure you enclose the Account ID with quotation marks)
2. Go to NewRelic, go to the Dashboard section, and Click on Import Dashboard and then paste the .json file with updated Account ID
3. Set your pipelines environment variables with the following
``` 
   SFPOWERSCRIPTS_NEWRELIC='true'
   SFPOWERSCRIPTS_NEWRELIC_API_KEY=<NEWRELIC INSIGHTS INSERT KEY>
```
4. Check the templates for further examples

Further instructions on the NewRelic website can be found if steps 1 and 2 are unclear.
