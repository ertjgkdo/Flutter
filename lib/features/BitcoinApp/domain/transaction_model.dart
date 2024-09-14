import 'package:newproject/features/BitcoinApp/domain/user_model.dart';

class Transaction {
  final double amount;
  final String assetName;
  final String abreviations;
  final double percentage;
  final Profile contact;
  Transaction(
      {required this.amount,
      required this.abreviations,
      required this.assetName,
      required this.percentage,
      required this.contact});
}
