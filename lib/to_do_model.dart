// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ToDoModel extends Equatable {
  final String uuid = const Uuid().v4();
  final String? idNo;
  final String description;
  final bool isCompleted;
  ToDoModel({String? idNo, required this.description, this.isCompleted = false})
      : idNo = idNo ?? const Uuid().v4();
  @override
  List<Object?> get props => [idNo, description, isCompleted];

  ToDoModel copyWith({
    String? idNo,
    String? description,
    bool? isCompleted,
  }) {
    return ToDoModel(
      idNo: idNo ?? this.idNo,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

enum Filter { all, active, completed }
