import 'package:flutter/material.dart';
import 'package:project1/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassowrd = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                defauldformField(
                  controller: emailController,
                  label: "Email",
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email must not be null';
                    }
                  },
                  prefix: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defauldformField(
                    controller: passwordController,
                    label: "password",
                    type: TextInputType.visiblePassword,
                    isPassword: isPassowrd,
                    onSubmit: (String value){
                      print(value);
                    },
                    suffixPressed: ()
                    {
                        setState(() {
                          isPassowrd = !isPassowrd;
                        });
                    },
                    validate: (String value)
                    {
                      if (value.isEmpty) {
                        return 'password must not be null';
                      }
                    },
                    prefix: Icons.lock,
                    suffix: isPassowrd ?  Icons.visibility : Icons.visibility_off,
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultButton(
                  text: 'login',
                  isuppercase: true,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }

                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                  text: 'ReGist',
                  background: Colors.red,
                  function: () {
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  isuppercase: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'n have an account ? '),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
