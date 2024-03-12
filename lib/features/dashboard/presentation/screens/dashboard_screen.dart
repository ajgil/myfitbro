//import 'package:myfitbro/features/auth/application/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/config/router/router.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';


/// Main page for authorized users
class DashboardScreen extends ConsumerWidget {
  /// Default constructor for [DashboardScreen] widget
  const DashboardScreen({
    super.key,
  });

  /// Application title displayed in the app bar
  final String title = 'myfitbro app';

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final organization = ref.watch(organizationViewControllerProvider());

    return Scaffold(
      appBar: AppBar(
        title:const Text('myfitbro app'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authRemoteRepositoryProvider).logout();
              ref.read(routerProvider).go('/signup');

            } 
            
          ),
        ],
      ),
      body: const Center(
        child: Text('Dentro!', style: TextStyle(fontSize: 30)),
      ),
    /*     
      body: organization.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Text('Organization: ')),
              const SizedBox(height: 30),
              const Center(child: Text('Settings / Departments')),
              Expanded(child: DepartmentsList(organization: data)),
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  child: const Text('Logout'),
                  onPressed: () =>
                      ref.read(authControllerProvider.notifier).signOut(),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text(e.toString()),
        ),
      ),
    */
    );
  }
}
