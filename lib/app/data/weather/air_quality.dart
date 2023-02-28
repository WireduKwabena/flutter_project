class AirQuality {
  int? co;
  int? no2;
  int? o3;
  int? so2;
  int? pm25;
  int? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: (json['co'] as num?)?.round(),
        no2: (json['no2'] as num?)?.round(),
        o3: (json['o3'] as num?)?.round(),
        so2: (json['so2'] as num?)?.round(),
        pm25: (json['pm2_5'] as num?)?.round(),
        pm10: (json['pm10'] as num?)?.round(),
        usEpaIndex: json['us-epa-index'] as int?,
        gbDefraIndex: json['gb-defra-index'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'co': co,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'us-epa-index': usEpaIndex,
        'gb-defra-index': gbDefraIndex,
      };
}
