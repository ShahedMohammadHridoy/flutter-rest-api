import 'package:flutter/material.dart';
import 'package:data_from_api/networking/build_places.dart';
import '../model/places.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  BuildPlaces places = BuildPlaces();
  List<Places> data = [];
  bool isLoading = true;

  _getPlacesList() async {
    data = await places.buildPlaces();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPlacesList();
  }

  Widget buildPlaces(List<Places> places) => ListView.builder(
      itemCount: places.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final place = places[index];
        return Card(
          child: ListTile(
            title: Text(place.barangayName),
          ),
        );
      });

  Widget buildLoading() => Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places List'),
        centerTitle: true,
      ),
      body: isLoading
          ? buildLoading()
          : Column(
              children: [Expanded(child: buildPlaces(data))],
            ),
    );
  }
}
