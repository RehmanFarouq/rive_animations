// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, deprecated_member_use, avoid_print, unused_field, body_might_complete_normally_nullable, unnecessary_new, file_names, equal_keys_in_map

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rive/rive.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final SignUpScreenController _controller = Get.put(SignUpScreenController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch and populate the user data if the user is logged in
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     _populateUserData();
  //   }
  // }

  // Method to fetch and populate user data if the user is logged in
  // void _populateUserData() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .get()
  //         .then((snapshot) {
  //       if (snapshot.exists) {
  //         final userData = snapshot.data() as Map<String, dynamic>;
  //         setState(() {
  //           _firstNameController.text = userData['first_name'] ?? '';
  //           _lastNameController.text = userData['last_name'] ?? '';
  //           _emailController.text = user.email ?? '';
  //           _phoneNumberController.text = userData['phone_number'] ?? '';
  //         });
  //       }
  //     });
  //   }
  // }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   bottom: 180,
          //   left: 100,
          //   height: MediaQuery.of(context).size.width * 1.2,
          //   child: Image.asset('assets/Spline.png'),
          // ),
          RiveAnimation.asset("assets/RiveAssets/button.riv"),
          Positioned.fill(
            child: BackdropFilter(
              child: SizedBox(),
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: Colors.white),
                                controller: _firstNameController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.4),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust the vertical padding
                                  hintText: "First Name",
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                  ),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: Colors.white),
                                controller: _lastNameController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                     contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                  ),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                               contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            prefixIcon:
                                Icon(Icons.email, color: Colors.white),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Email';
                            } else if (!value.contains('@')) {
                              return 'Please include the @ symbol in the email';
                            } else if (!value.contains('.')) {
                              return 'Please include the . symbol in the email';
                            } else if (value.startsWith('@') ||
                                value.startsWith('.')) {
                              return 'Please enter a valid email';
                            } else if (value.endsWith('@') ||
                                value.endsWith('.')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.white),
                            controller: _passwordController,
                            // obscureText: _controller.obscureText.value,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // color: Colors.white,
                                  // _controller.obscureText.value
                                       Icons.visibility
                                      // : Icons.visibility_off,
                                ),
                                onPressed: (){},
                              ),
                                 contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntlPhoneField(
                         dropdownIcon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                          dropdownTextStyle: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                  cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          controller: _phoneNumberController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          initialCountryCode: 'PK', // Set initial country code to 'PK' for Pakistan
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // if (_formKey.currentState!.validate()) {
                              //   String firstName = _firstNameController.text;
                              //   String lastName = _lastNameController.text;
                              //   String email = _emailController.text;
                              //   String password = _passwordController.text;
                              //   String phoneNumber =
                              //       _phoneNumberController.text;

                              //   _controller.signUp(
                              //     firstName,
                              //     lastName,
                              //     email,
                              //     password,
                              //     phoneNumber,
                              //   );
                              //   // _firstNameController.clear();
                              //   // _lastNameController.clear();
                              //   // _emailController.clear();
                              //   // _passwordController.clear();
                              //   // _phoneNumberController.clear();
                              // }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                // color: kGoldColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  // color: kGoldColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: BoxDecoration(
                                    // color: kGoldColor,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 11.8,
                              color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Get.to(() => LogIn());
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffbe9516),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



