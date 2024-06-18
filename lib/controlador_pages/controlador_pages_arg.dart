import 'package:flutter/material.dart';

import '../steps/args/five_arg.dart';
import '../steps/args/four_arg.dart';
import '../steps/args/one_arg.dart';
import '../steps/args/three_arg.dart';
import '../steps/args/two_arg.dart';

class ControladorPagesARG extends StatefulWidget {
  const ControladorPagesARG({super.key});

  @override
  State<ControladorPagesARG> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ControladorPagesARG> {
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
          initialRoute: '/one_arg',
          key: navKey,
          onGenerateRoute: (settings) {
            var route = settings.name;
            Widget page;
            switch (route) {
              case '/one_arg':
                page = const OneARG();
                break;
              case '/two_arg':
                page = const TwoARG();
                break;
              case '/three_arg':
                page = const ThreeARG();
                break;
              case '/four_arg':
                page = const FourARG();
                break;
              case '/five_arg':
                page = const FiveARG();
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