import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login Screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              //name...
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'enter name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //Email......
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'enter email';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'enter valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //Mobile....
              TextFormField(
                controller: mobileController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'enter mobile';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //Password
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'enter password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //confirm password
              TextFormField(
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'confirm password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 490,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        nameController.text = '';
                        emailController.text = '';
                        mobileController.text = '';
                        passwordController.text = '';
                        confirmPasswordController.text = '';
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('name', nameController.text);
                      prefs.setString('email', emailController.text);
                      prefs.setString('mobile', mobileController.text);
                      prefs.setString('password', passwordController.text);
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
