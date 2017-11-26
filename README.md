# CoinMarketCap

CoinMarketCap is an MIT licensed PowerShell module providing an easy to use wrapper around the coinmarketcap API.

Please note that all results are cached for 120 seconds.

## Contributing

Contributions are welcome via pull requests and issues.

## Buy me a beer / Donate

If you appreciate my work, you can donate BTC (Bitcoin) at the following address `1AQLLscs9rMfEkuHYfWzv6HTpeiJH3Swq1`

## Installation

```powershell
# Install the module from the PowerShell Gallery
Install-Module -Name CoinMarketCap
```

## Version History

* 0.0.1
  * Initial commit

```text
CommandType Name           Version Source
----------- ----           ------- ------
Function    Get-Coin       0.0.1   CoinMarketCap
Function    Get-CoinGlobal 0.0.1   CoinMarketCap
Function    Get-CoinID     0.0.1   CoinMarketCap
```

* 0.0.2
  * Add `Get-CoinHistory` to retrieve historical data between two dates (format 'yyyyMMdd') for the specified currency (default = 'bitcoin'). You can retrieve all the currency available using `Get-CoinID`

* 1.0.0
  * Get-Coin now accepts symbols. For example: You can do `Get-Coin BTC`.

## Usage

### Get Bitcoin information

```powershell
Get-Coin -CoinId bitcoin
```

or

```powershell
Coin btc
```

output:

```text
id                 : bitcoin
name               : Bitcoin
symbol             : BTC
rank               : 1
price_usd          : 5923.98
price_btc          : 1.0
24h_volume_usd     : 8592590000.0
market_cap_usd     : 98789398264.0
available_supply   : 16676187.0
total_supply       : 16676187.0
max_supply         : 21000000.0
percent_change_1h  : -3.27
percent_change_24h : -7.17
percent_change_7d  : -20.74
last_updated       : 1510520351
```

### Get cryptocurrencies id, name, symbol and rank

```powershell
Get-CoinID
```

```text
id                       name                  symbol rank
--                       ----                  ------ ----
bitcoin                  Bitcoin               BTC    1   
ethereum                 Ethereum              ETH    2   
bitcoin-cash             Bitcoin Cash          BCH    3   
ripple                   Ripple                XRP    4   
dash                     Dash                  DASH   5   
litecoin                 Litecoin              LTC    6   
monero                   Monero                XMR    7   
neo                      NEO                   NEO    8   
iota                     IOTA                  MIOTA  9   
nem                      NEM                   XEM    10  
ethereum-classic         Ethereum Classic      ETC    11  
qtum                     Qtum                  QTUM   12  
omisego                  OmiseGO               OMG    13  
zcash                    Zcash                 ZEC    14  
cardano                  Cardano               ADA    15  
lisk                     Lisk                  LSK    16  
hshare                   Hshare                HSR    17  
tether                   Tether                USDT   18  
eos                      EOS                   EOS    19  
stellar                  Stellar Lumens        XLM    20  
bitconnect               BitConnect            BCC    21  
waves                    Waves                 WAVES  22  
stratis                  Stratis               STRAT  23  
populous                 Populous              PPT    24  
ark                      Ark                   ARK    25  
steem                    Steem                 STEEM  26  
bitshares                BitShares             BTS    27  
ardor                    Ardor                 ARDR   28  
komodo                   Komodo                KMD    29  
bytecoin-bcn             Bytecoin              BCN    30  
augur                    Augur                 REP    31  
decred                   Decred                DCR    32  
maidsafecoin             MaidSafeCoin          MAID   33  
tenx                     TenX                  PAY    34  
pivx                     PIVX                  PIVX   35  
gas                      Gas                   GAS    36  
monacoin                 MonaCoin              MONA   37  
golem-network-tokens     Golem                 GNT    38  
salt                     SALT                  SALT   39  
vertcoin                 Vertcoin              VTC    40  
binance-coin             Binance Coin          BNB    41  
factom                   Factom                FCT    42  
kyber-network            Kyber Network         KNC    43  
bitcoindark              BitcoinDark           BTCD   44  
electroneum              Electroneum           ETN    45  
veritaseum               Veritaseum            VERI   46  
basic-attention-token    Basic Attention Token BAT    47  
walton                   Walton                WTC    48  
bytom                    Bytom                 BTM    49  
digixdao                 DigixDAO              DGD    50  
siacoin                  Siacoin               SC     51  
tron                     TRON                  TRX    52  
dogecoin                 Dogecoin              DOGE   53  
metaverse                Metaverse ETP         ETP    54  
gamecredits              GameCredits           GAME   55  
syscoin                  Syscoin               SYS    56  
byteball                 Byteball Bytes        GBYTE  57  
blocknet                 Blocknet              BLOCK  58  
iconomi                  Iconomi               ICN    59  
civic                    Civic                 CVC    60  
status                   Status                SNT    61  
0x                       0x                    ZRX    62  
lykke                    Lykke                 LKK    63  
aeternity                Aeternity             AE     64  
verge                    Verge                 XVG    65  
gxshares                 GXShares              GXS    66  
singulardtv              SingularDTV           SNGLS  67  
raiden-network-token     Raiden Network Token  RDN    68  
metal                    Metal                 MTL    69  
minexcoin                MinexCoin             MNX    70  
pura                     Pura                  PURA   71  
bancor                   Bancor                BNT    72  
digibyte                 DigiByte              DGB    73  
attention-token-of-media ATMChain              ATM    74  
bitquence                Bitquence             BQX    75  
chainlink                ChainLink             LINK   76  
gnosis-gno               Gnosis                GNO    77  
nxt                      Nxt                   NXT    78  
vechain                  VeChain               VEN    79  
particl                  Particl               PART   80  
ripio-credit-network     Ripio Credit Network  RCN    81  
power-ledger             Power Ledger          POWR   82  
funfair                  FunFair               FUN    83  
kucoin-shares            KuCoin Shares         KCS    84  
zencash                  ZenCash               ZEN    85  
streamr-datacoin         Streamr DATAcoin      DATA   86  
monaco                   Monaco                MCO    87  
zcoin                    ZCoin                 XZC    88  
nexus                    Nexus                 NXS    89  
adx-net                  AdEx                  ADX    90  
neblio                   Neblio                NEBL   91  
edgeless                 Edgeless              EDG    92  
zeusshield               Zeusshield            ZSC    93  
storj                    Storj                 STORJ  94  
cryptonex                Cryptonex             CNX    95  
faircoin                 FairCoin              FAIR   96  
open-trading-network     Open Trading Network  OTN    97  
nav-coin                 NAV Coin              NAV    98  
mobilego                 MobileGo              MGO    99  
rlc                      iExec RLC             RLC    100 
```

