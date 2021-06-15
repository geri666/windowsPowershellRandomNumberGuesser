# random number guesser 2.0

# created by gergö szijarto 2021

do {

cls

# declaring variables
[int] $guesses = 1
$numOk = $false
$numberCorrect = $false
$stopScript = $false
$rn = % {Get-Random -Minimum 1 -Maximum 100 } # creates a random integer between 1 and 100

# loop ask for numbers until the user guesses the random number
while ($numberCorrect -eq $false) {
    do {
        try {
            $userguess = Read-Host "guess the number between 1 and 100"

            if ($userguess -lt 1 -or $userguess -gt 100) { # error if the number is less than 1 or greater than 100

            Write-Host "ERROR: please enter numbers between 1 and 100" -ForegroundColor Red
            $numOk = $false
    
            } elseif ($userguess -gt 0 -and $userguess -lt 100) { # if the user input is fine, the loop stops and the program continues
            
            $numOk = $true

        }

    } catch {
        Write-Host "ERROR: please enter numbers between 1 and 100" -ForegroundColor Red # error if wrong input
        $numOk = $false
}



} while ($numOk -eq $false) # loops until the user enters a number between 1 and 100

if ($userguess -eq $rn) { # the user guesses the random number
    Write-Host "great job, you guessed the random number" -ForegroundColor Green
    Write-Host "guesses needed: $guesses"
    $numberCorrect = $true

    $goAgain = Read-Host "do you wish to play again? y/n"

    if (!($goAgain -eq "y") -or !($goAgain -eq "Y")) { # restarts program if the user enters y or Y, if not, it quits
        Write-Host "thanks for playing :)"
        $stopScript = $true
    }

} elseif ($userguess -gt $rn) { # hint if the guess is too high

    Write-Host "your guess was too high, try a lower number"
    $guesses++

} elseif ($userguess -lt $rn) { # hint if the guess is too low

    Write-Host "your guess was too low, try a higher number"
    $guesses++

        }

    }

} while ($stopScript -eq $false) # loops the whole program if the user wishes to play again

