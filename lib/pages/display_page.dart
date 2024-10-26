import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/image_modal.dart';
import 'package:wallpaper_app/services/app_services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/widgets/image_card.dart';

class DisplayPage extends StatefulWidget {
  final String topic;

  const DisplayPage({Key? key, required this.topic}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  Future<List<Photo>>? photos;

  @override
  void initState() {
    super.initState();
    photos = ApiCalls().loadWallpapers(widget.topic);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: photos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ImageCard(photo: snapshot.data![index]);
              },
            ),
          );
        }
      },
    );
  }
}
