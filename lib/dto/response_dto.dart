class ResponseDto {
  final int? code;
  final String? msg;
  dynamic data; // JsonArray [], JsonObject {}

  ResponseDto({
    this.code,
    this.msg,
    this.data,
  });

  ResponseDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
