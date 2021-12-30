import 'package:flutter/material.dart';
import 'package:todoapp/core/model/post_model.dart';

class CharacterDetailScreen extends StatefulWidget {
  final PostModel postsModel;
  const CharacterDetailScreen({Key? key, required this.postsModel})
      : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    var character = widget.postsModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(character.name!),
        ),
        body: Container(
          width: double.infinity,
          key: ValueKey(character.id),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                character.img!,
                // height: mediaSize.height / 1.5,
                alignment: Alignment.center,
                // width: mediaSize.width / 2 - 16,
                fit: BoxFit.contain,
              ),
              Text(
                character.name!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(character.birthday!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
