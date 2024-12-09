import 'package:flutter/material.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/form_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/widgets/components/textfield_method.dart';
import 'package:newproject/utils/exporter.dart';

class CustomRecipeForm extends ConsumerWidget {
  const CustomRecipeForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentStep = ref.watch(stepProvider);
    // print(currentStep);
    final stepController = ref.read(stepProvider.notifier);
    final formState = ref.watch(foodformProvider);
    final formController = ref.read(foodformProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //
          Expanded(
            child: Stepper(
                controlsBuilder: (context, details) => Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              details.onStepContinue!();
                            },
                            child: Text(
                                currentStep == 0 ? "Continue" : "Previous")),
                        if (currentStep > 0)
                          ElevatedButton(
                              onPressed: () {
                                if (formController.basicFormKey.currentState!
                                        .validate() &&
                                    formController
                                        .nutritionFormKey.currentState!
                                        .validate()) {
                                  formController.submit(context: context);
                                }
                              },
                              child: Text("Submit"))
                      ],
                    ),
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepContinue: () {
                  stepController.continueStep(formKeys: [
                    formController.basicFormKey,
                    formController.nutritionFormKey
                  ]);
                },
                onStepTapped: (value) {},
                steps: [
                  Step(
                      title: const Text("Basic"),
                      content: Form(
                        key: formController.basicFormKey,
                        child: Column(
                          children: [
                            formTextfield(
                                label: "Title",
                                controller: formController.titleController),
                            formTextfield(
                                label: "Servings",
                                controller: formController.servingsController),
                            formTextfield(
                                label: "Custom Food Box ID",
                                controller:
                                    formController.customFoodIdController),
                            formTextfield(
                                label: "Instructions",
                                controller:
                                    formController.instructionsController),
                            DropdownButtonFormField(
                                value: formState?.available,
                                hint: Text("Available"),
                                items: const [
                                  DropdownMenuItem(
                                    value: true,
                                    child: Text("Yes"),
                                  ),
                                  DropdownMenuItem(
                                    value: false,
                                    child: Text("No"),
                                  )
                                ],
                                onChanged: (value) {
                                  formController.addBasicInfo(available: value);
                                }),
                            formTextfield(
                                label: "Rating",
                                controller: formController.ratingController),
                            formTextfield(
                                label: "Image",
                                controller: formController.imageController),
                          ],
                        ),
                      )),
                  Step(
                      title: const Text("Nutrition Info"),
                      content: Form(
                        key: formController.nutritionFormKey,
                        child: Column(
                          children: [
                            nutritionForm(
                                label: "Calories",
                                controller: formController.caloriesController,
                                onChanged: (unit, value) =>
                                    formController.updateNutritionInfo(
                                        calories: int.parse(value ?? '0'),
                                        unit: unit)),
                            nutritionForm(
                              label: "Salt",
                              controller: formController.saltController,
                              onChanged: (unit, value) =>
                                  formController.updateNutritionInfo(
                                      salt: int.parse(value ?? '0'),
                                      unit: unit),
                            ),
                            // nutritionForm(
                            //     label: "Sugar",
                            //     controller: formController.sugarController),
                            // nutritionForm(
                            //     label: "Protein",
                            //     controller: formController.proteinController),
                            // nutritionForm(label: "Diets"),
                            MetaField(
                              controller: TextEditingController(),
                              formController: formController,
                              data: formState?.meta?.diets,
                            ),
                            MetaField(
                              controller: TextEditingController(),
                              formController: formController,
                              isDiet: false,
                              data: formState?.meta?.intolerances,
                            )
                          ],
                        ),
                      )),
                ]),
          )
        ],
      ),
    );
  }

  Row nutritionForm(
      {required String label,
      TextEditingController? controller,
      required Function(String? unit, String? currentValue) onChanged}) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: formTextfield(label: label, controller: controller)),
        Expanded(
          flex: 1,
          child: DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  child: Text("gm"),
                  value: "gm",
                ),
                DropdownMenuItem(
                  child: Text("kcal"),
                  value: "kcal",
                )
              ],
              onChanged: (unit) {
                onChanged(unit, controller?.text);
              }),
        )
      ],
    );
  }
}

class MetaField extends StatelessWidget {
  const MetaField(
      {super.key,
      required this.controller,
      required this.formController,
      this.isDiet = true,
      this.data});
  final TextEditingController controller;
  final FoodFormController formController;
  final bool isDiet;
  final List<String>? data;

  @override
  Widget build(BuildContext context) {
    final label = isDiet ? "Diet" : "Intolerance";
    final list = data ?? [];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: formTextfield(
                    label: label,
                    controller: controller,
                    validator: (value) {
                      if (list.isEmpty) {
                        return '$label cant be empty';
                      }
                      return null;
                    })),
            IconButton(
                onPressed: () {
                  formController.addMeta(
                      diet: isDiet ? controller.text : null,
                      intolerance: isDiet ? null : controller.text);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                  onPressed: () {
                    formController.removeMeta(
                        diet: isDiet ? list[index] : null,
                        intolerance: isDiet ? null : list[index]);
                  },
                  icon: const Icon(Icons.clear)),
            );
          },
          itemCount: data?.length ?? 0,
        )
      ],
    );
  }
}
