import 'package:flutter/material.dart';
import 'package:mool_attendance/common/widgets/custom_button.dart';
import 'package:mool_attendance/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

WebView takeToWebsite() {
  return WebView(
    initialUrl: 'https://moolfinance.com/',
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(28, 48, 28, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello 👋🏻,',
              style: TextStyle(color: Color(0xff5F5E63), fontSize: 24),
            ),
            Text(
              user.displayName!,
              style: TextStyle(
                  color: Color(0xff151C2F),
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 136,
            ),
            Image(
              image: AssetImage("assets/Working_Illustration.png"),
            ),
            SizedBox(
              height: 36,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'This app is under construction ⚒️',
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'While we finish the whole app... why',
                    style: TextStyle(
                        color: Color(0xff5F5E63),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'don’t you get to know about us a bit?',
                    style: TextStyle(
                        color: Color(0xff5F5E63),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 96,
            ),
            CustomButton(
              text: 'Take me to the website',
              onTap: (() => {
                    takeToWebsite(),
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
