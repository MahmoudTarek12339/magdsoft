import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class VerificationResponseModel{
  String? message;
  AccountModel? account;

  VerificationResponseModel(this.message, this.account);

  VerificationResponseModel.fromJson(Map<String,dynamic> json){
    message=json['message'];
    account=json['account'];
  }
}