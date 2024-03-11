import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/config/router/router.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';

import '../../../shared/widgets/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isLoading = false;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    //final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    //final size = MediaQuery.of(context).size;

    Future<void> login() async {
      try {
        setState(() {
          isLoading = true;
        });

        await ref.read(authRemoteRepositoryProvider).login(
              email: email.text.trim(),
              password: password.text.trim(),
            );

        if (mounted) {
          ref.read(routerProvider).pop();
          //context.pop();
        }
      } catch (e) {
        context.showAlert(e.toString());
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('MyFitBro')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text('Login', style: textStyles.titleLarge),
            const SizedBox(height: 90),
            CustomTextFormField(
              controller: email,
              label: 'Correo',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: password,
              label: 'Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Entrar',
                  buttonColor: Colors.black,
                  onPressed: isLoading
                      ? null
                      : () {
                          login();
                        },
                )),
            const Spacer(flex: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¿No tienes cuenta?'),
                //TextButton(
                //onPressed: context.push('/signup'),
                //onPressed: () => ref.read(appRouterProvider).push('/signup'),//context.push('/signup'),
                //child: const Text('Crea una aquí'))
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
