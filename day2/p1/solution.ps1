function Solve {
    param(
        [int[]]$inputValue
    )

    $StartIndex = 0

    do {
        $firstInput  = $inputvalue[($inputValue[($StartIndex + 1)])]
        $secondInput = $inputvalue[($inputValue[($StartIndex + 2)])]
        $output      = $inputValue[($StartIndex + 3)]
        switch ($inputValue[$StartIndex]) {
            1 { $inputValue[$output] = ($firstInput + $secondInput) } # + 
            2 { $inputValue[$output] = ($firstInput * $secondInput) } # *
            default { throw "wtf?? $StartIndex - $($inputValue[$StartIndex])"}
        }
        
        $StartIndex = $StartIndex + 4

    } until ( ($inputValue[$StartIndex] -eq 99) -or ($StartIndex -ge ($inputValue.Length - 1)) )

    $inputValue
}

describe tests {
    it '1,0,0,0,99 should be 2,0,0,0,99' {
        Solve -InputValue 1,0,0,0,99 | should be 2,0,0,0,99
    }
    it '2,3,0,3,99 should be 2,3,0,6,99' {
        Solve -InputValue 2,3,0,3,99 | should be 2,3,0,6,99
    }
    it '2,4,4,5,99,0 should be 2,4,4,5,99,9801' {
        Solve -InputValue 2,4,4,5,99,0 | should be 2,4,4,5,99,9801
    }
    it '1,1,1,4,99,5,6,0,99 should be 30,1,1,4,2,5,6,0,99' {
        Solve -InputValue 1,1,1,4,99,5,6,0,99 | should be 30,1,1,4,2,5,6,0,99
    }
}

$P1 = Solve -inputValue ((gc .\input.txt) -split ',')
$P1[0]