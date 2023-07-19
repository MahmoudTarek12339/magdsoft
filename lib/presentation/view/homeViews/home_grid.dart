import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/view/homeViews/product_card.dart';
import 'package:sizer/sizer.dart';

class HomeProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  const HomeProductsGrid(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    //here i used two lists to make the custom ui shape of the grid of products
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.separated(
                      itemCount: (products.length ~/ 2) + 1,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(
                            width: 35.0.w,
                            height: 7.0.h,
                            child: Text(
                              'Recommended \nfor You',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.black87),
                            ),
                          );
                        }
                        return ProductCard(products[index - 1]);
                      })),
              Expanded(
                  child: ListView.separated(
                      itemCount: products.length - (products.length ~/ 2),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) =>
                          ProductCard(products[products.length - index - 1])))
            ],
          );
        });
  }
}
