$PSVersionTable

Disable-AzContextAutosave -Scope Process
$AzureContext = (Connect-AzAccount -Identity).context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext
 


$vault_keys = Get-AzKeyVault
Write-Output("#######################################################")
foreach ($key_vault in $vault_keys)
{    
    
    $secrets = Get-AzKeyVaultSecret -VaultName $key_vault.VaultName
    
    foreach( $secret in $secrets)
    {
        
        #secret.SecretValue | ConvertFrom-SecureString -AsPlainText 
        Write-Output($secret)
        $secretText = Get-AzKeyVaultSecret -VaultName $key_vault.VaultName -Name $secret.Name -AsPlainText
        Write-Output("Secret Value is : " + $secretText)
        Write-Output("#######################################################")
        
    }
}
