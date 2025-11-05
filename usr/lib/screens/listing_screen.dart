import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/api_service.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  late Future<List<Property>> _future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _future = ApiService.fetchProperties(
      type: args['type'],
      location: args['location'],
      minPrice: args['minPrice'],
      maxPrice: args['maxPrice'],
      maxAgeDays: args['maxAge'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listings')),
      body: FutureBuilder<List<Property>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final properties = snapshot.data!;
          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final p = properties[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(p.imageUrl),
                  title: Text(p.title),
                  subtitle: Text('${p.location} • \$${p.price.toStringAsFixed(0)}'),
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: p);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
