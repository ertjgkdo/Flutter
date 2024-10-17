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

  LogModel copyWith(
      {String? id, String? title, String? description, DateTime? date}) {
    return LogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}
