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

## Usage

### Get Bitcoin information

```powershell
Get-Coin -CoinId bitcoin
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