// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/display_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // ignore: no_leading_underscores_for_local_identifiers
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
            // ignore: deprecated_member_use
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
