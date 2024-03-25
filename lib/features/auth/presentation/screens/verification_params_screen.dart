import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/config/router/router.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';
import 'package:myfitbro/features/shared/widgets/custom_filled_button.dart';
import 'package:myfitbro/features/shared/widgets/custom_text_form_field.dart';

class VerificationParamsScreen {
  const VerificationParamsScreen(
      {required this.email, required this.password, required this.username});

  final String email;
  final String password;
  final String username;
}

class VerificationScreen extends ConsumerStatefulWidget {
  const VerificationScreen({super.key, required this.params});

  final VerificationParamsScreen params;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationParamsScreen();
}

class _VerificationParamsScreen extends ConsumerState<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _codeCtrl = TextEditingController();

  Future<void> _resendCode() async {
    try {
      setState(() {
        _isSubmitting = true;
      });
      await ref.read(authRemoteRepositoryProvider).signUp(
          email: widget.params.email,
          password: widget.params.password,
          username: widget.params.username);

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('New code is sent')));

        //context.go('/');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
    setState(() {
      _isSubmitting = false;
    });
  }

  Future<void> _verify() async {
    try {
      setState(() {
        _isSubmitting = true;
      });
      await ref
          .read(authRemoteRepositoryProvider)
          .verifyOTP(email: widget.params.email, token: _codeCtrl.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully signed up')));

        ref.read(appRouterProvider).push('/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFitBro - verifica'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                  'Introduce el código de verificación enviado a ${widget.params.email}',
                  style: textStyles.titleMedium),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: _codeCtrl,
                //readOnly: _isSubmitting,
                label: 'Código',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Missing the verification code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Verificar',
                  onPressed: _isSubmitting
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _verify();
                          } else {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                ),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No has recibido el código?'),
                  TextButton(
                      onPressed: _isSubmitting ? null : _resendCode,
                      child: const Text('Solicita uno nuevo aquí'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
