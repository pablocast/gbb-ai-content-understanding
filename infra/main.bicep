targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param environmentName string

@minLength(1)
@description('Location for the AI resource')
@allowed([
  'australiaeast'
  'swedencentral'
  'westus'
])
@metadata({
  azd: {
    type: 'location'
  }
})
param location string

@description('Id of the user or app to assign application roles')
param principalId string = ''

@description('Non-empty if the deployment is running on GitHub Actions')
param runningOnGitHub string = ''

var principalType = empty(runningOnGitHub) ? 'User' : 'ServicePrincipal'

var uniqueId = toLower(uniqueString(subscription().id, environmentName, location))
var resourcePrefix = '${environmentName}${uniqueId}'
var tags = {
    'azd-env-name': environmentName
    owner: 'azure-ai-sample'
}

// Organize resources in a resource group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
    name: '${resourcePrefix}-rg'
    location: location
    tags: tags
}

var aiServiceName = '${resourcePrefix}-aiservice'
module aiService 'br/public:avm/res/cognitive-services/account:0.8.1' = {
  name: 'aiService'
  scope: resourceGroup
  params: {
    name: aiServiceName
    location: location
    tags: tags
    kind: 'AIServices'
    sku: 'S0'
    customSubDomainName: aiServiceName
    restrictOutboundNetworkAccess: false
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
    roleAssignments: [
        {
          principalId: principalId
          roleDefinitionIdOrName: 'Cognitive Services User'
          principalType: principalType
        }
      ]
  }
}

// OpenAI Services
// Add model deployment
var openAiDeployments = [
        {
          name: 'gpt-4.1'
          model: {
            format: 'OpenAI'
            name: 'gpt-4.1'
            version: '2025-04-14'
          }
          sku: {
            name: 'GlobalStandard'
            capacity: 750
          }
        }
  ]


var openAiServiceName = '${resourcePrefix}-aoaiservice'
module openAiService 'br/public:avm/res/cognitive-services/account:0.7.2' = {
  name: 'openAiService'
  scope: resourceGroup
  params: {
    name: openAiServiceName
    location: 'eastus2'
    tags: tags
    kind: 'OpenAI'
    sku: 'S0'
    customSubDomainName: openAiServiceName
    restrictOutboundNetworkAccess: false
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
    disableLocalAuth: false
    deployments: openAiDeployments
  }
}


// USER ROLES
module openAiRoleUser './role.bicep' = {
  scope: resourceGroup
  name: 'openai-role-user'
  params: {
    principalId: principalId
    roleDefinitionId: '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd'
    principalType: principalType
  }
}

module cognitiveServicesRoleUser './role.bicep' = {
  scope: resourceGroup
  name: 'cognitiveservices-role-user'
  params: {
    principalId: principalId
    roleDefinitionId: 'a97b65f3-24c7-4388-baec-2e87135dc908'
    principalType: principalType
  }
}



output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
output AZURE_RESOURCE_GROUP string = resourceGroup.name
output AZURE_AI_ENDPOINT string = aiService.outputs.endpoint
output AZURE_OPENAI_ENDPOINT string = openAiService.outputs.endpoint
output AZURE_OAI_DEPLOYMENT_NAME string = openAiDeployments[0].name
output AZURE_OAI_DEPLOYMENT_MODEL string = openAiDeployments[0].model.name

