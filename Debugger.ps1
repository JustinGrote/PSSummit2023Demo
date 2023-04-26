#Variable scopes and call stacks
$GLOBAL:MyFunGlobalVariable = Get-Process
$SCRIPT:MyScriptyScriptVar = Get-ChildItem
function Get-Test {
  $Test5 = 'ok'
  $Test = 5
  Invoke-MyInnerFunction $Test
}

function Invoke-MyInnerFunction {
  [CmdletBinding()]
  param($TestParameter, $NotSetParameter)
  $TestParameter
}

Get-Test


#Add to Watch
#Call Stack
#Detailed Variables
#Run to Cursor
