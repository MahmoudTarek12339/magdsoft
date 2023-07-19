import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsRoute,
            arguments: {'product': productModel});
      },
      child: SizedBox(
        width: 35.0.w,
        height: 28.0.h,
        child: Material(
          elevation: 10,
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              //product data container
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(productModel.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.company!,
                          style: TextStyle(
                              color: AppColor.primary, fontSize: 14.sp),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          productModel.name!,
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          productModel.price!,
                          style:
                              TextStyle(color: Colors.black87, fontSize: 8.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              //+ container
              Container(
                width: 10.0.w,
                height: 5.0.h,
                decoration: const BoxDecoration(
                    color: AppColor.primary,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColor.primary, AppColor.white])),
                child: Center(
                    child: Text(
                  '+',
                  style: TextStyle(color: AppColor.white, fontSize: 10.sp),
                )),
              ),

              //favorite container
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String? image;

  const ProductImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 16.0.h,
      child: Material(
        color: AppColor.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            image!,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(AssetsManager.acerLaptop);
            },
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
