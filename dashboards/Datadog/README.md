This folder houses the export for Datadog Dashboard that captures CI/CD performance metrics for this project.

Importing Dashboard to Datadog


1. Goto DataDog, and Click on Import and import dashboard 
2. Set your pipelines environment variables with the following
``` 
  SFPOWERSCRIPTS_DATADOG: 'true'
  SFPOWERSCRIPTS_DATADOG_HOST: '<DATADOG-HOST>'
  SFPOWERSCRIPTS_DATADOG_API_KEY: '<DATADOG-API-KEY>'

```
3. Check the templates for further examples
