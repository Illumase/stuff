# Food selector for the week!
#random Stuff mixed for every day.
function Random-Food{

Param(
     [array]$InputList
   )

   return $InputList | Get-Random -Count 7 
   $InputList.Count;
}

$a = 1..200
Write-Output (Random-Food -InputList $a)

