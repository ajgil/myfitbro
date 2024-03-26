//import 'package:myfitbro/features/auth/application/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:myfitbro/config/router/router.dart';
//import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';
import 'package:myfitbro/features/presentation/widgets/widgets.dart';

/// Main page for authorized users
class HomeScreen extends ConsumerWidget {

    // propiedades navegacion entre tabs y vistas
  final int pageIndex;

  /// Default constructor for [DashboardScreen] widget
  const HomeScreen({required this.pageIndex, 
    super.key,
  });

  /// Application title displayed in the app bar
  final String title = 'myfitbro app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final organization = ref.watch(organizationViewControllerProvider());

    return Scaffold(
      appBar: AppBar(
        title: const CustomAppbar(),
        centerTitle: true,
        leading: const Icon(Icons.account_circle),
        
      ),
      
      /*
      AppBar(
        title: const Text('myfitbro app'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                ref.read(authRemoteRepositoryProvider).logout();
                ref.read(appRouterProvider).go('/signin');
              }),
        ],
      ),
      */
      body: const _HomeView(),
      //bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex,),
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

class _HomeView extends ConsumerStatefulWidget {

  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  
  @override
  void initState() {
    super.initState();
    //! add los providers que queramos consumir
    //ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Main dashboard', style: TextStyle(fontSize: 20)),
      );
  }
  

}
