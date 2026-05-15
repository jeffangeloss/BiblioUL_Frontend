// lib/pages/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController control = Get.put(HomeController());

  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: SearchPage()), // index 0
    Center(child: Text('Escanear QR')), // index 1
    Center(child: Text('Favoritos')), // index 2
  ];

  Widget _buildBody() {
    return _pages[_currentIndex];
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'perfil':
        print('Ir a Ver Perfil');
        break;
      case 'acerca':
        print('Ir a Acerca de');
        break;
      case 'logout':
        print('Cerrar sesión');
        break;
    }
  }

  AppBar _appBar(ColorScheme colors) {
    return AppBar(
      title: Text('BiblioApp ULima'),
      backgroundColor: colors.primaryContainer,
      actions: [
        PopupMenuButton<String>(
          onSelected: _onMenuSelected,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'perfil',
              child: Text('Ver Perfil'),
            ),
            PopupMenuItem(
              value: 'acerca',
              child: Text('Acerca de'),
            ),
            PopupMenuItem(
              value: 'logout',
              child: Text('Cerrar Sesión'),
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Escanear QR',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favoritos',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _appBar(colors),
      body: _buildBody(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
