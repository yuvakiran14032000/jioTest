import 'package:flutter/material.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/config/theme/theme.dart';
import 'package:jioyathri/core/util/snackbar_helper.dart';
import 'package:jioyathri/features/authentication/presentation/pages/login_screen.dart';
import 'package:jioyathri/features/dashboard/presentation/pages/homepage_screen.dart';
import 'package:jioyathri/features/services/presentation/pages/services.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/provider/services_provider.dart';
import 'package:jioyathri/features/onboarding/presentation/pages/onboardingscreen.dart';
import 'package:jioyathri/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:jioyathri/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setuplocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => getIt<ServicesProvider>()),
        ChangeNotifierProvider(
          create: (context) => getIt<OnboardingProvider>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: AppTheme.lightTheme,
//       home: Consumer<AuthProvider>(
//         builder: (context, value, child) {
//           return value.user == null ? LoginScreen() : Services();
//         },
//       ),
//       onGenerateRoute: AppRouter.gererateRoutes,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: Consumer<OnboardingProvider>(
        builder: (context, onboarding, child) {
          if (onboarding.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (onboarding.error != null) {
            showTopSnackbar(context, onboarding.error!.errorMessage, 'error');
          }
          if (onboarding.onboardingstatus) {
            return AuthFlow();
          } else {
            return OnboardingScreen();
          }
        },
      ),
      onGenerateRoute: AppRouter.gererateRoutes,
    );
  }
}

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authprovider, child) {
        if (authprovider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (authprovider.error != null) {
          showTopSnackbar(context, authprovider.error!.errorMessage, 'error');
        }
        if (authprovider.user == null) {
          return LoginScreen();
        } else {
          return HomepageScreen();
        }
      },
    );
  }
}
