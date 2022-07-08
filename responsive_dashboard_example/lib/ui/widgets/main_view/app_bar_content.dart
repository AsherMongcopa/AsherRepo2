

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/ui/widgets/components/responsive.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        const Spacer(),
        if (Responsive.isDesktop(context)) ...[
          SizedBox(
            width: 280,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                  hintText: 'Search here'),
            ),
          ),
          const Spacer(),
        ],
        Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/user.jpeg'))),
        ),
        if (!Responsive.isMobileCompact(context)) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'super admin',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}