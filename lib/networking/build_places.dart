import 'networking.dart';
import 'package:data_from_api/model/places.dart';

class BuildPlaces {
  buildPlaces() async {
    NetworkHelper networkHelper = NetworkHelper(
        Uri.parse('https://ph-locations-api.buonzz.com/v1/barangays'));

    var placesData = await networkHelper.getData();
    var placesList = placesData['data'];


    List<Places> result = [];

    for (var place in placesList){
      result.add(Places(place['name']));
    }

    return result;


  }
}
