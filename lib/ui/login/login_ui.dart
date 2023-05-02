import 'package:bpd_hris/ui/login/components/login_ui_reuseable_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  // ignore: unused_field, prefer_final_fields
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          shape: const CustomAppBarShape(
            multi: 0.08,
          ),
          actions: [
            // Help
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 120,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.help_outline,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Masuk Akun HRIMS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/login_illustration.svg',
                    semanticsLabel: 'A red up arrow',
                    fit: BoxFit.contain,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: FormBuilder(
                    child: Column(
                      children: [
                        const LoginReuseableTextFormField(
                          name: 'username',
                          hintText: 'Username / NIK',
                          prefixIcon: Icons.person_outlined,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        LoginReuseableTextFormField(
                          name: 'password',
                          hintText: 'Kata Sandi',
                          prefixIcon: Icons.password,
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {},
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
                          ),
                        ),
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
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Versi Aplikasi 1.0.0',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBarShape extends ContinuousRectangleBorder {
  final double multi;
  const CustomAppBarShape({this.multi = 0.1});
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double height = rect.height;
    double width = rect.width;
    var path = Path();
    path.lineTo(0, height + width * multi);
    path.arcToPoint(
      Offset(width * multi, height),
      radius: Radius.circular(width * multi),
    );
    path.lineTo(width * (1 - multi), height);
    path.arcToPoint(
      Offset(width, height + width * multi),
      radius: Radius.circular(width * multi),
    );
    path.lineTo(width, 0);
    path.close();

    return path;
  }
}
