import 'package:bloc_example/model/albummodel.dart';
import 'package:bloc_example/model/transactionresponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AlbumsRepo {
  Future<List<AlbumResponse>> getAlbums();
  Future<TransactionResponse> getTransactionList();
}

class ApiServices extends AlbumsRepo {
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_ALBUMS = '/albums';

  @override
  Future<List<AlbumResponse>> getAlbums() async {
    Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    var response = await http.get(uri);
    List<AlbumResponse> albums = albumResponseFromJson(response.body);
    return albums;
  }

  @override
  Future<TransactionResponse> getTransactionList() async {
    Uri uri =
        Uri.parse('https://mocki.io/v1/7a11d707-1611-4e19-b17f-a40dce81d7fa');
    var response = await get(uri);
    var transactionResponse = transactionResponseFromJson(response.body);
    return transactionResponse;
  }
}
