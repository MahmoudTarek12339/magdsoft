class LoginResponseModel{
  String? message;
  String? code;


  LoginResponseModel.fromJson(Map<String,dynamic> json){
    message=json['message'];
    code=json['code'];
  }
}