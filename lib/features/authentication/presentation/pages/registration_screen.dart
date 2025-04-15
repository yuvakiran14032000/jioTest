import 'package:flutter/material.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/core/constants/constants.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/core/util/snackbar_helper.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/widgets/bubble.dart';
import 'package:jioyathri/features/authentication/presentation/widgets/register_feild.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterepasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // Image.asset(
              //   'assets/images/register_back.png',
              //   width: double.infinity,
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              SizedBox(width: size.width, height: size.height),

              Positioned(
                left: size.width - 160,
                bottom: size.height - 200,
                child: Bubble(size: 300),
              ),

              Positioned(
                right: size.width - 160,
                top: size.height - 200,
                child: Bubble(size: 300),
              ),

              Positioned(
                right: size.width - 100,
                top: 400,
                child: Bubble(size: 150),
              ),

              // BackdropFilter(
              //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              //   child: Container(color: Colors.white.withAlpha(100)),
              // ),
              Container(
                width: size.width * 0.9,
                // height: size.height * 0.8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(100),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xff6c63ff), Color(0xff49d67a)],
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'jio Yathri',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create new account.',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Text(
                                'Already a member?',
                                style: TextStyle(fontSize: 18),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRouter.loginRoute,
                                  );
                                },
                                child: Text(
                                  'login',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6c63ff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 60),
                          RegisterField(
                            title: 'full name',
                            controller: fullnameController,
                          ),
                          SizedBox(height: 16),
                          RegisterField(
                            title: 'phone',
                            controller: phoneController,
                          ),
                          SizedBox(height: 16),
                          RegisterField(
                            title: 'email',
                            controller: emailController,
                          ),
                          SizedBox(height: 16),
                          RegisterField(
                            title: 'Password',
                            controller: passwordController,
                            action: TextInputAction.done,
                            obscure: true,
                          ),
                          SizedBox(height: 16),
                          RegisterField(
                            title: 're-enter password',
                            controller: reenterepasswordController,
                            action: TextInputAction.done,
                            obscure: true,
                          ),
                          SizedBox(height: 60),
                          InkWell(
                            onTap:
                                authProvider.isLoading
                                    ? null
                                    : () async {
                                      if (fullnameController.text.isEmpty ||
                                          phoneController.text.isEmpty ||
                                          emailController.text.isEmpty ||
                                          passwordController.text.isEmpty ||
                                          reenterepasswordController
                                              .text
                                              .isEmpty) {
                                        showTopSnackbar(
                                          context,
                                          'Enter all the feilds',
                                          'error',
                                        );
                                        return;
                                      }

                                      if (passwordController.text.trim() !=
                                          reenterepasswordController.text
                                              .trim()) {
                                        showTopSnackbar(
                                          context,
                                          'check the password',
                                          'error',
                                        );
                                        return;
                                      }

                                      await authProvider.registerUser(
                                        RegisterParams(
                                          phone: phoneController.text.trim(),
                                          fullname:
                                              fullnameController.text.trim(),
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      );

                                      if (authProvider.error != null) {
                                        showTopSnackbar(
                                          context,
                                          authProvider.error!.errorMessage,
                                          'error',
                                        );
                                        return;
                                      }

                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRouter.profilesetupRoute,
                                        (_) => false,
                                      );
                                    },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff6c63ff),
                                    Color(0xff49d67a),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(
                                  defaultBorderRadius,
                                ),
                              ),
                              child:
                                  authProvider.isLoading
                                      ? SizedBox(
                                        width: 26,
                                        height: 26,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                        ),
                                      )
                                      : Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Bubble extends StatelessWidget {
//   const Bubble({super.key, required this.size});

//   final double size;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: LinearGradient(
//           colors: [Color(0xff6c63ff), Color(0xff49d67a)],
//         ),
//       ),
//     );
//   }
// }
