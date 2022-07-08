import 'package:flutter/material.dart';
import 'package:responsive_flutter_ui/ui/views/email/email_screen.dart';
import 'package:responsive_flutter_ui/ui/views/main/components/list_of_emails.dart';
import 'package:responsive_flutter_ui/ui/widgets/components/responsive.dart';
import 'package:responsive_flutter_ui/ui/widgets/components/side_menu.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: const SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: const ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: const EmailScreen(),
            ),
          ],
        ),
        mobile: const ListOfEmails(),
        tablet: Row(
          children: const [
            Expanded(
              flex: 6,
              child: ListOfEmails(),
            ),
            Expanded(flex: 9, child: EmailScreen()),
          ],
        ),
      ),
    );
  }
}
