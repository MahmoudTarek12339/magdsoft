import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_response.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = GlobalCubit.get(context);
              List<HelpResponseModel> helper = cubit.helper
                  .map((e) => HelpResponseModel.fromJson(e))
                  .toList();
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(2.0.h),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                          colors: [
                        AppColor.primary.withOpacity(0.85),
                        AppColor.white
                      ])),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0.h),
                        child: Text(
                          'Help',
                          style:
                              TextStyle(fontSize: 24.sp, color: AppColor.white),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => HelpCard(
                              title: helper[index].question!,
                              description: helper[index].answer!)),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0.h),
                        child: CustomButton('Continue', onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.homeRoute);
                        }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
