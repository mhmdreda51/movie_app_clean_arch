import '../../domain/entities/generes.dart';

class GeneresModel extends Generes {
  const GeneresModel({required super.id, required super.name});

  Map<String, dynamic> toMap() {
    return {};
  }

  factory GeneresModel.fromJson(Map<String, dynamic> json) {
    return GeneresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
