import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/api_service.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  late Property property;
  late Future<AiValuation> _valuationFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    property = ModalRoute.of(context)!.settings.arguments as Property;
    _valuationFuture = ApiService.evaluateProperty(property);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(property.imageUrl),
            const SizedBox(height: 12),
            Text('Price: \$${property.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
            Text('Location: ${property.location}', style: const TextStyle(fontSize: 16)),
            Text('Area: ${property.area} sq.ft', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            FutureBuilder<AiValuation>(
              future: _valuationFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final val = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Estimated Value: \$${val.estimatedValue.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
                    Text('Projected ROI: ${val.roi.toStringAsFixed(1)}%', style: const TextStyle(fontSize: 18)),
                    Text('Recommendation: ${val.recommendation}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Confidence: ${(val.confidence * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 16)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
