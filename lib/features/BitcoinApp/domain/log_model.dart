import 'package:equatable/equatable.dart';

class LogModel extends Equatable {
  final String? title;
  final String? description;
  final DateTime? date;
  final String? id;

  const LogModel({this.date, this.id, this.description, this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, date];

  LogModel copyWith({String? title, String? description, DateTime? dateTime}) {
    return LogModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: dateTime ?? this.date,
    );
  }
}
