import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/display_page.dart';

class SearchPage extends StatefulWidget {
  final String searchedWord;
  const SearchPage({Key? key, required this.searchedWord}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "These are the results for ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                TextSpan(
                  text: "${widget.searchedWord}.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: DisplayPage(topic: widget.searchedWord),
        ),
      ],
    );
  }
}
