import 'package:flutter/material.dart';
import 'package:the_ev_life/custom_widgets/custom_form_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<LoginForm> {
  
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController pwdCtrl = TextEditingController();  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              // width: 5000,
              color: Colors.blue,
            ),
            Container(
              // width: 500,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(8.0, 200, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ) ,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            CustomForm().textField(emailCtrl, 'Email'),
                            Container(
                              height: 20,
                            ),
                            CustomForm().passwordField(pwdCtrl, '\u2022'),
                            Container(
                              height: 20.0,
                            ),
                            Container(
                              // color: Colors.blue,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    print('Validated inputs');
                                  }
                                }, 
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 12,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterForm() 
                                  )
                                );
                              },
                              child: const Text(
                                'Don\'t have an account? Sign up here',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}


class RegisterForm extends StatefulWidget {
  RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController pwdCtrl = TextEditingController();  
  final TextEditingController confirmPwdCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              // width: 5000,
              color: Colors.blue,
            ),
            Container(
              // width: 500,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(8.0, 200, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ) ,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            CustomForm().textField(emailCtrl, 'Email'),
                            Container(
                              height: 20,
                            ),
                            CustomForm().passwordField(pwdCtrl, '\u2022'),
                            Container(
                              height: 20.0,
                            ),
                            CustomForm().confirmPasswordField(confirmPwdCtrl, pwdCtrl, '\u2022'),
                            Container(
                              height: 20.0,
                            ),
                            Container(
                              // color: Colors.blue,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    // print('Validated inputs');
                                    Navigator.pop(context);
                                  }
                                }, 
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 12,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Already have an account? Sign in here',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  } 
}