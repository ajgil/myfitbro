import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/config/router/router.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';
import 'package:myfitbro/features/auth/presentation/screens/verification_params_screen.dart';
import 'package:myfitbro/features/shared/widgets/custom_filled_button.dart';
import 'package:myfitbro/features/shared/widgets/custom_text_form_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();


  Future<void> _createAccount() async {
    try {
      setState(() {
        _isSubmitting = true;
      });
      await ref.read(authRemoteRepositoryProvider).signUp(
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
          username: _usernameCtrl.text);

      if (mounted) {

        ref.read(appRouterProvider).push('/verifyopt',
            extra: VerificationParamsScreen(
                email: _emailCtrl.text,
                password: _passwordCtrl.text,
                username: _usernameCtrl.text));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _usernameCtrl,
                label: 'Usuario',
                //readOnly: _isSubmitting,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _emailCtrl,
                label: 'Correo',
                //readOnly: _isSubmitting,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _passwordCtrl,
                label: 'Contraseña',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
                //readOnly: _isSubmitting,
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomFilledButton(
                    text: 'Registrate',
                    buttonColor: Colors.black,
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _createAccount();
                            } else {
                              setState(() {
                                _autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
