import 'package:bpd_hris/ui/login/components/login_ui_input_form.dart';
import 'package:bpd_hris/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

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
                Text(
                  'Masuk Akun HRIMS',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
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
                    key: fbKey,
                    child: LoginPageForm(
                      fbKey: fbKey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.05, // adjust the fraction to position the text higher or lower
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Versi Aplikasi 1.0.0',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Theme.of(context).primaryColor,
                      ),
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
