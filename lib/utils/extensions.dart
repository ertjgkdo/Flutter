import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime{
  String format(){
    return DateFormat("dd-MM-yyyy").format(this);
  }
}

// extension DoubleFormatter on Double{
//   String formatDouble(){
//     return 
//   }
