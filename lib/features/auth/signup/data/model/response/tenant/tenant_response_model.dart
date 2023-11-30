class TenantResponseModel {
  int? tenantId;

  TenantResponseModel({
    this.tenantId,
  });
  factory TenantResponseModel.fromJson(Map<String, dynamic> json) {
    return TenantResponseModel(tenantId: json['tenantId']);
  }

  TenantResponseModel fromJson(Map<String, dynamic> json) {
    return TenantResponseModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenantId'] = tenantId;
    return data;
  }
}

String convertToJson(String input) {
  String output = input
      .replaceAll("{", '{"')
      .replaceAll("}", '"}')
      .replaceAll(":", '":"')
      .replaceAll(", ", '","');
  return output;
}
