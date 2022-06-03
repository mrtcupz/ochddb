class Titleseries {
  late final String series;




  Titleseries(
      {required this.series});

  factory Titleseries.fromJsonnew(Map<dynamic, dynamic> json) {
    return Titleseries(
        series: json['Series'],
    );
  }
  Map<dynamic, dynamic> toJsonnew() {

    return {
      'Series':series,

    };
  }

  @override
  int get hashCode => series.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Titleseries &&
              runtimeType == other.runtimeType &&
              series == other.series;


}