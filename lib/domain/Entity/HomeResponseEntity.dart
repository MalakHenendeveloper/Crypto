
class HomeResponseEntity {
  HomeResponseEntity({
      this.id, 
      this.symbol, 
      this.name, 
      this.image, 
      this.currentPrice, 
      this.marketCap, 
      this.marketCapRank, 
      this.fullyDilutedValuation, 
      this.totalVolume, 
      this.high24h, 
      this.low24h, 
      this.priceChange24h, 
      this.priceChangePercentage24h, 
      this.marketCapChange24h, 
      this.marketCapChangePercentage24h, 
      this.circulatingSupply, 
      this.totalSupply, 
      this.maxSupply, 
      this.ath, 
      this.athChangePercentage, 
      this.athDate, 
      this.atl, 
      this.atlChangePercentage, 
      this.atlDate, 
      this.roi, 
      this.lastUpdated, 
      this.sparklineIn7d,});

  String? id;
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  num? marketCap;
  num? marketCapRank;
  num? fullyDilutedValuation;
  num? totalVolume;
  num? high24h;
  num? low24h;
  num? priceChange24h;
  num? priceChangePercentage24h;
  num? marketCapChange24h;
  num? marketCapChangePercentage24h;
  num? circulatingSupply;
  num? totalSupply;
  num? maxSupply;
  num? ath;
  num? athChangePercentage;
  String? athDate;
  num? atl;
  num? atlChangePercentage;
  String? atlDate;
  dynamic roi;
  String? lastUpdated;
  SparklineIn7dEntity? sparklineIn7d;



}

class SparklineIn7dEntity {
  SparklineIn7dEntity({
      this.price,});

  List<num>? price;


}