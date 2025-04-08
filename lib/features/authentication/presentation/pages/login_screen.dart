import 'package:flutter/material.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/core/constants/constants.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/core/util/snackbar_helper.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/widgets/bubble.dart';
import 'package:jioyathri/features/authentication/presentation/widgets/register_feild.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                left: size.width - 180,
                bottom: size.height - 300,
                child: Bubble(size: 350),
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
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Login to your account',
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 60),
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

                          InkWell(
                            onTap: () async {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                showTopSnackbar(
                                  context,
                                  'Enter all the feilds',
                                  'error',
                                );
                                return;
                              }

                              await authProvider.loginUser(
                                LoginParams(
                                  username: emailController.text.trim(),
                                  password: passwordController.text.trim(),
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
                                AppRouter.servicesRoute,
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
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                "don't have an account?",
                                style: TextStyle(fontSize: 18),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRouter.registerRoute,
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6c63ff),
                                  ),
                                ),
                              ),
                            ],
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
