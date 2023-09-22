import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcareapp/modules/loginScreen/login_cubit/login_cubit.dart';

import 'login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const Text(
                  'Lets get started !',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Create an account and start booking now',
                  style:
                  TextStyle(color: Color(0xff7C808A), fontSize: 20),
                ),
                const Text(
                  'and personal overview',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'name',
                    label: Text('name'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'name must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    label: Text('Email'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    bool validEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if(!validEmail){
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'phone',
                    label: Text('phone'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'phone must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    label: Text('password'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                TextFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'confirm password',
                    label: Text('confirm password'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'confirm password must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      'male',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(width: 20,),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      'female',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Row(
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                        onPressed: (){},
                        child: Text('login here'),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff5A55CA),
                      borderRadius: BorderRadius.circular(5)),
                  child: MaterialButton(
                    onPressed: () {
                      LoginCubit.get(context).userLogin(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          gender: '0',
                          password: passwordController.text,
                          passwordConfirmation: confirmPasswordController.text
                      );
                    },
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
