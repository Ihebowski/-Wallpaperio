import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/app_colors.dart';
import 'package:wallpaper_app/models/image_modal.dart';
import 'package:wallpaper_app/pages/image_page.dart';

class ImageCard extends StatefulWidget {
  late Photo photo;

  ImageCard({Key? key, required this.photo}) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePage(photo: widget.photo),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl: widget.photo.src!.portrait,
          fit: BoxFit.cover,
          height: 270,
          placeholder: (context, url) => Center(
            child: Container(
              color: Theme.of(context).backgroundColor,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Text("Error"),
          ),
        ),
      ),
    );
  }
}
