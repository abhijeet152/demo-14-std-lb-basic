# Create an App Registration (Service Principal) and create federated identity with scenario "Github Actions deploy Azure resources"
az ad app create \
  --display-name "github-actions-deploy-app"


# capture appId from the output
APP_ID=$(az ad app list --display-name "github-actions-deploy-app" --query "[0].appId" -o tsv)

echo "App ID: $APP_ID"




# manually Create federated identity with scenario "Github Actions deploy Azure resources"
# dont add comment in json parameters
# myorg="abhijeet152"
# myrepo="terraform-githubactions"
# mybranch="main"

# az ad app federated-credential create \
#   --id $APP_ID \
#   --parameters '{
#     "name": "github-actions-federated-cred",
#     "issuer": "https://token.actions.githubusercontent.com",
#     "organizationId": "$myorg",
#     "repository": "$myrepo",
#     "entityType": "Branch",
#     "branch": "$mybranch",
#     "subject": "repo:$myorg/$myrepo:ref:refs/heads/$mybranch",
#     "description": "Federated credential for GitHub Actions",
#     "audiences": ["api://AzureADTokenExchange"],    
#     "scenarios": ["GitHubActionsDeployAzureResources"]
#   }'

# Instead of using variables inside json parameters, directly put the values here and run the command.

myorg="abhijeet152"
myrepo="terraform-githubactions"
mybranch="main"

az ad app federated-credential create \
  --id $APP_ID \
  --parameters '{
    "name": "github-actions-federated-cred",
    "issuer": "https://token.actions.githubusercontent.com",
    "organizationId": "abhijeet152",
    "repository": "terraform-githubactions",
    "entityType": "Branch",
    "branch": "main",
    "subject": "repo:abhijeet152/terraform-githubactions:ref:refs/heads/main",
    "description": "Federated credential for GitHub Actions",
    "audiences": ["api://AzureADTokenExchange"],    
    "scenarios": ["GitHubActionsDeployAzureResources"]
  }'


# link the service principal with app id for appropriate role assignments
az ad sp create --id $APP_ID


# Assign role to the service principal at the resource group level or subscription level as needed


mysubscriptionId="fee3badb-324c-44d6-9f37-855eced24ba1"



# alternatively, assign role at subscription level
az role assignment create \
  --assignee $APP_ID \
  --role "Contributor" \
  --scope /subscriptions/$mysubscriptionId






