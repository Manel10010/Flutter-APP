import 'package:flutter/material.dart';
import 'package:interface_app/steps/fbf/five_fbf.dart';
import 'package:interface_app/steps/fbf/four_fbf.dart';
import 'package:interface_app/steps/fbf/one_fbf.dart';
import 'package:interface_app/steps/fbf/two_fbf.dart';
import 'package:interface_app/steps/fbf/three_fbf.dart';
import '../steps/fbf/api_result.dart';
import '../steps/fbf/six_fbf.dart';

class ControladorPagesFBF extends StatefulWidget {
  const ControladorPagesFBF({super.key});

  @override
  State<ControladorPagesFBF> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ControladorPagesFBF> {
  var navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados"),
      ),
      body: WillPopScope(
        onWillPop: () async{
          var canPopNavDados = navKey.currentState?.canPop() ?? false;
          if (canPopNavDados) {
            navKey.currentState?.pop();
            return false;
          } else {
            return true;
          }
        },
        child: Navigator(
          initialRoute: '/one_fbf',
          key: navKey,
          onGenerateRoute: (settings) {
            var route = settings.name;
            Widget page;
            switch (route) {
              case '/one_fbf':
                page = const OneFBF();
                break;
              case '/two_fbf':
                page = const TwoFBF();
                break;
              case '/three_fbf':
                page = const ThreeFBF();
                break;
              case '/four_fbf':
                page = const FourFBF();
                break;
              case '/five_fbf':
                page = const FiveFBF();
                break;
              case '/six_fbf':
                page = const SixFBF();
                break;
              case '/final_fbf':
                page = const MyWidget();
                break;
              default:
                return null;
            }
            return MaterialPageRoute(builder: (context) => page, settings: settings);
          },
        ),
      ),
    );
  }
}