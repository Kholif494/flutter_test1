import 'package:flutter/material.dart';
import 'package:login_access/home.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final key = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150, bottom: 50),
                    child: Icon(Icons.account_box, size: 100),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    child: TextFormField(
                      validator: (value) {
                        if (value != "user") {
                          return "Username salah";
                        } else if (value!.isEmpty) {
                          return "Masukkan Username";
                        }
                        return null;
                      },
                      controller: username,
                      autocorrect: true,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        filled: true,
                        hintText: "Username",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                    width: double.infinity,
                    child: TextFormField(
                      validator: (value) {
                        if (value != "12345") {
                          return "Password salah";
                        } else if (value!.isEmpty) {
                          return "Masukkan Password";
                        }
                        return null;
                      },
                      controller: password,
                      autocorrect: true,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        filled: true,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  Container(
                    width: 275,
                    child: ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext c) => HomePage()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
