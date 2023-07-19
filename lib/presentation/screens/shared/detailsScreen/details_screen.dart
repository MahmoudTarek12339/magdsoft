import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/line_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/product_info_tabs.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [AppColor.primary, AppColor.white])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //back Icon
              SizedBox(
                width: 10.0.w,
                height: 5.0.h,
                child: Material(
                  elevation: 10,
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Laptop Name
              Text(
                'Predator Helios 300',
                style: TextStyle(fontSize: 24.sp, color: AppColor.primary),
              ),
              const SizedBox(
                height: 5,
              ),

              //Laptop Type
              Text(
                'Type: Gaming Laptop',
                style: TextStyle(fontSize: 14.sp, color: AppColor.white),
              ),
              const SizedBox(
                height: 15,
              ),

              //laptop image
              SizedBox(
                width: 88.0.w,
                height: 25.0.h,
                child: Material(
                  color: AppColor.white,
                  elevation: 10,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(
                      AssetsManager.acerLaptop,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 12.0.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 30.0.w,
                        child: Material(
                          color: AppColor.white,
                          elevation: 10,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(15),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              AssetsManager.acerLaptop,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: 5),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 9.0.h,
                child: Material(
                  color: AppColor.white,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 17.0.w,
                          height: 8.0.h,
                          child: Material(
                            color: Colors.white70,
                            elevation: 10,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              AssetsManager.acerLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Acer Official Store',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 14.sp),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'View Store',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 10.0.w,
                          height: 5.0.h,
                          child: Material(
                            color: Colors.white70,
                            elevation: 10,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(15),
                            child: const Center(
                              child: Icon(Icons.arrow_forward_ios,color: AppColor.primary,size: 14,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black54
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '30,000 EGP',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                    ],
                  )),
                  Expanded(child: CustomButton(
                    onPressed: (){},
                    'Add To Cart',
                    horizontal: 0,
                    borderRadius: 15,
                  ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Center(child: LineContainer(70.w, 1,color: Colors.black54,)),
              const SizedBox(
                height: 25,
              ),
              const ProductInfoTabs()
            ],
          ),
        ),
      ),
    ));
  }
}
