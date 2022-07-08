import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/drawer/logo.dart';
import 'package:task_manager_ui/ui/widgets/drawer/menu_accent_design.dart';
import 'package:task_manager_ui/ui/widgets/drawer/menu_button.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ThemeColor.main,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, color: ThemeColor.secondary2),
                  splashRadius: 20,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: ThemeColor.secondary2,
                          decoration: TextDecoration.underline,
                          decorationColor: ThemeColor.secondary2),
                    )),
              ],
            ),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(20),
            child: const Center(child: Logo()),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: MenuAccentDesign(),
              ),
              SizedBox(
                height: 300,
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ThemeColor.main,
                          Colors.transparent,
                          Colors.transparent,
                          ThemeColor.main,
                        ],
                        stops: const [
                          0.0,
                          0.2,
                          0.9,
                          1.0
                        ]).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        MenuButton(
                          text: 'Profile',
                          onPressed: () {},
                        ),
                        MenuButton(
                          text: 'Schedule',
                          onPressed: () {},
                        ),
                        MenuButton(
                          text: 'Overview',
                          onPressed: () {},
                        ),
                        MenuButton(
                          text: 'Chat',
                          onPressed: () {},
                        ),
                        MenuButton(
                          text: 'Settings',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 210,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(child: MenuAccentDesign()),
            ],
          ),
        ],
      ),
    );
  }
}
