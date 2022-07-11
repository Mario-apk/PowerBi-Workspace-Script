#It will take default login details from Power Bi 
Login-PowerBI

#Here providing credential if do not want default credential fetching
#$username = yougmail@gmail.com
#$password = "credentialpswd"

#$groupID = "cc825ba1-b6ff-4c75-8cb0-141f76205b62" -- it will save group id from your web url from power bi service.

#Passing values as variable and use it in stored procedure .

#param( [string] $username, [string] $password ,[string] $groupID ,[string] $datasetID ) -- this be Useful when applying powershell script with stored procedure 
#$username = Read-Host "Enter a UserName" -AsSecureString
#$password = Read-Host "Enter a Password" -AsSecureString -MaskInput

#$securePassword = ConvertTo-SecureString -String $($password) -AsPlainText -Force
#Encypting password as after providing details

#$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $($username), $securePassword

#$user = Connect-PowerBIServiceAccount -Credential $credential

#$username = $user.UserName

#$result = "Hello world"
#Write-Output $result

$MailFailureNotify = @{"notifyOption"="MailOnFailure"} #it will send mail to login gmail if failed 

$data = Invoke-PowerBIRestMethod -Url https://api.powerbi.com/v1.0/myorg/groups/cc825ba1-b6ff-4c75-8cb0-141f76205b62/reports –Method GET -Body $MailFailureNotify
#It will fetch all details related to groupID providing into the url.

$data | ConvertFrom-Json  | ConvertTo-Json | Out-File "C:\Users\Downloads\FETCHDATA\datacheck\jsonf.json"
#It will convert API result as json file and dump on the provided path 
# Further we can use that data as source for power bi dataset and get all the dashboard related details like datasetID , datasetWorkspaceID ,embedUrl , id , isfrompbix ,isOwnedbyMe ,name , repoertType , Subscriptions , users , webUrl
#$data | ConvertTo-Json -depth 100| Out-File "C:\Users\km781a\Downloads\FETCHDATA\Fetching1.csv" json.txt




