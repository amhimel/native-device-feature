import 'package:flutter/material.dart';
import 'package:native_device_features/model/place.dart';
import 'package:native_device_features/screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
   final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if(places.isEmpty){
      return Center(child: Text("No places added yet.",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
      ),),);
    }
    return ListView.builder(
      itemCount: places.length,
        itemBuilder: (ctx,index) => ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
          ),
          subtitle: Text(
              places[index].location.address,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PlacesDetailScreen(
                    place: places[index]
                ),
            )
            );
          },
        ),
    );
  }
}
