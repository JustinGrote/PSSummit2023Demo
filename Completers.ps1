#Using keyword completion
using namespace System.Management.Automation #Dot

# Classes now recognized as symbols
class Dog {
  [string]$Name
  [string]$Breed
  [string]$Status
}

$Spock = [Dog]::new() #Go to Def will work, also outline, also go to symbol
$Spock.Name = 'Spock'
$Spock.Breed = 'Great Pyr Mix'

# Enum properties now autocomplete as well
$PSStyle.Background #dot

# Splatting
$getItemParams = @{
  #Ctrl-Space Here
}
Get-Item @getItemParams

# Typed variables
[PSCredential]$cred = [pscredential]::New()
$cred #dot

# Output Type Inference
function Get-Dog {
  [OutputType('Dog')]
  param()

  [Dog]::new()
}

(Get-Dog) #Dot

#Dotnet namespace expansion
[Process] #Ctrl-space the type

#Positional Parameters Fixed
Get-Item -Path #-Filter will be the next because it's the next positional

#Pipeline Type Inference (Sort/Select/Where)
Get-Process
| Select-Object {$PSItem} #Dot on PSItem will have the type properties

#Attribute Inference
function RangeTest {
  param(
    [ValidateRange($x, [Int32]::)]$x #Intellisense in attributes works now
  )
}

#PSCustomObject Inference
$x = Get-ChildItem | Select-Object Name,Path

$x. #As long as x is assigned, specific completion will work here


#Get-Random Passthorugh
Get-ChildItem | Get-Random -Count 3 | Where-Object {$PSItem.} #This only works in the cli at the moment

#Base Class Property inference
class GreatPyrnees : Dog {
  GreatPyrnees() {
    $this #Will have properties of dog
  }
}

#HashTable Property Type Inference
$test = @{
  Items = (Get-ChildItem)
} #Run this first

$test.Items[0]. #Dot will now be able to infer the type

#Constructor Completers are much prettier
[ErrorRecord]::ne

