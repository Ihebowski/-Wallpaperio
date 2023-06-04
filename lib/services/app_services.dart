import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/image_modal.dart';

class ApiCalls {
  Future<List<Photo>> loadWallpapers(String? topic) async {
    final queryParameters = {
      'per_page': '30',
      'query': topic,
    };
    final url = Uri.https("api.pexels.com", "/v1/search", queryParameters);

    final response = await http.get(url, headers: {
      'Authorization':
          '563492ad6f91700001000001e73c546b0f554780a08b12fb12a543bc',
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonPhotos = jsonResponse['photos'] as List;
      return jsonPhotos.map((data) => Photo.fromJson(data)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
