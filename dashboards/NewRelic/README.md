This folder houses the export for NewRelic Dashboard that captures CI/CD performance metrics for this project.

Importing Dashboard to NewRelic

1. Replace <accountId> with your NewRelic account id, in your cicd-dashboard.json
2. Goto NewRelic, and Click on Import and import dashboard to NewRelic
3. Set your pipelines environment variables with the following
``` 
   SFPOWERSCRIPTS_NEWRELIC='true'
   SFPOWERSCRIPTS_NEWRELIC_API_KEY=<NEWRELIC INSIGHTS INSERT KEY>
```
4. Check the templates for further examples
