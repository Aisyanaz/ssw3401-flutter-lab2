import 'package:flutter/material.dart';

void main() {
  runApp(const TravelJournalApp());
}

class TravelJournalApp extends StatelessWidget {
  const TravelJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Journal',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F1E8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B8065),
          primary: const Color(0xFF80664F),
          secondary: const Color(0xFFB69B7D),
        ),
        fontFamily: 'Roboto',
      ),
      home: const TravelHomePage(),
    );
  }
}

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  Widget travelImage(String path, {double height = 110}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        path,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: height,
            width: double.infinity,
            color: const Color(0xFFE8DCCB),
            alignment: Alignment.center,
            child: const Text(
              'Add photo to assets folder',
              style: TextStyle(color: Color(0xFF80664F), fontSize: 11),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget compactGalleryCard(String imagePath, String place, String shortDesc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Card(
        color: const Color(0xFFFFFCF7),
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 50,
                      width: 50,
                      color: const Color(0xFFE8DCCB),
                      child: const Icon(Icons.image, size: 20, color: Color(0xFF80664F)),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF594737),
                      ),
                    ),
                    Text(
                      shortDesc,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF8B7968),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Header
              const Text(
                'TRAVEL JOURNAL',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Color(0xFF594737),
                ),
              ),
              const SizedBox(height: 6),

              // Cover Image (Picture 1)
              travelImage('assets/travel_cover.jpg', height: 100),
              const SizedBox(height: 8),

              // Gallery Title
              const Text(
                'Gallery Moments',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF594737),
                ),
              ),
              const SizedBox(height: 6),

              // 3 Gallery Items (Pictures 2, 3, and 4 formatted cleanly as horizontal rows to fit screen)
              compactGalleryCard(
                'assets/first gallery.jpg',
                'Beautiful Views',
                'Breathtaking scenery.',
              ),
              compactGalleryCard(
                'assets/sec_gallery.jpg',
                'Little Adventures',
                'Fresh experiences.',
              ),
              compactGalleryCard(
                'assets/third_gallery.jpg',
                'Special Moments',
                'Treasured memories.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}