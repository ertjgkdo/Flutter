import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/domain/log_model.dart';
import 'package:newproject/features/BitcoinApp/presentation/controller/list_controller.dart';
import 'package:newproject/features/BitcoinApp/presentation/controller/log_controller.dart';

final selectedProvider = StateProvider<int>((ref) => 0);
final showFieldProvider = StateProvider<bool>((ref) => false);
final editingProvider = StateProvider<bool>((ref) => false);
final errorMessageProvider = StateProvider<String?>((ref) => null);
final editingIndexProvider = StateProvider<int?>((ref) => null);
final logListProvider =
    NotifierProvider<LogController, List<LogModel>>(LogController.new);
final listProvider =
    NotifierProvider<ListController, List<String>>(ListController.new);
