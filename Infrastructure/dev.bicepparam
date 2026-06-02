using 'main.bicep'

// Shared registry — keep acrName and acrResourceGroupName identical in prod.bicepparam
param acrName             = 'workshopcajaacr'
param acrResourceGroupName = 'rg-workshopcajaacr'

// Dev-environment resources
param containerAppsEnvName = 'workshopcajadev'
param keyVaultName        = 'workshopcajadev'
param logAnalyticsName    = 'workshopcajadev'
param location            = 'northeurope'
param resourceGroupName   = 'rg-workshopcajadev'
param storageAccountName  = 'stworkshopcajadev'
