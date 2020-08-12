<#
.DESCRIPTION
    Creates, and saves, a new certificate which is usable for all websites that
    IIS is hosing under the "localhost" TLD.
    The certificate is self-signed, saved with the friendly name "all-localsites",
    and will be sutiable for secure hosting of all localhost domains.
#>

New-SelfSignedCertificate -DnsName (
    Get-IISSite |`
    Select-Object -ExpandProperty Bindings |`
    Where-Object {$_.protocol -eq "https" -and $_.BindingInformation -match 'localhost$'} |`
    ForEach-Object {$_.BindingInformation.Split(":")[-1]}
) -FriendlyName "all-localsites-$(Get-Date -UFormat "%Y-%m-%d")"


echo "all-localsites-$(Get-Date -UFormat "%Y-%m-%d")"