import 'package:bloc_example/bloc/album_bloc.dart';
import 'package:bloc_example/bloc/albumstate.dart';
import 'package:bloc_example/model/albummodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumsBloc>(context).fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Albums',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AlbumsBloc, AlbumsState>(
        builder: (context, state) {
          if (state.albums.isEmpty) {
            return const Center(
              child: Text(
                "No Data",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            List<AlbumResponse> albumResponse = state.albums;
            return ListView.builder(
                itemCount: albumResponse.length,
                itemBuilder: (_, index) {
                  AlbumResponse album = albumResponse[index];
                  return SizedBox(
                    height: 70,
                    child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 10,
                        shadowColor: Colors.amberAccent,
                        child: Text(album.title)),
                  );
                });
          }
        },
      ),
    );
  }
}
