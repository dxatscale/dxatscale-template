This folder houses the export for NewRelic Dashboard that captures CI/CD performance metrics for this project.

Importing Dashboard to NewRelic

1. In the cicd-dashboard.json file, replace <your-account-id> with your NewRelic Account ID (make sure you enclose the Account ID with quotation marks)
2. Go to NewRelic, click the 'Dashboards' section, and Click on 'Import Dashboard' and then paste the .json file with Updated Account ID
3. Set your pipelines environment variables with the following (ensure you have generated an API Key for 'Insights', not the standard NewRelic API key)
``` 
   SFPOWERSCRIPTS_NEWRELIC='true'
   SFPOWERSCRIPTS_NEWRELIC_API_KEY=<NEWRELIC INSIGHTS INSERT KEY>
```
4. Execute pipelines as required and metrics should flow through to the Dashboard. You may need to Edit/Save the queries in the dashboard widgets (to refresh) if they are not displaying the metrics.

Further instructions can be found on the NewRelic website if Step 2 is unclear.
