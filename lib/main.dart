import 'package:flutter/foundation.dart'; // Required for kIsWeb
import 'package:flutter/material.dart';
import 'web_integrations.dart'; // Import the helper file

void main() {
  // This is the crucial part for web
  if (kIsWeb) {
    // Replace with your actual Voiceflow Project ID
    injectVoiceflowScript('68afff1a1a3ce574940e9d9c');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gourmet Grove',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //we'll use single child scroll view to make column scrolable
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopNavBar(),
            HeroSection(),
            MenuHighlights(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

//1. Top navigation bar
class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Gourmet Grove',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _navButton('Home'),
              const SizedBox(
                width: 20,
              ),
              _navButton('Menu'),
              const SizedBox(
                width: 20,
              ),
              _navButton('About'),
              const SizedBox(
                width: 20,
              ),
              _navButton('Contact'),
            ],
          )
        ],
      ),
    );
  }

  Widget _navButton(String text) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ));
  }
}

//2. Hero section
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://placehold.co/1920x600/2d3436/ffffff?text=Delicious+Food'),
            fit: BoxFit.cover),
      ),
      child: Container(
        //add a dark overlay for better readability.
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Experience food like never before.',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fresh ingredients, exquisite flavors, and an unforgettable dining experience.',
                style: TextStyle(fontSize: 20, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('View Our Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. The Menu Highlights Section
class MenuHighlights extends StatelessWidget {
  const MenuHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 48),
      child: Column(
        children: [
          const Text(
            'Our Signature Dishes',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          // Use a Wrap widget to make the layout responsive
          Wrap(
            spacing: 30, // Horizontal space between cards
            runSpacing: 30, // Vertical space between cards
            alignment: WrapAlignment.center,
            children: [
              _menuItemCard(
                  'Grilled Salmon',
                  'A delicious fillet of salmon grilled to perfection.',
                  'https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg'),
              _menuItemCard(
                  'Pasta Carbonara',
                  'Classic Italian pasta with a creamy egg sauce.',
                  'https://images.pexels.com/photos/4518885/pexels-photo-4518885.jpeg'),
              _menuItemCard(
                  'Chocolate Lava Cake',
                  'A rich chocolate cake with a gooey molten center.',
                  'https://images.pexels.com/photos/20522414/pexels-photo-20522414.jpeg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItemCard(String title, String description, String imageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // New Container with a fixed height for the text section
            Container(
              height: 120, // This ensures the text area has a consistent size
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Expanded allows the text to fill the available space
                  Expanded(
                    child: Text(
                      description,
                      // Added maxLines and overflow to handle long descriptions
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. The Footer
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: Colors.grey[900],
      child: const Column(
        children: [
          Text(
            'Gourmet Grove',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            '123 Food Street, Flavor Town, India\n+91 12345 67890 | contact@gourmetgrove.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '© 2025 Gourmet Grove. All Rights Reserved.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
