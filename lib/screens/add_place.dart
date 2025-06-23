import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/model/place.dart';
import 'package:native_device_features/providers/user_places.dart';
import 'package:native_device_features/widgets/image_input.dart';
import 'package:native_device_features/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _tileController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enterText = _tileController.text;
    if (enterText.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enterText, _selectedImage!, _selectedLocation!);
    //for going back using navigator pop
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _tileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new place")),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  //label: Text("Title")
                  labelText: "Title",
                ),
                controller: _tileController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              // Input Image
              ImageInput(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              // for location input
              SizedBox(height: 10),
              LocationInput(
                onSelectLocation: (location) {
                  _selectedLocation = location;
                },
              ),
              // for add place
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.add),
                onPressed: _savePlace,
                label: Text("Add place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
