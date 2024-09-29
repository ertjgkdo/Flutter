import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/controller/list_controller.dart';

final selectedProvider = StateProvider<int>((ref) => 0);

final listProvider =
    NotifierProvider<ListController, List<String>>(ListController.new);
