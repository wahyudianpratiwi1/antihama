class Sensor {
  int? frekuensi;
  int? malam;
  int? manual;
  int? motion;
  int? pagi;
  int? siang;

  Sensor({
    this.frekuensi,
    this.malam,
    this.manual,
    this.motion,
    this.pagi,
    this.siang,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        frekuensi: json["Frekuensi"],
        malam: json["Malam"],
        manual: json["Manual"],
        motion: json["Motion"],
        pagi: json["Pagi"],
        siang: json["Siang"],
      );

  Map<String, dynamic> toJson() => {
        "Frekuensi": frekuensi,
        "Malam": malam,
        "Manual": manual,
        "Motion": motion,
        "Pagi": pagi,
        "Siang": siang,
      };
}
