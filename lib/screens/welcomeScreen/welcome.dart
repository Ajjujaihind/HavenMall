import 'package:flutter/material.dart';
import 'package:havenmall/constants/navigator.dart';
import 'package:havenmall/screens/onboarding/login_Page.dart';
import 'package:havenmall/widgets/topTittle.dart';

import '../../constants/assets_images.dart';
import '../../widgets/primartButton.dart';
import '../onboarding/signup_Page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopTittle(title: "Welcome", subtitle: "Buy any itmes"),
                Center(child: Image.asset(AssetsImages.welcomePageImg)),
                const SizedBox(
                  height: 12,
                ),
                PrimaryButton(
                  buttonText: "Login",
                  onPressed: () {
                    NavigationHelper.push(
                        widget: LoginPage(), context: context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  buttonText: "Sign-up",
                  onPressed: () {
                    NavigationHelper.push(
                        widget: SignupPage(), context: context);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        size: 35,
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AssetsImages.gmailLogoImg,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
