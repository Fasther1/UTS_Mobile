import 'package:flutter/material.dart';

void main() {
  runApp(const CustomTabBarApp());
}

class CustomTabBarApp extends StatelessWidget {
  const CustomTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AndroWidget(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class AndroWidget extends StatefulWidget {
  const AndroWidget({super.key});

  @override
  State<AndroWidget> createState() => _AndroWidgetState();
}

class _AndroWidgetState extends State<AndroWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.person), text: "Profile"),
            Tab(icon: Icon(Icons.settings), text: "Settings"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeTab(),
          ProfileTab(),
          SettingsTab(),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text("Acaa's Home", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text('This is the Profile Tab', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 100, color: Colors.red),
          SizedBox(height: 20),
          Text('Configure your Settings here', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
