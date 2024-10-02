import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/controller/list_controller.dart';

final selectedProvider = StateProvider<int>((ref) => 0);
final showFieldProvider = StateProvider<bool>((ref) => false);
final editingProvider = StateProvider<bool>((ref) => false);
final errorMessageProvider = StateProvider<String?>((ref) => null);
final editingIndexProvider = StateProvider<int?>((ref) => null);
final listProvider =
    NotifierProvider<ListController, List<String>>(ListController.new);
