function Solve {
    Param(
        [int]$InputValue
    )

    ([math]::Floor( ($InputValue / 3) )) - 2
}

describe tests {
    it '12 should be 2' {
        Solve -InputValue 12 | should be 2
    }
    it '14 should be 2' {
        Solve -InputValue 14 | should be 2
    }
    it '1969 should be 654' {
        Solve -InputValue 1969 | should be 654
    }
    it '100756 should be 33583' {
        Solve -InputValue 100756 | should be 33583
    }
}

$i = 0
$P1 = gc .\input.txt | % {$i += (Solve -InputValue $_)} 
