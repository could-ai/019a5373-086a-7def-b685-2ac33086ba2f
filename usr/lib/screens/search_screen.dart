import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _type;
  String? _location;
  double? _minPrice;
  double? _maxPrice;
  int? _maxAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeWise AI - Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Property Type'),
                items: ['Apartment', 'Villa', 'Studio', 'House']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (val) => setState(() => _type = val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (val) => _location = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Min Price'),
                keyboardType: TextInputType.number,
                onChanged: (val) => _minPrice = double.tryParse(val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Max Price'),
                keyboardType: TextInputType.number,
                onChanged: (val) => _maxPrice = double.tryParse(val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Max Listing Age (days)'),
                keyboardType: TextInputType.number,
                onChanged: (val) => _maxAge = int.tryParse(val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Search'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/listings',
                    arguments: {
                      'type': _type,
                      'location': _location,
                      'minPrice': _minPrice,
                      'maxPrice': _maxPrice,
                      'maxAge': _maxAge,
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
