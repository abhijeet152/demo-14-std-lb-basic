- On local system : 

    - Create Terrform configuration files/modules.

 
- On Github Portal : 

    - Create github repo, 

       - copy public key to github repo settings for ssh access (vscode - github setup).
        
        - From vs code, setup a branch "main" and then check in the code from local system to main branch of remote repo.


- On azure portal :

    - create rg, storage acnt, container to store tf state file.

    - Create app registration, federated cred, link app to sp, give contributor permission to sp/app to perform actions on azure subscription (depends on repo).


- On Github portal : 

    - Create the secrets in github actions, for azure client_id(app_id), tennant_id, subscription id, and then for private_key, public_key used for vm.

    - Create new workflow at "."github/workflow/tf.yml" 

    - update the yaml file from local system.


- From local system : 

    - Pull the updated code. 
    
    - In Terraform code, update the backend config

    - update workflow with environment "working-directory: envs/${{xyz}}" as required.
    
    - update workflow with oidc permissions(read,write), azure credentials, etc.

    - In workflow yaml, add new task to create file from github actions secrets (terraform-azure.pem, terraform-azure.pub) to use it for vm creation.

    - commit and push the code to remote repo.


- On github actions : 

    - Check the actions-workflow. Select "Dev" and run the pipeline.


- On Azure cloud : 
    
    - Verify if the resources are created (rg, vnet, subnets, vm, bastion vm)

    - Access the vm from bastion host.





