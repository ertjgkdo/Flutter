import 'package:newproject/features/HardwareMobileApp/domain/specs_model.dart';

class User {
  final String name;
  final String deviceName;
  final String? profilePicture;
  final String jobTitle;
  final int? noOfProjects;
  final int? hoursWorked;
  final int? upgradeStage;
  final int? upgradesCost;
  final List<Specs> specs;
  User({
    required this.name,
    required this.deviceName,
    required this.jobTitle,
    this.profilePicture,
    this.hoursWorked,
    this.noOfProjects,
    this.upgradeStage,
    this.upgradesCost,
    required this.specs,
  });
}
