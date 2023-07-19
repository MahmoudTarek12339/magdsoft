import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ProductInfoTabs extends StatefulWidget {
  final String description;
  const ProductInfoTabs(this.description,{super.key});

  @override
  State<ProductInfoTabs> createState() => _ProductInfoTabsState();
}

class _ProductInfoTabsState extends State<ProductInfoTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0.h,
        child: Column(children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'OverView'),
              Tab(text: 'Specification'),
              Tab(text: 'Review')
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: AppColor.primary,
          ),
          const SizedBox(height: 8.0),
          Flexible(
            child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Container(color: AppColor.primary),
                  Container(color: AppColor.primary),
                ]),
          )
        ]));
  }
}
