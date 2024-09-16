import 'package:newproject/features/BitcoinApp/domain/transaction_model.dart';

class Profile {
  final String name;
  final double balance;
  final String? profilePicture;
  final List<Transaction> transactions;
  Profile(
      {required this.name,
      required this.balance,
      this.transactions = const [],
      this.profilePicture});

  get noOfTransaction => transactions.length;
}
