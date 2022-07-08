

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/card_title.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/customer_tile.dart';

class CustomerListCard extends StatelessWidget {
  const CustomerListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CardTitle(title: 'New customer', onPressedSeeAllButton: () {}),
          const Divider(),
          ...List.generate(
            6,
            (index) => CustomerTile.sampleCustomer,
          ),
        ],
      ),
    );
  }
}