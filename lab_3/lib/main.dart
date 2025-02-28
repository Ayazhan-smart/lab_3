import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstImage = true;

  void toggleImage() {
    setState(() {
      isFirstImage = !isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, 
      home: HomeScreen(toggleImage: toggleImage, isFirstImage: isFirstImage),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleImage;
  final bool isFirstImage;

  const HomeScreen({super.key, required this.toggleImage, required this.isFirstImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Lab 3")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildStack(),
            const SizedBox(height: 20),
            buildImageContainer(),
            const SizedBox(height: 20),
            buildTypesButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      children: [
        Image.asset(
          'assets/image1.jpg',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 250,
          color: Colors.black.withOpacity(0.5),
        ),
        const Positioned(
          top: 100,
          left: 50,
          child: Text(
            "Welcome to Flutter",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageContainer() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Image.asset(
        'assets/image1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildTypesButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Сіз SnackBar батырмасын бастыныз!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(200, 50),
          ),
          child: const Text("Show SnackBar", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          style: TextButton.styleFrom(
            minimumSize: const Size(200, 50),
          ),
          child: const Text("Go to Second Screen", style: TextStyle(fontSize: 16, color: Colors.green)),
        ),
        const SizedBox(height: 20),
        Image.asset(
          isFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: toggleImage,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(200, 50),
            side: const BorderSide(color: Colors.black),
          ),
          child: const Text("Toggle Image", style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Сіз Екінші экранға өттіңіз!",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Back", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
