
function New-Password {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER S4
    4 digit pin

    New-Password -Length 4 -MinNumbers 4
    
    .PARAMETER S8
    Easy 8 character password without special character
    
    New-Password -Length 8 -MinSpecials 0 -MinNumbers 1 -MinUppers 1 -MinLowers 6 -Uppers 'EAJHGFRQ' -Lowers 'ertypasfghjkzxvbc'

    .PARAMETER S12
    Easy 12 character password with one special character
    
    New-Password -Length 12 -MinSpecials 1 -MinNumbers 1 -MinUppers 4 -MinLowers 6 -Uppers 'EAJHGFRQ' -Lowers 'ertypasfghjkzxvbc' -Specials '!@#$%&*?'
    
    .PARAMETER S16
    16 character password
    
    .PARAMETER S24
    24 character password
    
    .PARAMETER S32
    32 character password
    
    .PARAMETER S64
    64 character password
    
    .PARAMETER S128
    128 character password
    
    .PARAMETER S512
    512 character password
    
    .PARAMETER Length
    Password Length
    
    .PARAMETER MinSpecials
    Minimum number of specials characters in the password.
    
    .PARAMETER MinNumbers
    Minimum number of numbers in the password.
    
    .PARAMETER MinUppers
    Minimum number of upper case letters in the password.
    
    .PARAMETER MinLowers
    Minimum number of lower case letters in the password.
    
    .PARAMETER MaxSpecials
    Maximum number of specials characters in the password.
    
    .PARAMETER MaxNumbers
    Maximum number of numbers in the password.
    
    .PARAMETER MaxUppers
    Maximum number of upper case letters in the password.
    
    .PARAMETER MaxLowers
    Maximum number of lower case letters in the password.
    
    .PARAMETER Specials
    Special characters that will be randomly selected from.
    
    .PARAMETER Numbers
    Numbers that will be randomly selected from.
    
    .PARAMETER Uppers
    upper case letters that will be randomly selected from.
    
    .PARAMETER Lowers
    lower case letters that will be randomly selected from.
    
    .PARAMETER Seed
    A number that will be used to seed randomization. seed only needs to set once. all passwords generated after will be based on last seed set. 

    .EXAMPLE  
    PS> New-Password
    O[99IFoH:&xEe6mc-:V+"1Zc$50XrA91
    
    By default New-password will produce a random password containing any charecter with a length of 32.

    .EXAMPLE  
    PS> New-Password -Length 20 -MaxSpecials 0 -MaxNumbers 0 -MinUppers 0 -MaxUppers 10 -MinLowers 10
    KhffSojuevkeBxxKnDui
    
    New-password is fully customizable

    .EXAMPLE 
    PS> New-Password -Nasty
    ,qw6Z";Rv1wXM?1op-DNa7f7i0;1j3q=8ido]4n3V15Uy5E870s7Tw{oP2H0\Ok?4(L4hczMQMB-1<#++0ly?7(Ll?#a@^.QWS{O-`@47-;2WDh2%5f9*Fw1Ms>*a8<DgwOZz8Q`3e$245osYW>wM}axre([]9|4oIPpb46KI1am88_<sT{!H6e0Ur70VwHJO-jN$BZFI<To?Lhb]1&:"90"u1qNHibe2d21GjzBP[fNYw~|O9~UP!u0?292[q8=mnx58H1Kp"QA32vukkSi03LSD;'[c6zbg4-052L8Y\^Y8'6}!,LtP<02_e|4C;|2,2+O0:1DZu456UF,i),2EeQ63}%32m62@NM01OS5.gD<bHV<80G$6'5^04Z]XCct57$T0'-Q:}1l.AdVRSB3d>yA0h_I'TQ30Us4F55D@96@1dhm8SMRLQk!Q9x}Rik3m=p04i2ynBlCw-gYg5|;83g5gG14i[2hF|O3wY7hw9fHN95B?-#`d"mQ5d+*!81q
    
    SmashBrothers CPU levels are valid parameter aliases
    - Puny
    - Wimpy
    - Weak
    - Normal
    - Hardy
    - Strong
    - Burly
    - Mighty
    - Nasty


    .EXAMPLE 
    PS> New-Password -Grande
    w=+WIkiqgQs2LK]M

    Startbucks cup sizes are valid parameter aliases
    - Demi
    - Short
    - Tall
    - Grande
    - Venti
    - Trenta

    .EXAMPLE 
    PS> New-Password -L16
    w=+WIkiqgQs2LK]M

    When given the same Seed, 'New-Password' will produce the same password, reapetedly. the seed only needs to be set once, all passwords generated after will be randomized based on the seed.
    
    PS> @(1,1,1) | New-Password -S16

    w=+WIkiqgQs2LK]M
    w=+WIkiqgQs2LK]M
    w=+WIkiqgQs2LK]M

    PS> New-Password -S16 

    (6s+YX3E9|7Py%8G

    PS> New-Password -S16 

    j~wjNoF2/8FYGNIR

    .NOTES
    General notes
    #>
    
    [cmdletbinding(DefaultParameterSetName = "Strong")]
    param(
        [parameter(ParameterSetName = 'Puny')][alias('Puny', 'Demi', 'PIN')][switch]$S4,
        [parameter(ParameterSetName = 'Wimpy')][alias('Wimpy', 'Short')][switch]$S8,
        [parameter(ParameterSetName = 'Weak')][alias('Weak', 'Tall')][switch]$S12,
        [parameter(ParameterSetName = 'Normal')][alias('Normal', 'Grande')][switch]$S16,
        [parameter(ParameterSetName = 'Hardy')][alias('Hardy', 'Venti')][switch]$S24,
        [parameter(ParameterSetName = 'Strong')][alias('Strong', 'Trenta')][switch]$S32,
        [parameter(ParameterSetName = 'Burly')][alias('Burly')][switch]$S64,
        [parameter(ParameterSetName = 'Mighty')][alias('Mighty')][switch]$S128,
        [parameter(ParameterSetName = 'Nasty')][alias('Nasty')][switch]$S512,
        [parameter(Mandatory, ParameterSetName = 'Custom')][uint64]$Length,
        [parameter(ParameterSetName = 'Custom')][uint16]$MinSpecials,
        [parameter(ParameterSetName = 'Custom')][uint16]$MinNumbers,
        [parameter(ParameterSetName = 'Custom')][uint16]$MinUppers,
        [parameter(ParameterSetName = 'Custom')][uint16]$MinLowers,
        [parameter(ParameterSetName = 'Custom')][uint16]$MaxSpecials,
        [parameter(ParameterSetName = 'Custom')][uint16]$MaxNumbers,
        [parameter(ParameterSetName = 'Custom')][uint16]$MaxUppers,
        [parameter(ParameterSetName = 'Custom')][uint16]$MaxLowers,
        [parameter(ParameterSetName = 'Custom')][char[]]$Specials = "!@#$%^&*()?/\|<>.,'`"[]{}=+-_~``:;", 
        [parameter(ParameterSetName = 'Custom')][char[]]$Numbers = '1234567890', 
        [parameter(ParameterSetName = 'Custom')][char[]]$Uppers = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        [parameter(ParameterSetName = 'Custom')][char[]]$Lowers = 'abcdefghijklmnopqrstuvwxyz',

        [parameter(ValueFromPipeline)][int32]$Seed
    )
    process {
        if ($PSBoundParameters.Keys -contains 'Seed') {
            Get-Random -SetSeed $Seed -Minimum 0 -Maximum 1 | out-null
        }

        switch($PSCmdlet.ParameterSetName){
            'Puny' {return New-Password -Length 4 -MinNumbers 4}
            'Wimpy' {return New-Password -Length 8 -MinSpecials 0 -MinNumbers 1 -MinUppers 1 -MinLowers 6 -Uppers 'EAJHGFRQ' -Lowers 'ertypasfghjkzxvbc'}
            'Weak' {return New-Password -Length 12 -MinSpecials 1 -MinNumbers 1 -MinUppers 4 -MinLowers 6 -Uppers 'EAJHGFRQ' -Lowers 'ertypasfghjkzxvbc' -Specials '!@#$%&*?'}
            'Normal' {return New-Password -Length 16}
            'Hardy' {return New-Password -Length 24}
            'Strong' {return New-Password -Length 32}
            'Burly' {return New-Password -Length 64}
            'Mighty' {return New-Password -Length 128}
            'Nasty' {return New-Password -Length 512}
        }

        # sanity checks
        if (
            $($MinSpecials + $MinNumbers + $MinUppers + $MinLowers) -gt $Length
        ) {
            throw "Sum of (MinSpecials, MinNumbers, MinUppers, MinLowers) can not be greater than Length"
        }
        if (
            $PSBoundParameters.ContainsKey('MaxSpecials') -and 
            $PSBoundParameters.ContainsKey('MaxNumbers') -and 
            $PSBoundParameters.ContainsKey('MaxUppers') -and 
            $PSBoundParameters.ContainsKey('MaxLowers') -and 
            ($MaxSpecials + $MaxNumbers + $MaxUppers + $MaxLowers) -lt $Length
        ) {
            throw "Sum of (MaxSpecials, MaxNumbers, MaxUppers, MaxLowers) can not be less than Length"
        }
        if ($MinSpecials -gt 0 -and $Specials.Length -lt 1) {
            throw "Specials characters must be greater than 1 when MinSpecials is greater than 0"
        }
        if ($MinNumbers -gt 0 -and $Numbers.Length -lt 1) {
            throw "Numbers characters must be greater than 1 when MinNumbers is greater than 0"
        }
        if ($MinUppers -gt 0 -and $Uppers.Length -lt 1) {
            throw "Uppers characters must be greater than 1 when MinUppers is greater than 0"
        }
        if ($MinLowers -gt 0 -and $Lowers.Length -lt 1) {
            throw "Lowers characters must be greater than 1 when MinLowers is greater than 0"
        }
        if ($PSBoundParameters.ContainsKey('MinSpecials') -and $PSBoundParameters.ContainsKey('MaxSpecials') -and $MinSpecials -gt $MaxSpecials) {
            throw 'MinSpecials is greater than MaxSpecials'
        }
        if ($MaxSpecials -gt $Length) {
            throw 'MaxSpecials is greater than Length'
        }
        if ($PSBoundParameters.ContainsKey('MinNumbers') -and $PSBoundParameters.ContainsKey('MaxNumbers') -and $MinNumbers -gt $MaxNumbers) {
            throw 'MinNumbers is greater than MaxNumbers'
        }
        if ($MaxNumbers -gt $Length) {
            throw 'MaxNumbers is greater than Length'
        }
        if ($PSBoundParameters.ContainsKey('MinUppers') -and $PSBoundParameters.ContainsKey('MaxUppers') -and $MinUppers -gt $MaxUppers) {
            throw 'MinUppers is greater than MaxUppers'
        }
        if ($MaxUppers -gt $Length) {
            throw 'MaxUppers is greater than Length'
        }
        if ($PSBoundParameters.ContainsKey('MinLowers') -and $PSBoundParameters.ContainsKey('MaxLowers') -and $MinLowers -gt $MaxLowers) {
            throw 'MinLowers is greater than MaxLowers'
        }
        if ($MaxLowers -gt $Length) {
            throw 'MaxLowers is greater than Length'
        }

        [uint64]$Remaining = $Length
        [char[]]$Characters = [char[]]::new($Length)
        [int]$X = 0

        # mins
        if ($MinSpecials -gt 0) {
            for ($i = 0; $i -lt $MinSpecials; ($i++, $X++) ) {
                $Characters[$X] = Get-Random -InputObject $Specials -Count 1
            }
            $Remaining -= $MinSpecials
        }  
        if ($MinNumbers -gt 0) {
            for ($i = 0; $i -lt $MinNumbers; ($i++, $X++) ) {
                $Characters[$X] = Get-Random -InputObject $Numbers -Count 1
            }
            $Remaining -= $MinNumbers
        }
        if ($MinUppers -gt 0) {
            for ($i = 0; $i -lt $MinUppers; ($i++, $X++) ) {
                $Characters[$X] = Get-Random -InputObject $Uppers -Count 1
            }
            $Remaining -= $MinUppers
        }
        if ($MinLowers -gt 0) {
            for ($i = 0; $i -lt $MinLowers; ($i++, $X++) ) {
                $Characters[$X] = Get-Random -InputObject $Lowers -Count 1
            }
            $Remaining -= $MinLowers
        }

        # pools
        [hashtable]$Pools = @{ }
        if ($PSBoundParameters.ContainsKey('MaxSpecials') ) {
            if (($MaxSpecials - $MinSpecials) -gt 0) {
                $Pools.Special = @{
                    Remaining = $MaxSpecials - $MinSpecials 
                    Chars     = $Specials
                }
            }
        }
        else {
            $Pools.Special = @{
                Chars = $Specials
            }
        }
        if ($PSBoundParameters.ContainsKey('MaxNumbers')) {
            if (($MaxNumbers - $MinNumbers) -gt 0) {
                $Pools.Numbers = @{
                    Remaining = $MaxNumbers - $MinNumbers 
                    Chars     = $Numbers
                }
            }
        }
        else {
            $Pools.Numbers = @{
                Chars = $Numbers
            }
        }
        if ($PSBoundParameters.ContainsKey('MaxUppers')) {
            if (($MaxUppers - $MinUppers) -gt 0) {
                $Pools.Uppers = @{
                    Remaining = $MaxUppers - $MinUppers 
                    Chars     = $Uppers
                }
            }
        }
        else {
            $Pools.Uppers = @{
                Chars = $Uppers
            }
        }
        if ($PSBoundParameters.ContainsKey('MaxLowers')) {
            if (($MaxLowers - $MinLowers) -gt 0) {
                $Pools.Lowers = @{
                    Remaining = $MaxLowers - $MinLowers 
                    Chars     = $Lowers
                }
            }
        }
        else {
            $Pools.Lowers = @{
                Chars = $Lowers
            }
        }

        # fill length
        for ($i = 0; $i -lt $Remaining; ($i++, $X++) ) {
            
            [string]$Key = Get-Random -InputObject @($Pools.Keys) -Count 1
            [hashtable]$Pool = $Pools[$Key]

            $Characters[$X] = Get-Random -InputObject $Pool.Chars -Count 1
            
            # ensure max's
            if ($Pool.ContainsKey('Remaining')) {
                $Pool.Remaining--
                if ($Pool.Remaining -eq 0) {
                    $Pools.Remove($Key)
                }
            }
        }
    
        # When used with InputObject, if the value of Count exceeds the number of objects 
        # in the collection, Get-Random returns all of the objects in random order.
        return $(Get-Random -InputObject $Characters -Count $($Characters.Count + 1) ) -join ''
    }
}

