import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/input_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/line_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

class LoginCard extends StatefulWidget {
  LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          FToast().init(context);

          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(
                top: 18.h,
                left: 5.w,
                right: 5.w,
              ),
              child: SizedBox(
                height: 38.0.h,
                child: Material(
                  elevation: 3.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(25.0),
                  color: AppColor.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 7.5,
                      ),
                      LineContainer(40.w, 3),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInputField('Enter your Full Name', _nameController,
                          validator: (value) {
                        if (value!.isEmpty) {
                          showToast('Please Enter Your Name');
                        }
                        return null;
                      }),
                      CustomInputField(
                          'Enter your Phone Number', _phoneController,
                          validator: (value) {
                        if (value!.isEmpty || value.length < 11) {
                          showToast('Please Enter Valid Phone Number');
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton('Login', onPressed: () async {
                        if (_phoneController.text.isNotEmpty &&
                            _nameController.text.isNotEmpty) {
                          LoginRequest _loginRequest = LoginRequest(
                              _phoneController.text, _nameController.text);
                          await GlobalCubit.get(context)
                              .login(_loginRequest)
                              .then((_) {
                            showToast('Logged in Successfully');
                            Navigator.pushReplacementNamed(
                                context, Routes.verifyRoute);
                          }).catchError((error) {
                            showToast('Logged in Failed');
                          });
                        } else {
                          showToast('Please Enter Valid Date');
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
