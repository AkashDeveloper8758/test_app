import 'package:flutter/material.dart';
import 'package:todoapp/core/model/post_model.dart';
import 'package:todoapp/screens/charecter_detail_screen.dart';

class CharacterWidget extends StatefulWidget {
  final PostModel postsModel;
  const CharacterWidget({Key? key, required this.postsModel}) : super(key: key);

  @override
  _CharacterWidgetState createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    var character = widget.postsModel;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => CharacterDetailScreen(postsModel: character))),
      child: Container(
        key: ValueKey(character.id),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              character.img!,
              height: mediaSize.height / 3 - 60,
              width: mediaSize.width / 2 - 16,
              fit: BoxFit.cover,
            ),
            Text(
              character.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(character.birthday!),
          ],
        ),
      ),
    );
  }
}