function New-Credential {
    [cmdletbinding()]
    param(
        [parameter(Mandatory)]
        [alias("u")]
        [string]
        $Username,

        [parameter(Mandatory)]
        [alias("p")]
        [string]
        $Password
    )
    process{
        $SecureString = ConvertTo-SecureString $Password -AsPlainText -Force
        return [System.Management.Automation.PSCredential]::new($Username, $SecureString)
    }
}


function Get-Hash {
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline, Position = 0)]
        $InputObject,
        
        [ValidateSet("byte", "hex", "string")]
        [string]
        $OutputAs = 'hex',

        [ValidateSet("MD5", "SHA256", "SHA512")]
        [string]
        $Algorithm = 'MD5',

        [ValidateSet("UTF8", "UFT16")]
        [string]
        $Encoding = "UFT16"
    )
    begin {        
        switch ($Algorithm) {
            'MD5' { $Cryptography = new-object System.Security.Cryptography.MD5CryptoServiceProvider } 
            'SHA256' { $Cryptography = new-object System.Security.Cryptography.SHA256Managed } 
            'SHA512' { $Cryptography = new-object System.Security.Cryptography.SHA512Managed } 
        }
    }
    process {
        # Sql Server returns utf8 hashes
        switch ($Encoding) {
            'UTF8' { $Bytes = [System.Text.Encoding]::UTF8.GetBytes($InputObject) }
            'UFT16' { $Bytes = [System.Text.Encoding]::Unicode.GetBytes($InputObject) }
        }
        $ByteArray = $Cryptography.ComputeHash($Bytes)

        switch ($OutputAs) {
            'byte' {
                $OutputObject = $ByteArray 
            }
            'hex' {
                [string]$OutputObject = [String]::Join("", ($ByteArray | ForEach-Object { "{0:X2}" -f $_ }))
            }
            'string' {
                foreach ($byte in $ByteArray) {
                    [string]$OutputObject += $byte.ToString()
                }
            }
        }
        return $OutputObject
    }
}
