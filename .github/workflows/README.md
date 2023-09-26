![image](https://gblobscdn.gitbook.com/assets%2F-MI39dIf1BuKlg_oSIG_%2F-MersLlsLMydZ6V7hfP-%2F-MersUtb9fBk1m9NMuMc%2Fflowdiagram_revised.png?alt=media&token=b613b0a8-99e3-4702-8f38-033cb1d7700d)

This repo contains the following YAML based Github Pipeline definitions

- validate.yml

   Pull Request Validation Pipeline, that validates incoming changes against a scratch org fetched from the pool

- quickbuild-deploy-build.yml

   Pipeline that gets triggered on a merge to the trunk (main), resulting in building a set of packages, deploying to a dev environment and then build a set of validated packages and finally publish that to artifact repository. It also creates a release definition file which concurrency used to deploy a release to desired environment (test, production, etc.)

- build-patch.yml

   Triggered on a merge to a release/x branch. Assumes a change has been created/tested in main/dev (quickbuild-deploy-build.yml) and needs to be included in the release via a cherry-pick to the release branch. This builds and publishes off the release branch making it available for the release pipeline. It also creates a release definition file for the patch release.

- release.yml
   A release pipeline that utilizes the release definition to fetch artifacts from artifactory and then deploy to a desired environment (test, production, etc.)


- env-operations
  - prepare-ci-pool.yml
     Pipeline to prepare command is used to build scratch org pools for CI purposes

  - prepare-dev-pool.yml
     Pipeline to prepare command is used to build scratch org pools for development

  - pool-cleaner.yml
     Pipeline to drop the entire pools and facilitate for recreation at end of a day

  - delete-scratchorg-pool.yml
     Delete a particular scratch org fetched from the pool, to be used where the devs dont have access to delete scratch orgs from command line (Free Developer License)


The sample pipelines utilize an azure pipelines variable group called DEVHUB which contains the following variables. As a prerequisite, this has to be setup manually

- DEV_SFDX_AUTH_URL: The auth url to Developer Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

- TEST_SFDX_AUTH_URL: The auth url to TEST Sandbox, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

- DEVHUB_SFDX_AUTH_URL: The auth url to DevHub, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm

- PROD_SFDX_AUTH_URL: The auth url to DevHub, You can retrieve the auth URL by following the ling here https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_auth_sfdxurl.htm