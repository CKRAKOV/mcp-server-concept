using 'containerApp.bicep'

param imageName = 'catmcp'
param appName = 'catmcp'
param acrName = 'workshopcajaacr'
param environmentName = 'workshopcajadev'
param resourceGroupName = 'rg-workshopcajadev'
param keyVaultSecrets = [
  {
    key: 'catmcpclientid' // Must be lowercase - used in secretRef
    value: 'CatMcpClientId' // PascalCase - actual Key Vault secret name
  }
  {
    key: 'catmcpclientsecret' // Must be lowercase - used in secretRef
    value: 'CatMcpClientSecret' // PascalCase - actual Key Vault secret name
  }
  {
    key: 'catmcptenantid' // Must be lowercase - used in secretRef
    value: 'CatMcpTenantId' // PascalCase - actual Key Vault secret name
  }
]
param environment = [
  {
    name: 'EntraIdAuth__TenantId'
    secretRef: 'catmcptenantid'
  }
  {
    name: 'EntraIdAuth__ClientId'
    secretRef: 'catmcpclientid'
  }
  {
    name: 'EntraIdAuth__ClientSecret'
    secretRef: 'catmcpclientsecret'
  }
  {
    name: 'EntraIdAuth__PublicUrl'
    value: 'TODO-public-url-after-first-deploy'
  }
  {
    name: 'CatMcpApi__BaseUrl'
    value: 'TODO-upstream-api-base-url'
  }
  {
    name: 'IsTransportStateless'
    value: 'true'
  }
  // Application Insights connection string is automatically added by the template
]
