import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app/pages/explore_page.dart';
import 'package:wallpaper_app/pages/favorite_page.dart';
import 'package:wallpaper_app/pages/profile_page.dart';
import 'package:wallpaper_app/pages/search_page.dart';
import 'package:wallpaper_app/widgets/theme_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _onTappedScreen = [
    const ExplorePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  final myController = TextEditingController();

  _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Wallpaper",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: const [
          ThemeSwitch(),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: TextField(
              controller: myController,
              onSubmitted: (value) {
                setState(() {});
              },
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Theme.of(context).primaryColor),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                suffixIcon: myController.text.isNotEmpty
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          myController.clear();
                          setState(() {});
                        },
                      )
                    : Container(
                        width: 0.0,
                      ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                filled: true,
                fillColor: Theme.of(context).backgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: (myController.text.isEmpty)
                ? _onTappedScreen[_currentIndex]
                : SearchPage(searchedWord: myController.text.trim()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(size: 35),
        unselectedIconTheme: const IconThemeData(size: 25),
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
