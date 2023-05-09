![image](https://gblobscdn.gitbook.com/assets%2F-MI39dIf1BuKlg_oSIG_%2F-MersLlsLMydZ6V7hfP-%2F-MersUtb9fBk1m9NMuMc%2Fflowdiagram_revised.png?alt=media&token=b613b0a8-99e3-4702-8f38-033cb1d7700d)

This repo contains the follwing YAML based Github Pipeline defintions

-  validate.yml

   Pull Request Validation Pipeline, that validates incoming changes against a scratch org fetched from the pool
   
- quickbuild-build-deploy.yml

   Pipeline that gets triggered on a merge to the trunk (main), resulting in building a set of packages, deploying to a dev sandbox ( and then build a set of validated packages and finally publish that to artifact repository

- release-build-publish.yml

   Triggered on a merge to a release/x branch. Assumes a change has been created/tested in main/dev (quickbuild-build-deploy.yml) and needs to be included in the release via a cherry-pick to the release branch. This builds and publishes off the relase branch making it avialble for the release pipeline.


- release.yml
   A release pipeline that utilizes the release defintion to fetch artifacts from artifactory and then deploy to a sandbox 



- env-operations
  - prepare-ci-poool.yml
     Pipeline to prepare command is used to build scratch org pools for CI purposes

  - prepare-dev-poool.yml
     Pipeline to prepare command is used to build scratch org pools for development
   
  - pool-cleaner.yml
     Pipeline to drop the entire pools and facilatate for recreation at end of a day

  - delete-scratchorg-pool.yml
     Delete a particular scratch org fetched from the pool, to be used where the devs dont have access to delete scratch orgs from command line (Free Developer License) 


The sample pipelines utilise an azure pipelines variable group called DEVHUB which contains the following variables. As a prerequisite, this has to be setup manually
- DEVHUB_SFDX_AUTH_URL   : The auth url to DevHub, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

- DEV_SFDX_AUTH_URL: The auth url to Developer Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm


- ST_SFDX_AUTH_URL: The auth url to ST Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm


- SIT_SFDX_AUTH_URL: The auth url to SIT Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

- UAT_SFDX_AUTH_URL: The auth url to UAT Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

