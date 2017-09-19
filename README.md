# blue_prism_powerShell_AD_lookup
This a Blue Prism Object that can be re-used in such a way that you can invoke a PowerShell script and have the result captured in a Collection.


The DJ_AD_LOOKUP.xml is the Blue Prism Object . This object is invoked from the DJ_AD_LOOKUP_DEMO_PROCESS.xml.

The object interacts with the powershell script DJ_AD_LOOKUP_C#.ps1.

The powershell script is used to query the attributes of an Active Directory user from the AD based on a few filter parameters which are mentioned in the BP object when opened in Blue Prism.
