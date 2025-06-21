import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device_features/providers/user_places.dart';
import 'package:native_device_features/screens/add_place.dart';
import 'package:native_device_features/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref ) {
    // get access to my provider that tells me whenever my data changes
    final userPlace = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => AddPlaceScreen()
                ));
              },
              icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: userPlace),
      ),
    );
  }
}