### Get Global data

```powershell
Get-CoinGlobal
```

```text
total_market_cap_usd             : 194757913663.0
total_24h_volume_usd             : 22536410182.0
bitcoin_percentage_of_market_cap : 50.96
active_currencies                : 900
active_assets                    : 372
active_markets                   : 6513
last_updated                     : 1510520660
```

### Get the Historical data of a currency

```powershell
Get-CoinHistory -Begin '20171101' -End '20171111' -CoinId ethereum
```

```text
Date       : Nov 11, 2017
Open       : 298.59
High       : 319.45
Low        : 298.19
Close      : 314.68
Volume     : 842,301,000
Market Cap : 28,559,400,000

Date       : Nov 10, 2017
Open       : 320.67
High       : 324.72
Low        : 294.54
Close      : 299.25
Volume     : 885,986,000
Market Cap : 30,665,200,000

Date       : Nov 09, 2017
Open       : 308.64
High       : 329.45
Low        : 307.06
Close      : 320.88
Volume     : 893,250,000
Market Cap : 29,509,000,000

Date       : Nov 08, 2017
Open       : 294.27
High       : 318.70
Low        : 293.10
Close      : 309.07
Volume     : 967,956,000
Market Cap : 28,128,700,000

Date       : Nov 07, 2017
Open       : 298.57
High       : 304.84
Low        : 290.77
Close      : 294.66
Volume     : 540,766,000
Market Cap : 28,533,300,000

Date       : Nov 06, 2017
Open       : 296.43
High       : 305.42
Low        : 293.72
Close      : 298.89
Volume     : 579,359,000
Market Cap : 28,322,700,000

Date       : Nov 05, 2017
Open       : 300.04
High       : 301.37
Low        : 295.12
Close      : 296.26
Volume     : 337,658,000
Market Cap : 28,661,500,000

Date       : Nov 04, 2017
Open       : 305.48
High       : 305.48
Low        : 295.80
Close      : 300.47
Volume     : 416,479,000
Market Cap : 29,175,300,000

Date       : Nov 03, 2017
Open       : 288.50
High       : 308.31
Low        : 287.69
Close      : 305.71
Volume     : 646,340,000
Market Cap : 27,547,400,000

Date       : Nov 02, 2017
Open       : 290.73
High       : 293.91
Low        : 281.17
Close      : 287.43
Volume     : 904,901,000
Market Cap : 27,754,200,000

Date       : Nov 01, 2017
Open       : 305.76
High       : 306.40
Low        : 290.58
Close      : 291.69
Volume     : 553,864,000
Market Cap : 29,183,600,000
```