import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class HomeChoiceChips extends StatelessWidget {
  final List<String> types;

  const HomeChoiceChips(this.types, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: types.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ChoiceChip(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                selectedColor: AppColor.primary,
                avatar: const CircleAvatar(
                  backgroundColor: AppColor.white,
                  foregroundImage: AssetImage(AssetsManager.acerLaptop),
                ),
                label: Text(types[index]),
                selected: index == cubit.selectedChip,
                elevation: 5,
                onSelected: (_) {
                  cubit.updateChip(index);
                  cubit.updateProducts(types[index]);
                },
              );
            },
          );
        });
  }
}
