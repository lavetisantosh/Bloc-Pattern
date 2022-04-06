import 'package:bloc_example/api/apiservices.dart';
import 'package:bloc_example/bloc/albumstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsBloc extends Cubit<AlbumsState> {
  AlbumsBloc({
    required this.albumsRepo,
  }) : super(AlbumsState(albums: []));

  final AlbumsRepo albumsRepo;

  void fetchAlbums() async {
    var albums = await albumsRepo.getAlbums();
    emit(AlbumsState(albums: albums));
  }
}
