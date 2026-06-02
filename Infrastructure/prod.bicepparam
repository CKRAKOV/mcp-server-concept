using 'main.bicep'

// Shared registry — keep acrName and acrResourceGroupName identical to dev.bicepparam
param acrName             = 'workshopcajaacr'
param acrResourceGroupName = 'rg-workshopcajaacr'

// Prod-environment resources
param containerAppsEnvName = 'workshopcajaprod'
param keyVaultName        = 'workshopcajaprod'
param logAnalyticsName    = 'workshopcajaprod'
param location            = 'northeurope'
param resourceGroupName   = 'rg-workshopcajaprod'
param storageAccountName  = 'stworkshopcajaprod'
