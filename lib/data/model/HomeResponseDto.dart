

import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';

class HomeResponseDto extends HomeResponseEntity {
  HomeResponseDto({
    super.id,
    super.symbol,
    super.name,
    super.image,
    super.currentPrice,
    super.marketCap,
    super.marketCapRank,
    super.fullyDilutedValuation,
    super.totalVolume,
    super.high24h,
    super.low24h,
    super.priceChange24h,
    super.priceChangePercentage24h,
    super.marketCapChange24h,
    super.marketCapChangePercentage24h,
    super.circulatingSupply,
    super.totalSupply,
    super.maxSupply,
    super.ath,
    super.athChangePercentage,
    super.athDate,
    super.atl,
    super.atlChangePercentage,
    super.atlDate,
    super.roi,
    super.lastUpdated,
    super.sparklineIn7d,
  });

  HomeResponseDto.fromJson(dynamic json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'];
    fullyDilutedValuation = json['fully_diluted_valuation'];
    totalVolume = json['total_volume'];
    high24h = json['high_24h'];
    low24h = json['low_24h'];
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
    marketCapChange24h = json['market_cap_change_24h'];
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    ath = json['ath'];
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    atl = json['atl'];
    atlChangePercentage = json['atl_change_percentage'];
    atlDate = json['atl_date'];
    roi = json['roi'];
    lastUpdated = json['last_updated'];
    sparklineIn7d = json['sparkline_in_7d'] != null
        ? SparklineIn7d.fromJson(json['sparkline_in_7d'])
        : null;
  }
}

class SparklineIn7d extends SparklineIn7dEntity {
  SparklineIn7d({super.price});

  SparklineIn7d.fromJson(dynamic json) {
    price = json['price'] != null ? json['price'].cast<num>() : [];
  }
}
