import '../../../../../../../core/base/base_model.dart';

class EditionId extends BaseModel<EditionId> {
 final int? id;

  EditionId({
    this.id,
  });
  factory EditionId.fromJson(Map<String, dynamic> json) {
    return EditionId(id: json['id'] == null ? -1 : json['id']);
  }

  EditionId fromJson(Map<String, dynamic> json) {
    return EditionId.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    return data;
  }

  @override
  List<Object?> get props => [];
}

String convertToJson(String input) {
  String output = input
      .replaceAll("{", '{"')
      .replaceAll("}", '"}')
      .replaceAll(":", '":"')
      .replaceAll(", ", '","');
  return output;
}
