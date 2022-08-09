This folder houses the export for NewRelic Dashboard that captures CI/CD performance metrics for this project.

Importing Dashboard to NewRelic

1. Replace <accountId> with your NewRelic Account ID in the cicd-dashboard.json file (make sure you enclose the Account ID with quotation marks)
2. Go to NewRelic, click the Dashboards section, and Click on 'Import Dashboard' and then paste the .json file with updated Account ID
3. Set your pipelines environment variables with the following (ensure you have generated an API Key for 'Insights', not the standard NewRelic API key)
``` 
   SFPOWERSCRIPTS_NEWRELIC='true'
   SFPOWERSCRIPTS_NEWRELIC_API_KEY=<NEWRELIC INSIGHTS INSERT KEY>
```
4. Check the templates for further examples

Further instructions can be found on the NewRelic website if Step 2 is unclear.
