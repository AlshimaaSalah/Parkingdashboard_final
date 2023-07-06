import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/dashboard_home.dart';
import 'my_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routName = 'log';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String pass;
  bool _isObscure = true;
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Smart Parking Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/dash2.jpeg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Image.asset(
                    'assets/images/dash1.PNG',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  flex: 5,
                  child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .35,
                              child: TextFormField(
                                onChanged: (val) {
                                  email = val;
                                },
                                controller: emailcontroller,
                                validator: (value) {
                                  var user = FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email, password: pass);
                                  if (value!.trim().isEmpty ||
                                      value!.contains('@gmail.com') == false ||
                                      user == null) {
                                    return 'Invalid email!';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'test@gmail.com',
                                  prefixIcon: Icon(Icons.email_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.black26, width: 4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .35,
                              child: TextFormField(
                                onChanged: (val) {
                                  pass = val;
                                },
                                controller: passcontroller,
                                validator: (value) {
                                  var user = FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email, password: pass);
                                  //print(user[email]);
                                  if (value!.trim().isEmpty ||
                                      value!.length <= 6 ||
                                      user == null) {
                                    return 'Invalid password!';
                                  }
                                },
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.password_sharp),
                                  suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.black26, width: 4),
                                  ),
                                ),
                              ),
                            ),
                            // TextButton(
                            //     style: ButtonStyle(
                            //         alignment: Alignment.bottomRight),
                            //     onPressed: () {},
                            //     child: Text(
                            //       'Forgot your password?',
                            //       style: TextStyle(
                            //           color: MyTheme.lightPrimaryColor),
                            //     )),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: MyTheme.lightPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () async {
                                try {
                                  if (formkey.currentState!.validate()) {
                                    var user = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: pass);
                                    if (user != null) {
                                      print('email:$email password:$pass');
                                      Navigator.of(context)
                                          .pushNamed(MyHomePage.routName);
                                    }
                                    // else{
                                    //
                                    // }
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Text('Sign in'),
                            ),
                            //SizedBox(height: 5,),
                            // TextButton(
                            //     style: ButtonStyle(
                            //         alignment: Alignment.bottomRight),
                            //     onPressed: () {
                            //       Navigator.of(context).pushNamed(SignUp.routName);
                            //     },
                            //     child: Text(
                            //       "Don't have an account?",
                            //       style: TextStyle(
                            //           color: MyTheme.lightPrimaryColor),
                            //     )),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
// authontication(){
// var user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
// }
}
