powershell -ExecutionPolicy ByPass
Set-ExecutionPolicy RemoteSigned
$UserCredential=Get-Credential
$s=New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -credential $UserCredential -Authentication Basic -AllowRedirection
import-PSSession -session $s
#Install-Module -Name AzureAD
#Install-Module MSOnline
Connect-MsolService -Credential $UserCredential
Get-MsolDomain
$dname=Read-Host 'Enter the domain name for which DKIM to be activated ::'
Get-DkimSigningConfig
New-DkimSigningConfig -DomainName $dname -Enabled $true
Get-DkimSigningConfig -Identity $dname | fl
Set-DkimSigningConfig -Identity $dname -Enabled $true
