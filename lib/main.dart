import 'package:flutter/material.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/config/theme/theme.dart';
import 'package:jioyathri/features/authentication/presentation/pages/customer_profile_setup.dart';
import 'package:jioyathri/features/authentication/presentation/pages/data_adding_screen.dart';
import 'package:jioyathri/features/authentication/presentation/pages/login_screen.dart';
import 'package:jioyathri/features/authentication/presentation/pages/services.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/provider/services_provider.dart';
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
      home: CustomerProfileSetup(),
      onGenerateRoute: AppRouter.gererateRoutes,
    );
  }
}
