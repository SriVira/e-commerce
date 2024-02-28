import 'package:ecommerce/bloc/google_signin_bloc.dart';
import 'package:ecommerce/screens/product_home_page.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/buttons/primary_elevated_button.dart';
import 'package:ecommerce/widgets/text/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialLoginPage extends StatefulWidget {
  const SocialLoginPage({super.key});

  @override
  State<SocialLoginPage> createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends State<SocialLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<GoogleLoginBloc, GoogleLoginState>(
            listener: (context, state) {
              if (state is GoogleLoginSuccess) {
                Get.to(const ProductHomePage());
              }
            },
            builder: (BuildContext context, GoogleLoginState state) {
              return state is GoogleLoginLoading
                  ? PrimaryElevatedButton(
                      width: Get.width / 1.5,
                      onPressed: () {},
                      child: const CircularProgressIndicator(
                        color: appWhiteColor,
                      ))
                  : PrimaryElevatedButton(
                      width: Get.width / 1.5,
                      onPressed: () {
                        BlocProvider.of<GoogleLoginBloc>(context)
                            .add(GoogleLoginButtonPressed());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            LineIcons.google_logo,
                            color: appWhiteColor,
                          ),
                          8.width,
                          const PrimaryText(
                            text: "Google Sign In",
                            color: appWhiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
            },
          ).center()
        ],
      ),
    );
  }
}
