import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(labelText: "Email/Username"),
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              SizedBox(height: 10),

              Text("Forgot password?", style: TextStyle(fontSize: 12)),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {},
                child: Text("Sign in"),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Create account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Register",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextField(decoration: InputDecoration(labelText: "Name")),
              TextField(decoration: InputDecoration(labelText: "Email")),

              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirm Password"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                child: Text("Create"),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}