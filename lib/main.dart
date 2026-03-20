import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// giả lập database
UserData? registeredUser;

class UserData {
  String name;
  String email;
  String password;
  String address;
  String avatar;
  String description;

  UserData({
    required this.name,
    required this.email,
    required this.password,
    this.address = "",
    this.avatar = "",
    this.description = "",
  });
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

//////////////////////////////////////////////////////
/// LOGIN
//////////////////////////////////////////////////////
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),

              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  if (registeredUser != null &&
                      emailController.text == registeredUser!.email &&
                      passController.text == registeredUser!.password) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(user: registeredUser!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sai tài khoản hoặc mật khẩu")),
                    );
                  }
                },
                child: Text("Sign in"),
              ),

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

//////////////////////////////////////////////////////
/// REGISTER
//////////////////////////////////////////////////////
class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Register",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),

              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  registeredUser = UserData(
                    name: nameController.text.isEmpty
                        ? "Alice"
                        : nameController.text,
                    email: emailController.text,
                    password: passController.text,
                  );

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Đăng ký thành công!")),
                  );
                },
                child: Text("Create"),
              ),

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

//////////////////////////////////////////////////////
/// PROFILE
//////////////////////////////////////////////////////
class ProfilePage extends StatefulWidget {
  final UserData user;

  ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController avatarController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    addressController = TextEditingController(text: widget.user.address);
    avatarController = TextEditingController(text: widget.user.avatar);
    descriptionController =
        TextEditingController(text: widget.user.description);

    // 🔥 cập nhật avatar realtime
    avatarController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// HEADER + AVATAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${nameController.text}!",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  /// AVATAR
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: avatarController.text.isNotEmpty
                          ? NetworkImage(avatarController.text)
                          : null,
                      child: avatarController.text.isEmpty
                          ? Icon(Icons.person)
                          : null,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),

              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: "Address"),
              ),

              TextField(
                controller: avatarController,
                decoration: InputDecoration(labelText: "Avatar URL"),
              ),

              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(labelText: "Description"),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.user.name = nameController.text;
                        widget.user.email = emailController.text;
                        widget.user.address = addressController.text;
                        widget.user.avatar = avatarController.text;
                        widget.user.description =
                            descriptionController.text;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Saved!")),
                      );
                    },
                    child: Text("Save"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Logout"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}