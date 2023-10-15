import 'package:equatable/equatable.dart';

class NewsSource extends Equatable {
  const NewsSource(this.id, this.name, {this.isSelected = false});

  final String id;
  final String name;
  final bool isSelected;

  NewsSource copy({required bool isSelected}) =>
      NewsSource(id, name, isSelected: isSelected);

  @override
  List<Object?> get props => [id, name, isSelected];
}
