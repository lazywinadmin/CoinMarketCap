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
.PARAMETER Online
    Show the CoinMarketCap to the coin specified
.EXAMPLE
    Get-Coin
.EXAMPLE
    Get-Coin -id bitcoin

    Retrieve the current Bitcoin information
.EXAMPLE
    Get-Coin -convert EUR

    Retrieve all cryptocurrencies with EURO conversion.
.EXAMPLE
    Get-Coin -id btc

    Retrieve the current Bitcoin information
.EXAMPLE
    Get-Coin -id btc -convert eur

    Retrieve the current Bitcoin information with EURO conversion.
.EXAMPLE
    Coin btc

    Retrieve the current Bitcoin information
.EXAMPLE
    Coin btc -online

    Shows the CoinMarketCap page for Bitcoin
.NOTES
    https://github.com/lazywinadmin/CoinMarketCap
#>
    [CmdletBinding()]
    PARAM(
        [Parameter()]
        $CoinId,
        [Parameter()]
        [ValidateSet("AUD", "BRL", "CAD", "CHF", "CLP", "CNY",
            "CZK", "DKK", "EUR", "GBP", "HKD", "HUF", "IDR", "ILS",
            "INR", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP",
            "PKR", "PLN", "RUB", "SEK", "SGD", "THB", "TRY", "TWD",
            "ZAR")]
        $Convert,
        [switch]$Online
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

        try {
            Write-Verbose -Message "[$FunctionName] Querying API..."
            $Out = [pscustomobject](invoke-restmethod @splat -ErrorAction Stop -ErrorVariable Result)
    
            if($Online)
            {
                Write-Verbose -Message "[$FunctionName] Opening page"
                start-process -filepath "https://coinmarketcap.com/currencies/$CoinId/"
            }
            else{
                Write-Verbose -Message "[$FunctionName] Show Output"
                Write-Output $Out 
            }
        }
        catch {
            if ($_ -match 'id not found') {
                Write-Verbose -Message "[$FunctionName] did not find the CoinID '$CoinId', looking up for Symbol '$CoinId'..."
                if ($Convert) {
                    if ($Online) {
                        $Coins = Get-Coin -Convert $Convert | Where-Object {$_.Symbol -eq $CoinId}
                        start-process -filepath "https://coinmarketcap.com/currencies/$($Coins.id)/"
                    }
                    else {
                        Get-Coin -Convert $Convert | Where-Object {$_.Symbol -eq $CoinId}
                    }
                }
                else {
                    if($Online)
                    {
                        $Coins = Get-Coin | Where-Object {$_.Symbol -eq $CoinId}
                        start-process -filepath "https://coinmarketcap.com/currencies/$($Coins.id)/"
                    }
                    else{
                        Get-Coin | Where-Object {$_.Symbol -eq $CoinId}
                    }
                }
            }
            else {throw $_}
        }
        
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

function Get-CoinHistory {
    <#
.SYNOPSIS
    Retrieve history information on 
.DESCRIPTION
    Retrieve one or multiple Cryprocurrencies information 
.PARAMETER CoinID
    Specify the Cryptocurrency you want to retrieve.
    Default is Bitcoin
.PARAMETER Begin
    Specify the beginning of the range
.PARAMETER End
    Specify the end of the range
.EXAMPLE
    Get-CoinHistory -Begin '20170101' -end '20171101'
.EXAMPLE
    Get-CoinHistory -Begin '20170102' -End '20171001' -CoinId ethereum
.NOTES
    https://github.com/lazywinadmin/CoinMarketCap

#>
    [CmdletBinding()]
    PARAM(
        [Alias('Id')]
        $CoinId = 'bitcoin',

        [parameter(Mandatory = $true)]
        $Begin,

        [parameter(Mandatory = $true)]
        $End
    )

    TRY {
        $FunctionName = $MyInvocation.MyCommand

        Write-Verbose -Message "[$FunctionName] Build Splatting"
        $Splat = @{
            Uri = "https://coinmarketcap.com/currencies/$Coinid/historical-data/?start=$Begin&end=$End"
        }

        # Helper function
        # Source: Lee Holmes - http://www.leeholmes.com/blog/2015/01/05/extracting-tables-from-powershells-invoke-webrequest/
        function Get-HTMLTable {
            param(
                [Parameter(Mandatory = $true)]
                [Microsoft.PowerShell.Commands.HtmlWebResponseObject]
                $WebRequest,

                [Parameter(Mandatory = $true)]
                [int] $TableNumber)

            ## Extract the tables out of the web request
            $tables = @($WebRequest.ParsedHtml.getElementsByTagName("TABLE"))
            $table = $tables[$TableNumber]
            $titles = @()
            $rows = @($table.Rows)
            ## Go through all of the rows in the table
            foreach ($row in $rows) {
                $cells = @($row.Cells)
                ## If we've found a table header, remember its titles
                if ($cells[0].tagName -eq "TH") {
                    $titles = @($cells | % { ("" + $_.InnerText).Trim() })
                    continue

                }
                ## If we haven't found any table headers, make up names "P1", "P2", etc.
                if (-not $titles) {
                    $titles = @(1..($cells.Count + 2) | ForEach-Object { "P$_" })
                }
                ## Now go through the cells in the the row. For each, try to find the
                ## title that represents that column and create a hashtable mapping those
                ## titles to content

                $resultObject = [Ordered] @{}
                for ($counter = 0; $counter -lt $cells.Count; $counter++) {
                    $title = $titles[$counter]
                    if (-not $title) { continue }

                    $resultObject[$title] = ("" + $cells[$counter].InnerText).Trim()
                }
                ## And finally cast that hashtable to a PSCustomObject
                [PSCustomObject] $resultObject
            }
        }

        
        Write-Verbose -Message "[$FunctionName] Retrieving table..."
        $WebRequest = Invoke-WebRequest @Splat
        Get-HTMLTable -WebRequest $WebRequest -TableNumber 0
    }
    CATCH {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}


# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
