import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/verification_request.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

//here i made those global to be accessed from both classes
final formKey = GlobalKey<FormState>();
final TextEditingController _controller1 = TextEditingController();
final TextEditingController _controller2 = TextEditingController();
final TextEditingController _controller3 = TextEditingController();
final TextEditingController _controller4 = TextEditingController();

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          FToast().init(context);
          return Form(
            key: formKey,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColor.primary.withOpacity(0.85),
                    AppColor.white
                  ])),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      'Verify Phone',
                      style: TextStyle(fontSize: 24.sp, color: AppColor.white),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  const VerificationInputField(),
                  SizedBox(
                    height: 9.0.h,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.normal),
                      )),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  CustomButton(onPressed: () {
                    String code = _controller1.text +
                        _controller2.text +
                        _controller3.text +
                        _controller4.text;
                    if (code.length == 4) {
                      var cubit = GlobalCubit.get(context);
                      VerificationRequestModel model =
                          VerificationRequestModel(code, cubit.phone);
                      cubit.verify(model).then((value) {
                        //save that user logged in
                        CacheHelper.saveDataSharedPreference(
                                key: 'logged', value: true)
                            .then((value) {
                          //show toast and navigate to home
                          showToast('Verified Successfully');
                          Navigator.pushReplacementNamed(
                              context, Routes.homeRoute);
                        });
                      }).catchError((error) {
                        showToast(error);
                      });
                    } else {
                      showToast('Please Enter Valid Data');
                    }
                  }, 'Verify')
                ],
              ),
            ),
          );
        },
      )),
    ));
  }
}

class VerificationInputField extends StatelessWidget {
  const VerificationInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          FToast().init(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 9.5.h,
                  width: 8.0.h,
                  child: Center(
                    child: TextFormField(
                      controller: _controller1,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 9.5.h,
                  width: 8.0.h,
                  child: Center(
                    child: TextFormField(
                      controller: _controller2,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 9.5.h,
                  width: 8.0.h,
                  child: Center(
                    child: TextFormField(
                      controller: _controller3,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 9.5.h,
                  width: 8.0.h,
                  child: Center(
                    child: TextFormField(
                      controller: _controller4,
                      onChanged: (value) {
                        if (value.length == 1) {
                          String code = _controller1.text +
                              _controller2.text +
                              _controller3.text +
                              _controller4.text;
                          if (code.length == 4) {
                            var cubit = GlobalCubit.get(context);
                            VerificationRequestModel model =
                                VerificationRequestModel(code, cubit.phone);
                            cubit.verify(model).then((value) {
                              //save that user logged in
                              CacheHelper.saveDataSharedPreference(
                                      key: 'logged', value: true)
                                  .then((value) {
                                //show toast and navigate to home
                                showToast('Verified Successfully');
                                Navigator.pushReplacementNamed(
                                    context, Routes.homeRoute);
                              });
                            }).catchError((error) {
                              showToast(error);
                            });
                          } else {
                            showToast('Please Enter Valid Data');
                          }
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
