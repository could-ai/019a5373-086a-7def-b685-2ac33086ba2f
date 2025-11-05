import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/search_screen.dart';
import 'screens/listing_screen.dart';
import 'screens/property_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const HomeWiseAIApp());
}

class HomeWiseAIApp extends StatelessWidget {
  const HomeWiseAIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeWise AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SearchScreen(),
        '/listings': (context) => const ListingScreen(),
        '/details': (context) => const PropertyDetailScreen(),
      },
    );
  }
}
