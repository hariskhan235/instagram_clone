import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/utils.dart';
import 'package:instagram_clone_app/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _usernameController = TextEditingController();
  Uint8List? img;
  bool isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      img = image;
    });
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: img!);

        setState(() {
          isLoading = false;
        });

        if(res != 'sucess'){
          // ignore: use_build_context_synchronously
          showSnackBar(context, res);
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Flexible(
                //   flex: 2,
                //   child: Container(),
                // ),
                // svg Image
                // SvgPicture.asset(
                //   'assets/instagram_logo.svg',
                //   height: 62,
                //   color: primaryColor,
                // ),
                Stack(
                  children: [
                    img != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(img!),
                          )
                        : const CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                          ),
                    Positioned(
                      bottom: -9,
                      left: 70,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // userName textField
                TextFieldInput(
                    textEditingController: _usernameController,
                    textInputType: TextInputType.text,
                    hintText: 'Enter Your UserName'),
                const SizedBox(
                  height: 20,
                ),

                //email TextField
                TextFieldInput(
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter Your Email'),

                const SizedBox(
                  height: 20,
                ),

                //password TextField
                TextFieldInput(
                    textEditingController: _passwordController,
                    textInputType: TextInputType.text,
                    isPass: true,
                    hintText: 'Enter Your Password'),
                const SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                    textEditingController: _bioController,
                    textInputType: TextInputType.text,
                    hintText: 'Enter Your Bio'),

                const SizedBox(
                  height: 30,
                ),
                //TextButton

                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: Colors.blue),
                    child: isLoading ? const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                    ),) : const Text('Sign Up'),
                  ),
                ),
                // transition to signUp

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Already Have an account?'),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
