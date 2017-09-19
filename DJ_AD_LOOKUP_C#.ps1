#######################
Import-Module activedirectory
$input_file_path = "C:\Users\deepak.joseph\Desktop\AD_LOOKUP"
$input_file_name = $input_file_path+"\input.csv"
$input_file_content = Import-Csv $input_file_name
$attribute_file_content = Get-Content $input_file_path"\attribute.txt" 
#######################



#############
#Trimming the Attribute File
$attributes = @()
foreach($attribute in $attribute_file_content)
    {
    $attributes+=$attribute.Trim()
    
    }


$headers = $input_file_content | Get-Member -MemberType NoteProperty | foreach {$_.Name}

$filter_string = @()
# checking how many attributes have values

foreach ($i in $input_file_content)
    {
        foreach($header in $headers)
            {
            if($i.$header -notlike "")
                {
                $filter_string +="($header -like ""$($i.$header)"")"
                #Read-Host
                }
            
            
    }
}

$server = # enter your domain contoso.com:3268
##############
#Preparing the get-aduser filter
$fil= $null
foreach($filter in $filter_string)
    {
    $fil +=$filter+" -and "
    
    }
$fil=$fil.TrimEnd(" -and")

if(Get-Item $input_file_path"\output.csv" -ErrorAction SilentlyContinue){Remove-Item $input_file_path"\output.csv"  }
Get-ADUser -Filter $fil -Server $server -Properties $attributes | select $attributes #| Export-Csv $input_file_path"\output.csv"  -NoTypeInformation -Force
