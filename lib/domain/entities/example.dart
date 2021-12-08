import 'package:equatable/equatable.dart';

class Example extends Equatable {
  final int id;
  final String title;
  final String body;

  Example(this.id, this.title, this.body);

  @override
  List<Object> get props => [id, title, body];
}
