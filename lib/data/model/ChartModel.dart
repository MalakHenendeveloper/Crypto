class ChartModel{
  int time;
  double? high;
  double? low;
  double? open;
  double? close;
  ChartModel({required this.time,
     this.high, this.low,
    this.open,
     this.close,
  });
 factory ChartModel.fromjson(List i
  ){
    return ChartModel(time: i[0]==null?null: i[0]!,
        high: i[2]==null?null: i[2]!,
        low: i[3]==null?null: i[3]!,
        open: i[1]==null?null: i[1]!
        , close: i[4]==null?null: i[4]!);
  }
}