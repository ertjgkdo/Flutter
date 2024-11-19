
import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime{
  String format(){
    return DateFormat("dd-MM-yyyy").format(this);
  }
}

extension DoubleFormatting on double {
  String formatAmount() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }
}