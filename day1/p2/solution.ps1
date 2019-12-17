function Solve {
    Param(
        [int]$InputValue
    )
    
    $a = 0
    $i = ([math]::Floor( ($InputValue / 3) )) - 2
    $a += $i 
    while ($i -ge 0) {
        $i = ([math]::Floor( ($i / 3) )) - 2
        if ($i -ge 0) { 
            $a += $i
        }
    }
    $a
}

describe tests {
    it '14 should be 2' {
        Solve -InputValue 14 | should be 2
    }
    it '1969 should be 966' {
        Solve -InputValue 1969 | should be 966
    }
    it '100756 should be 50346' {
        Solve -InputValue 100756 | should be 50346
    }
}

$Solution = 0
$P2 = gc .\input.txt | % {$Solution += (Solve -InputValue $_)} 
$Solution
