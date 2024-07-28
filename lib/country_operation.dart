import 'package:show_country_picker_flutter/country_list.dart';

List<Map<String, dynamic>> countryList = [];
List<Map<String, dynamic>> filterCountryList = [];
getCountryList() async {
  countryList.clear();
  filterCountryList.clear();
  for (var element in country_list) {
    countryList.addAll([element]);
    filterCountryList.addAll([element]);
  }
}
