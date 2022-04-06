import 'package:bloc_example/model/albummodel.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRepo {
  Future<List<AlbumResponse>> getAlbums();
}

class AlbumServices extends AlbumsRepo {
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_ALBUMS = '/albums';


  @override
  Future<List<AlbumResponse>> getAlbums() async {
    Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    var response = await http.get(uri);
    List<AlbumResponse> albums = albumResponseFromJson(response.body);
    return albums;
  }
}
