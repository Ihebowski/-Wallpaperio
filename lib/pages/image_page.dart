import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app/constants/app_colors.dart';
import 'package:wallpaper_app/models/image_modal.dart';
import 'package:wallpaper_app/widgets/bottom_sheet_widget.dart';

// ignore: must_be_immutable
class ImagePage extends StatefulWidget {
  final Photo photo;
  bool _likedImage = false;

  ImagePage({Key? key, required this.photo}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      body: Builder(builder: (context) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: widget.photo.src!.portrait,
              height: height,
              width: width,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Text("Error"),
              ),
            ),
            Positioned(
              top: 50,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        color: whiteColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              width: width,
              bottom: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        var file = await DefaultCacheManager()
                            .getSingleFile(widget.photo.src!.portrait);
                        // ignore: use_build_context_synchronously
                        showBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetWidget(file: file),
                          backgroundColor: Colors.transparent,
                        );
                      },
                      // ignore: sort_child_properties_last
                      child: Text(
                        "Download",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          // ignore: deprecated_member_use
                          color: Theme.of(context).textTheme.button!.color,
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        // backgroundColor: MaterialStateProperty.all(
                        //     Theme.of(context).accentColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        widget._likedImage = true;
                      });
                    },
                    // ignore: sort_child_properties_last
                    child: Icon(
                      widget._likedImage
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 30,
                      color: blackColor,
                    ),
                    style: OutlinedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: whiteColor,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
