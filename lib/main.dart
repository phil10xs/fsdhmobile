import 'package:flutter/material.dart';
import 'package:fsdh_mobile/route.dart';
import 'package:fsdh_mobile/view-model/report.dart';
import 'package:fsdh_mobile/views/screens/report.dart';
import 'package:provider/provider.dart';
import 'views/screens/login.dart';
import 'views/utils/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  //global routes
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static get pushReplacementNamed => navKey.currentState!.pushReplacementNamed;
  static get pushNamed => navKey.currentState!.pushNamed;
  static get pushNamedAndRemoveUntil =>
      navKey.currentState!.pushNamedAndRemoveUntil;
  static get push => navKey.currentState!.push;
  static get pop => navKey.currentState!.pop;
  static get canPop => navKey.currentState!.canPop;
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReportNotifier()),
      ],
      child: MaterialApp(
        navigatorKey: App.navKey,
        title: 'FSDH Demo',
        theme: theme(context),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
