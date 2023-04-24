This folder houses the export for Splunk Dashboard that captures CI/CD metrics for this project.

Importing Dashboard to Splunk

1. Goto Splunk, create a dashboard and click on Source
2. Copy paste the xml file to the Source and change the index
3. Set your pipelines environment variables with the following

```
  SFPOWERSCRIPTS_SPLUNK: 'true'
  SFPOWERSCRIPTS_SPLUNK_HOST: '<SPLUNK-HOST>'
  SFPOWERSCRIPTS_SPLUNK_API_KEY: '<SPLUNK-API-KEY>'

```

4. Execute pipelines as required and metrics should flow through to the Dashboard.
