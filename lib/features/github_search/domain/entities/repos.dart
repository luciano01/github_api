import 'package:equatable/equatable.dart';

class Repos extends Equatable {
  final String fullName;
  final String description;
  final String language;
  final int forksCount;

  Repos({
    required this.fullName,
    required this.description,
    required this.language,
    required this.forksCount,
  });

  @override
  List<Object?> get props => [
        fullName,
        description,
        language,
        forksCount,
      ];
}
