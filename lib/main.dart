import 'package:flutter/material.dart';

void main() {
  runApp(ZenZoneApp());
}

class ZenZoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zen Zone',
      theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFFFFFBF5), // light beige
      colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.light,
  ),
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  ),
  useMaterial3: true,
),

      home: ZenZoneHome(),
    );
  }
}

class ZenZoneHome extends StatefulWidget {
  @override
  _ZenZoneHomeState createState() => _ZenZoneHomeState();
}

class _ZenZoneHomeState extends State<ZenZoneHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PlannerScreen(),
    MoodChatScreen(),
    ZenGardenScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Plan'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Mood'),
          BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: 'Garden'),
        ],
      ),
    );
  }
}

class PlannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('🗓️ Planner Screen'));
  }
}

class MoodChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('😊 Mood Chat Screen'));
  }
}

class ZenGardenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE0F7FA), Color(0xFFFFFDE7)], // pastel blue to yellow
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_florist, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Welcome to your Zen Garden 🌿',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Take a breath. Listen. Be here.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

