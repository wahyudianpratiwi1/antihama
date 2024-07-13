class Sensor {
  int? malam;
  int? manual;
  int? motion;
  int? pagi;
  int? siang;

  Sensor({
    this.malam,
    this.manual,
    this.motion,
    this.pagi,
    this.siang,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        malam: json["Malam"],
        manual: json["Manual"],
        motion: json["Motion"],
        pagi: json["Pagi"],
        siang: json["Siang"],
      );

  Map<String, dynamic> toJson() => {
        "Malam": malam,
        "Manual": manual,
        "Motion": motion,
        "Pagi": pagi,
        "Siang": siang,
      };
}
