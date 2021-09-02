class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({
    this.code,
    this.msg,
    this.data,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  CMRespDto.formJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
