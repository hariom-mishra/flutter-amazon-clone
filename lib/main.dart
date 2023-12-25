import 'package:amazon_clone_try/common/widget/bottom_bar.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone_try/features/auth/screens/auth_screnn.dart';
import 'package:amazon_clone_try/features/auth/service/auth_service.dart';
import 'package:amazon_clone_try/features/home/screens/home_screen.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:amazon_clone_try/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = ThemeData();
  final AuthService authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon App try',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: GloabalVariables.secondaryColor,
            foregroundColor: Colors.black,
          ),
          colorScheme: theme.colorScheme.copyWith(
            primary: GloabalVariables.secondaryColor,
            secondary: GloabalVariables.selectedNavBarColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      GloabalVariables.secondaryColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)))),
      onGenerateRoute: (setting) => generateRoute(setting),
      home: Builder(
        builder: (context) =>
            Provider.of<UserProvider>(context).user.token.isNotEmpty
                ? Provider.of<UserProvider>(context).user.type == 'user'
                    ? const BottomBar()
                    : AdminScreen()
                : AuthScreen(),
      ),
    );
  }
}
