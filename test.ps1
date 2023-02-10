$PSVersionTable

Disable-AzContextAutosave -Scope Process
$AzureContext = (Connect-AzAccount -Identity).context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext
 


$vault_keys = Get-AzKeyVault

foreach ($key_vault in $vault_keys)
{    
    
    $secrets = Get-AzKeyVaultSecret -VaultName $key_vault.VaultName
    
    foreach( $secret in $secrets)
    {
        
        #secret.SecretValue | ConvertFrom-SecureString -AsPlainText 
        $secretText = Get-AzKeyVaultSecret -VaultName $key_vault.VaultName -Name $secret.Name -AsPlainText
        Write-Output($secretText)
        
        
    }
}

