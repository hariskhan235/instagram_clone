import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text).then((value){
       //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('SuccessFully Logged In'),),);
       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
       
       return value.length.toString();
    });
    setState(() {
      isLoading = false;
    });
    if(res == 'success'){
      //
    }
    else{
      // ignore: use_build_context_synchronously
      //showSnackBar(context, res);
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
                SvgPicture.asset(
                  'assets/instagram_logo.svg',
                  height: 62,
                  color: primaryColor,
                ),
              
                const SizedBox(
                  height: 64,
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
                  height: 30,
                ),
                //TextButton
              
                InkWell(
                  onTap:loginUser,
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
                    child: isLoading ? const CircularProgressIndicator(color: primaryColor,) :const Text('Login'),
                  ),
                ),
                // transition to signUp
              
                const SizedBox(
                  height: 130,
                ),
                // Flexible(
                //   flex: 2,
                //   child: Container(),
                // ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Don\'t Have an account?'),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold)),
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
