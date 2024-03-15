import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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