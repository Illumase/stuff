# Food selector for the week!
#random Stuff mixed for every day.

Enum RandomFood
{#Add Food here:
Pizza
Quesedias
Lasagne
Älplermakkaronen
Apfelwähe
Apprikosenwähe
Rabarberwähe
Käsekuchen
Pasta
Ravioli
Empanadas
Hamburger
Reiscasimir
gniocchi_sardi
Taglia_telle
Flammkuchen
Lachs
Seeteufel
Goldbut
Schinkengipfeli
Risotto
cuscus
Nüsslisalat_Ei
Spaghetti_carbonara
Bluhmenkohl_pastaauflauf
Mexikanisch
Gemüsewähe
Kabeljau
Lachspastete_spinat
}

Enum Meat
{#Add Food here:
Steak
Beaf
Chicken
Cordonbleu
Linseneintopf
Polenta_Rindfleisch
Pollosalvia
Rindstartar
CashewPollo
RindsRagu
Pizzarolle
Pollo_wraps
Estragon_pollo
Wurstsalat
Rindshuftstreifen
Empanadas_Rindfleisch
Chilliconcarne
}

function Food {

Clear-Host
  $Foods =  [Enum]::GetValues([RandomFood]) | Get-Random -Count 6
  $Foods += [Enum]::GetValues([Meat]) | Get-Random -Count 1

$foodsOfWeek = $Foods | Get-Random -Count 7
Write-Host `n "Here is you'r List of Meals for this week :D" `n
foreach ($day in [Enum]::GetValues([DayOfWeek])) {
    ([string]$day).Substring(0, 3) + ': ' + $foodsOfWeek[[DayOfWeek]::$day]
}
}
