function Get-Coin {
    <#
.SYNOPSIS
    Retrieve one or multiple Cryprocurrencies information 
.DESCRIPTION
    Retrieve one or multiple Cryprocurrencies information 
.PARAMETER CoinID
    Specify the Cryptocurrency you want to retrieve
.PARAMETER Convert
    Show the value in a fiat currency
.EXAMPLE
    Get-Coin
.EXAMPLE
    Get-Coin -id bitcoin
.EXAMPLE
    Get-Coin -convert EUR
.EXAMPLE
    Get-Coin -id bitcoin -convert EUR
.NOTES
    https://github.com/lazywinadmin/CoinMarketCap

#>
    [CmdletBinding()]
    PARAM(
        $CoinId,
        [Parameter()]
        [ValidateSet("AUD", "BRL", "CAD", "CHF", "CLP", "CNY",
            "CZK", "DKK", "EUR", "GBP", "HKD", "HUF", "IDR", "ILS",
            "INR", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP",
            "PKR", "PLN", "RUB", "SEK", "SGD", "THB", "TRY", "TWD",
            "ZAR")]
        $Convert
    )

    TRY {
        $FunctionName = $MyInvocation.MyCommand

        Write-Verbose -Message "[$FunctionName] Build Splatting"
        $Splat = @{
            Uri = 'https://api.coinmarketcap.com/v1/ticker'
        }

        if ($CoinID) {
            if ($Convert) {
                Write-Verbose -Message "[$FunctionName] Coin '$CoinID' with Currency '$Convert'"
                $Splat.Uri = "https://api.coinmarketcap.com/v1/ticker/$CoinID/?convert=$Convert"
                Write-Verbose -Message "[$FunctionName] Uri '$($Splat.Uri)'"
            }
            else {
                Write-Verbose -Message "[$FunctionName] Coin '$CoinID'"
                $Splat.Uri = "https://api.coinmarketcap.com/v1/ticker/$CoinID/"
                Write-Verbose -Message "[$FunctionName] Uri '$($Splat.Uri)'"
            }
        }
        elseif ($Convert -and -not $CoinID) {
            Write-Verbose -Message "[$FunctionName] Currency '$Convert'"
            $Splat.Uri = "https://api.coinmarketcap.com/v1/ticker/?convert=$Convert"
            Write-Verbose -Message "[$FunctionName] Uri '$($Splat.Uri)'"
        }


        Write-Verbose -Message "[$FunctionName] Querying API..."
        [pscustomobject](invoke-restmethod @splat)
    }
    CATCH {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}


function Get-CoinID {
    <#
.SYNOPSIS
    Retrieve cryptocurrencies ID, Name, Symbol and Rank 
.DESCRIPTION
    Retrieve cryptocurrencies ID, Name, Symbol and Rank
.EXAMPLE
    Get-CoinID
.NOTES
    https://github.com/lazywinadmin/CoinMarketCap

#>
    [CmdletBinding()]
    PARAM()

    TRY {
        $FunctionName = $MyInvocation.MyCommand

        Write-Verbose -Message "[$FunctionName] Retrieving id, name, symbol and rank"
        Get-Coin |Select-Object -Property id, name, symbol, rank
    }
    CATCH {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}


function Get-CoinGlobal {
    <#
.SYNOPSIS
    Retrieve cryptocurrencies ID, Name, Symbol and Rank 
.DESCRIPTION
    Retrieve cryptocurrencies ID, Name, Symbol and Rank
.EXAMPLE
    Get-CoinGlobal
.NOTES
    https://github.com/lazywinadmin/CoinMarketCap

#>
    [CmdletBinding()]
    PARAM(
        [Parameter()]
        [ValidateSet("AUD", "BRL", "CAD", "CHF", "CLP", "CNY",
            "CZK", "DKK", "EUR", "GBP", "HKD", "HUF", "IDR", "ILS",
            "INR", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP",
            "PKR", "PLN", "RUB", "SEK", "SGD", "THB", "TRY", "TWD",
            "ZAR")]
        $Convert
    )

    TRY {
        $FunctionName = $MyInvocation.MyCommand

        Write-Verbose -Message "[$FunctionName] Build Splatting"
        $Splat = @{
            Uri = 'https://api.coinmarketcap.com/v1/global/'
        }
        if ($Convert) {
            Write-Verbose -Message "[$FunctionName] Currency '$Convert'"
            $Splat.Uri = "https://api.coinmarketcap.com/v1/global/?convert=$Convert"
            Write-Verbose -Message "[$FunctionName] Uri '$($Splat.Uri)'"
        }

        Write-Verbose -Message "[$FunctionName] Querying API..."
        [pscustomobject](invoke-restmethod @splat)
    }
    CATCH {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
