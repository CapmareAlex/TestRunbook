$PSVersionTable
Disable-AzContextAutosave -Scope Process
$AzureContext = (Connect-AzAccount -Identity).context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext
 


$vault_keys = Get-AzKeyVault

foreach ($key_vault in $vault_keys)
{    
    
    $keys = Get-AzKeyVaultKey -VaultName $key_vault.VaultName

    foreach( $key in $keys)
    {
        Write-Output ($key )
    }
}
