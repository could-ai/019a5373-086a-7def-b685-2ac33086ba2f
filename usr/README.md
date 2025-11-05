# HomeWise AI

AI-powered Real Estate Investment App built with Flutter.

## Features
- Property search with filters: type, location, price range, listing age
- List fetched property listings (mock/stub) with image, title, price, location
- AI valuation stub: estimated value, ROI, recommendation, confidence
- Detail screen showing AI analysis

## Folder Structure
```
lib/
├── main.dart
├── models/
│   └── property.dart
├── services/
│   └── api_service.dart
└── screens/
    ├── search_screen.dart
    ├── listing_screen.dart
    └── property_detail_screen.dart
```

## Setup
1. Create a `.env` file at project root:
```
FACEBOOK_API_KEY=your_facebook_api_key
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
OPENAI_API_KEY=your_openai_api_key
MONGO_URI=your_mongodb_uri
```
2. Run:
```
flutter pub get
flutter run
```

## Next Steps
- Integrate real Facebook Marketplace Graph API in `ApiService.fetchProperties`
- Call OpenAI/Gemini in `ApiService.evaluateProperty` for real AI insights
- Add persistent storage or remote backend for user history and preferences
- Implement charts for price vs. estimated value
