![image](https://gblobscdn.gitbook.com/assets%2F-MI39dIf1BuKlg_oSIG_%2F-MersLlsLMydZ6V7hfP-%2F-MersUtb9fBk1m9NMuMc%2Fflowdiagram_revised.png?alt=media&token=b613b0a8-99e3-4702-8f38-033cb1d7700d)


**Intro:**

This repo contains the follwing YAML based Azure Pipeline defintions

-  validate.yml
   Pull Request Validation Pipeline, that validates incoming changes against a scratch org fetched from the pool
   
- quick-build-deploy.yml
   Pipeline that gets triggered on a merge to the trunk (main), resulting in building a set of packages, deploying to a dev sandbox ( and then build a set of validated packages and finally publish that to artifact repository

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

**Getting Started:**

- Setup Azure Artifacts ( NB: You can follow similar approach to add any other Private NPM Registry as well. All you need is the .npmrc file securely stored )

  - To support publishing and consuming sfpowerscripts packages. Use the below quickstart links to create a npm feed and a .npmrc file
     https://docs.microsoft.com/en-us/azure/devops/artifacts/get-started-npm?view=azure-devops 
     https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/package/npm-authenticate?view=azure-devops

- Add this .npmrc file to Azure Pipelines Secure Files with the name .npmrc 
   
     https://docs.microsoft.com/en-us/azure/devops/pipelines/library/secure-files?view=azure-devops

- If you are using Azure Repo, ensure the build service account has the necessary permissions to push commits and tag into the repository

         https://stackoverflow.com/questions/56541458/azure-pipeline-doest-allow-to-git-push-throwing-genericcontribute-permission
   

- Setup a variable group  called CICD 

   To setup a variable group, follow instructions at 
   https://docs.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=classic

- Setup the following variables manually in the earlier created variable group

  - DEVHUB_SFDX_AUTH_URL   : The auth url to DevHub, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

  - DEV_SFDX_AUTH_URL: The auth url to Developer Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

  - ST_SFDX_AUTH_URL: The auth url to ST Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

  - SIT_SFDX_AUTH_URL: The auth url to SIT Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

   - UAT_SFDX_AUTH_URL: The auth url to SIT Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm
 
   -  scope : Scope for the packages to be published to the repository 


