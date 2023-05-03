import 'dart:async';

import 'package:bpd_hris/ui/home/home_ui.dart';
import 'package:bpd_hris/ui/login/components/login_ui_reuseable_form.dart';
import 'package:bpd_hris/widget/bottom_sheet_content.dart';
import 'package:bpd_hris/widget/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({
    super.key,
    required this.fbKey,
  });

  final GlobalKey<FormBuilderState> fbKey;

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  bool _isObscure = true;
  bool _isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String correctUsername = 'admin';
  final String correctPassword = 'admin';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginReuseableTextFormField(
          name: 'username',
          controller: _usernameController,
          hintText: 'Username / NIK',
          prefixIcon: Icons.person_outlined,
          validator: FormBuilderValidators.required(
            errorText: 'Username / NIK tidak boleh kosong',
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        LoginReuseableTextFormField(
          name: 'password',
          controller: _passwordController,
          hintText: 'Kata Sandi',
          prefixIcon: Icons.password,
          validator: FormBuilderValidators.required(
            errorText: 'Kata Sandi tidak boleh kosong',
          ),
          obscureText: _isObscure,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: Icon(
              !_isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey[400],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Lupa kata sandi',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
            width: double.infinity,
            child: _isLoading
                ? const HorizontalLoadingIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      if (_usernameController.text.isEmpty &&
                          _passwordController.text.isEmpty) {
                        showMaterialModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          builder: (context) {
                            return const BottomSheetContent(
                              lottiePath:
                                  'assets/images/login_empty_astronaut.zip',
                              title: 'Ooops!',
                              subtitle:
                                  'Username dan kata sandi tidak boleh kosong',
                            );
                          },
                        );
                      } else if (_usernameController.text == 'admin' &&
                          _passwordController.text == 'admin') {
                        // setState(() {
                        //   _isLoading = true;
                        //   Timer(
                        //     const Duration(seconds: 2),
                        //     () {
                        //       setState(() {
                        //         _isLoading = false;
                        //       });
                        //     },
                        //   );
                        // });
                        setState(() {
                          _isLoading = true;

                          Timer(
                            const Duration(seconds: 2),
                            () {
                              setState(() {
                                _isLoading = false;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              });
                            },
                          );
                        });
                      } else {
                        showMaterialModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          builder: (context) {
                            return const BottomSheetContent(
                              lottiePath: 'assets/images/login_error_cat.zip',
                              title: 'Tidak Terdaftar',
                              subtitle:
                                  'Username atau kata sandi salah, silahkan coba lagi',
                            );
                          },
                        );
                      }

                      // if (widget.fbKey.currentState?.validate(
                      //       autoScrollWhenFocusOnInvalid: false,
                      //       focusOnInvalid: false,
                      //     ) ??
                      //     false) {
                      //   debugPrint(widget.fbKey.currentState?.value.toString());
                      // } else {
                      //   debugPrint(widget.fbKey.currentState?.value.toString());
                      //   debugPrint('validation failed');
                      // }

                      // setState(() {
                      //   _isLoading = true;
                      //   Timer(
                      //     const Duration(seconds: 2),
                      //     () {
                      //       setState(() {
                      //         _isLoading = false;
                      //       });
                      //     },
                      //   );
                      // });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Belum memiliki akun?',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Registrasi disini',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.headset_mic_rounded,
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Ada Kendala? ',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Hubungi Kami',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
