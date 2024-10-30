import 'package:newproject/utils/exporter.dart';

class CountryController extends Notifier<String> {
  final List<String> countries = ["np", "us", "in"];

  @override
  String build() {
    // TODO: implement build
    return countries.first;
  }

  selectCountry(String country) {
    state = country;
  }
}
