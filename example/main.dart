import 'package:flutter/material.dart';
import 'package:reusable_app_bar/reusable_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable App Bar Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppSimpleAppBar(
        title: 'Home',
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null, // Replace with your logic
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Profile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StackedAvatarAppBar(
        title: 'Profile',
        backgroundColor: Colors.teal,
        imageSource: 'https://via.placeholder.com/150',
        imgRadius: 40,
        isCenterAvatar: true,
      ),
      body: const Center(child: Text('User Profile Page')),
    );
  }
}
