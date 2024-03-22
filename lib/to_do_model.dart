import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ToDoModel extends Equatable {
  final String uuid = const Uuid().v4();
  final String? idNo;
  final String description;
  final bool? isCompleted;
  ToDoModel({String? idNo, required this.description, this.isCompleted = false})
      : idNo = idNo ?? const Uuid().v4();
  @override
  List<Object?> get props => [idNo, description, isCompleted];
}

enum Filter { all, active, completed }
