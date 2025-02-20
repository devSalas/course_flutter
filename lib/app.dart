import 'package:flutter/material.dart';
import 'package:weincoders_app/config/app_routes.dart';
import 'package:weincoders_app/design/themes.dart';
import 'package:weincoders_app/models/User.dart';
import 'package:weincoders_app/pages/AllTransactions.dart';
import 'package:weincoders_app/pages/home_page.dart';
import 'package:weincoders_app/pages/login_page.dart';
import 'package:weincoders_app/pages/new_page.dart';
import 'package:weincoders_app/pages/other_page.dart';

class WeinFluApp extends StatelessWidget{
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: WeinFluThemes.defaultTheme,
      onGenerateRoute: (settings){
        switch(settings.name){
          case AppRouters.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());
          case AppRouters.home:
            return MaterialPageRoute(builder: (context) =>  HomePage(storeName: settings.arguments as String));
          case AppRouters.transaction:
          return MaterialPageRoute(builder: (context) => TransactionPage());
          default:
            return MaterialPageRoute(builder: (context) => const LogInPage());
        }
      },
      /* routes: {
        "new-page":(context) => const NewPage(),
        "other-page":(context) => const OtherPage(),
        "/":(context) => const HomePage(),
      }, */
    );
  }
}