import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/verification_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/verification_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  List<dynamic> products = [];

  getProducts() {
    emit(GetProductsLoadingState());
    DioHelper.getData(
        url: 'http://magdsoft.ahmedshawky.fun/api/getProducts',
        query: {}).then((value) {
      products = value.data['products'];
      log(products.length.toString());
      emit(GetProductsSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetProductsErrorState(error.toString()));
    });
  }

  List<dynamic> helper = [];

  List<ProductModel> laptops = [];

  setProducts() {
    //Products List
    laptops = products.map((e) => ProductModel.fromJson(e)).toList();
  }

  updateProducts(String company) {
    if (company == 'All') {
      setProducts();
    } else {
      laptops = laptops.where((element) => element.company == company).toList();
    }
    emit(UpdateState());
  }

  int selectedChip = 0;

  updateChip(int index) {
    selectedChip = index;
    emit(ChangeChoiceState());
  }

  getHelper() {
    emit(GetHelperLoadingState());
    DioHelper.getData(
        url: 'http://magdsoft.ahmedshawky.fun/api/getHelp',
        query: {}).then((value) {
      helper = value.data['help'];
      emit(GetHelperSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetHelperErrorState(error.toString()));
    });
  }

  late LoginResponseModel logModel;

  late String phone;

  Future login(LoginRequest loginModel) async {
    emit(GetLogInLoadingState());
    phone = loginModel.phone;
    await DioHelper.postData(
            url: 'https://magdsoft.ahmedshawky.fun/api/verifyPhone',
            body: {'phone': loginModel.phone, 'name': loginModel.name})
        .then((value) {
      logModel = LoginResponseModel.fromJson(value.data);
      emit(GetLogInSuccessState());
    }).catchError((error) {
      emit(GetLogInErrorState(error.toString()));
    });
  }

  late VerificationResponseModel userModel;

  Future verify(VerificationRequestModel model) async {
    emit(GetVerificationLoadingState());
    await DioHelper.postData(
        url: 'https://magdsoft.ahmedshawky.fun/api/otp',
        body: {'code': model.code, 'phone': model.phone}).then((value) {
      userModel = VerificationResponseModel.fromJson(value.data);
      emit(GetVerificationSuccessState());
    }).catchError((error) {
      emit(GetVerificationErrorState(error.toString()));
    });
  }

}
