import 'dart:async';
import '../models/property.dart';

class ApiService {
  /// Stub method to fetch properties using filters
  static Future<List<Property>> fetchProperties({
    String? type,
    String? location,
    double? minPrice,
    double? maxPrice,
    int? maxAgeDays,
  }) async {
    // TODO: integrate Facebook Marketplace Graph API or scraping layer
    await Future.delayed(const Duration(seconds: 1));
    // Return mock properties
    return List.generate(5, (index) {
      return Property(
        id: 'prop_$index',
        title: '${type ?? 'Apartment'} in ${location ?? 'City'} #$index',
        imageUrl: 'https://via.placeholder.com/150',
        price: (100000 + index * 5000).toDouble(),
        location: location ?? 'Unknown',
        area: (800 + index * 50).toDouble(),
        type: type ?? 'Apartment',
        postedDate: DateTime.now().subtract(Duration(days: index * 2)),
      );
    });
  }

  /// Stub method to evaluate a property with AI
  static Future<AiValuation> evaluateProperty(Property property) async {
    // TODO: call Google Gemini / OpenAI GPT with property details
    await Future.delayed(const Duration(seconds: 1));
    // Return mock AI valuation
    double estimated = property.price * 1.1;
    double roi = ((estimated - property.price) / property.price) * 100;
    String recommendation;
    if (roi > 10) {
      recommendation = 'Strong Buy';
    } else if (roi > 5) {
      recommendation = 'Hold';
    } else {
      recommendation = 'Pass';
    }
    return AiValuation(
      estimatedValue: estimated,
      roi: roi,
      recommendation: recommendation,
      confidence: 0.85,
    );
  }
}
