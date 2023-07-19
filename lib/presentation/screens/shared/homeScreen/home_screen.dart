import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/homeViews/choice_chips.dart';
import 'package:magdsoft_flutter_structure/presentation/view/homeViews/home_grid.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FToast().init(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.logout, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.notification_add_rounded, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: AppColor.primary,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 0) {
            //log out and set saved data to false
            CacheHelper.saveDataSharedPreference(key: 'logged', value: false)
                .then((value) {
              showToast('Logged out Successfully');
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            });
          }
          if (index == 4) {
            Navigator.pushReplacementNamed(context, Routes.helpRoute);
          }
        },
        letIndexChange: (index) => true,
      ),
      body: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            //Types List For Choice Chips
            cubit.setProducts();

            List<String> types =
                cubit.laptops.map((e) => e.company ?? '').toSet().toList();
            types.insert(0, 'All');
            return SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 2.0.w),
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        height: 6.0.h,
                        width: 75.0.w,
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.search),
                                contentPadding: const EdgeInsets.all(10.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Search'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 6.0.h,
                        width: 12.0.w,
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_alt,
                                color: Colors.black38,
                              )),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 90.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AssetsManager.acerLaptop))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Release',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColor.white.withOpacity(0.8)),
                            ),
                            Text(
                              'Acer Predator Helios 300',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColor.white.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 10.h,
                        width: 90.w,
                        child: HomeChoiceChips(types)),
                    const SizedBox(
                      height: 15,
                    ),
                    HomeProductsGrid(cubit.laptops)
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
