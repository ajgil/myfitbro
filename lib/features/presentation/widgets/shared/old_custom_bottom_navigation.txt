import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.currentIndex});

  final int currentIndex;

  void onItemTapped(BuildContext context, int index) {
// context.go()
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/stats');
        break;
      case 2:
        context.go('/wods');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      //selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.home ),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.stacked_bar_chart ),
          label: 'Estadísticas'
        ),
       
        BottomNavigationBarItem(
          icon: Icon( Icons.fitness_center ),
          label: 'WODs'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite ),
          label: 'Favs'
        ),
      ]
    );
  }
}