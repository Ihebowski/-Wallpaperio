import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/display_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TabController _tabController = TabController(length: 2, vsync: this);

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).textTheme.subtitle1!.color,
            labelStyle: Theme.of(context).textTheme.subtitle1,
            unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
            unselectedLabelColor: Theme.of(context).textTheme.subtitle2!.color,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tabs: const [
              Tab(text: "TRENDING"),
              Tab(text: "POPULAR"),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: width,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  DisplayPage(topic: "TRENDING"),
                  DisplayPage(topic: "POPULAR"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
