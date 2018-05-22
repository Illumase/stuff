# Food selector for the week!
#random Stuff mixed for every day.

Enum Food
{#Add Food here:
    Tacos
    Pizza
    Quesedias
    Lasagne
    Älplermakkeronen
    Apfelwähe
    Apprikosenwähe
    Rabarberwähe
    Käsekuchen
    Pasta
    Ravioli
    Empanadas
}
function Get-Food {
    $foodsOfWeek = [Enum]::GetValues([Food]) | Get-Random -Count 7

    foreach ($day in [Enum]::GetValues([DayOfWeek])) {
        ([string]$day).Substring(0, 3) + ': ' + $foodsOfWeek[[DayOfWeek]::$day]
    }
}
Get-Food
