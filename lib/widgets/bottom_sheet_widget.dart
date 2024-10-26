import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class BottomSheetWidget extends StatelessWidget {
  final File file;
  const BottomSheetWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Home Screen",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () async {
              bool result = await WallpaperManager.setWallpaperFromFile(
                  file.path, WallpaperManager.HOME_SCREEN);
              if (result == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Wallpaper changed successfully",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              size: 26.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Lock Screen",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () async {
              bool result = await WallpaperManager.setWallpaperFromFile(
                  file.path, WallpaperManager.LOCK_SCREEN);
              if (result == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Wallpaper changed successfully",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 26.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Home & Lock Screen",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () async {
              bool result = await WallpaperManager.setWallpaperFromFile(
                  file.path, WallpaperManager.BOTH_SCREEN);
              if (result == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Wallpaper changed successfully",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
