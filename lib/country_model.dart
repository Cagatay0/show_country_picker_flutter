import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  String name;
  String flag;
  String diallingCode;
  String code;

  CountryModel({
    required this.name,
    required this.flag,
    required this.diallingCode,
    required this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        flag: json["flag"],
        diallingCode: json["dialling_code"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "flag": flag,
        "dialling_code": diallingCode,
        "code": code,
      };
  @override
  String toString() {
    return 'Country :{name: $name, flag: $flag, diallingCode: $diallingCode, code: $code}';
  }
}
