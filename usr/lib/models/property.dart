class Property {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String location;
  final double area;
  final String type;
  final DateTime postedDate;

  Property({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.location,
    required this.area,
    required this.type,
    required this.postedDate,
  });
}

class AiValuation {
  final double estimatedValue;
  final double roi;
  final String recommendation;
  final double confidence;

  AiValuation({
    required this.estimatedValue,
    required this.roi,
    required this.recommendation,
    required this.confidence,
  });
}
