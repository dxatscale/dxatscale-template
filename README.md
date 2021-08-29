This repository contains all the core salesforce code and metadata for project <xxxx>

**Development**

This project is using a scratch org development model. In order to contribute you will need to create a scratch org with and push all metadata configuration and code.

**Dependencies**

- sfdx cli
- sfpowerkit plugin ( sfdx plugins:install @dxatscale/sfpowerkit)
- @dxatscale/sfpowerscripts plugin  ( sfdx plugins:install @dxatscale/sfpowerscripts)


**Scratch Org Setup**

For this you will need to be authenticated to a Dev Hub org - this is typically the Production Org

- Authenticate to the  DevHub (Production Org)

    You need to perform this step only once
   ```
    $ sfdx force:auth:web:login -setalias devhub
   ```


- Clone the repository 

- There are two options: fetch a scratch org with package dependencies pre-installed, or create an empty scratch org

    - Option A: Fetch a scratch org from the pool [Preferred]
       ```
    
       sfdx sfpowerscripts:pool:fetch -t dev -a  <alias>
      ```
    
    - Option B: Create a scratch org and install all dependencies
    
        ```
        sfdx force:org:create --definitionfile config/project-scratch-def.json --setalias <myScratchOrg> --targetdevhubusername <devhub-alias>
        sfdx sfpowerkit:package:dependencies:install --targetusername <myScratchOrg> -v <devhub-alias>
        
        Push the source code
        sfdx force:source:push --targetusername <myScratchOrg>

       ```

**File structure**

src

Each domain should be represented by a subfolder under this directory. For example, the core schema is defined as src/core-crm.

src-env-specific

Metadata that is specific to a particular org should be stored here, under the relevant org folder e.g. sit.

src-access-management

This folder is comprised of metadata relating to profiles and other access management.

scripts

Container for scripts organised by domain e.g. customer, candidates. Initialisation scripts for scratch orgs are also found here.

forceignores

Container for .forceignore files belonging to different scratchorg configurations.

src-temp

New metadata created in scratch orgs is automatically pulled to this location, and must be moved into a package as it does not get deployed.


