import '../../../../utils/exporter.dart';

class RecipeStepController extends Notifier<int> {
  final pages = 2;
  @override
  build() {
    return 0;
  }

  continueStep({required List<GlobalKey<FormState>> formKeys}) {
    if (state < 1) {
      if (formKeys[0].currentState!.validate()) state = state + 1;
    } else {
      if (formKeys[1].currentState!.validate()) state = state - 1;
    }
  }
}
