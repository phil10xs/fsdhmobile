// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fsdh_mobile/views/screens/report.dart';
import 'package:fsdh_mobile/views/utils/validators.dart';

import '../../main.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final _emailNode = FocusNode();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _passwordNode = FocusNode();
  bool obscurePassword = true;

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 150),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildForm(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildForm() {
    return [
      Text(
        'Welcome',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
      ),
      SizedBox(height: 40),
      Text(
        'FSDH - working together to acheive more..',
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 40),
      Material(
        color: Colors.transparent,
        child: Form(
          key: _formKeyLogin,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                focusNode: _emailNode,
                controller: _emailCtrl,
                decoration: InputDecoration(
                  labelText: '',
                  prefixIcon: Container(
                    width: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/mail.webp',
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                        ),
                      ],
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) => validateRequired(value!, 'Email'),
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordNode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                focusNode: _passwordNode,
                controller: _passwordCtrl,
                decoration: InputDecoration(
                  labelText: '',
                  prefixIcon: Container(
                    width: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/icons/lock.webp',
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!),
                      ],
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) => validateRequired(value!, 'Password'),
                onEditingComplete: () {
                  _passwordNode.unfocus();
                  FocusScope.of(context).unfocus();
                },
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 40),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            key: GlobalKey<State>(debugLabel: 'login-button'),
            color: Colors.blue,
            onPressed: () {
              if (_formKeyLogin.currentState!.validate()) {
                App.pushNamed(ReportView.routeName);
              }
            },
            child: const Text(
              'LOGIN',
            ),
          ),
        ],
      ),
    ];
  }
}
