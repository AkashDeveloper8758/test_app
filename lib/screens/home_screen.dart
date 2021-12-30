import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/cubit/post_cubit.dart';
import 'package:todoapp/core/model/post_model.dart';
import 'package:todoapp/screens/widgets/character_widget.dart';
// import '../core/bloc/bloc_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PostCubit _postCubit;
  late ScrollController _scrollController;
  List<PostModel> _postList = [];

  @override
  void initState() {
    print('home init called ');
    _scrollController = ScrollController();
    _postCubit = BlocProvider.of<PostCubit>(context);
    // _postCubit.fetchPosts(0);
    _scrollController.addListener(scrollControllerListner);
    super.initState();
  }

  scrollControllerListner() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 120) {
      print('end reached');
      _postCubit.fetchPosts();
    }
  }

  @override
  void dispose() {
    // _postCubit.close();
    // getIt<ApiClient>().closeApiClient();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => {_postCubit.fetchPosts(isInitialCall: true)});
    var mediaSize = MediaQuery.of(context).size;
    var childAS = ((mediaSize.width / 2) - 16) / (mediaSize.height / 3 - 16);

    return Builder(builder: (context) {
      return Scaffold(
          body: BlocConsumer(
        bloc: _postCubit,
        listener: (ctx, state) {
          if (state is PostLoaded) {
            if (state.postDataList != null) {
              _postList = state.postDataList!;
              // setState(() {});
            }
          }
        },
        builder: (context, state) {
          if (_postList.isEmpty && state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (_postList.isEmpty) {
            return const Center(child: Text('no data'));
          }

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _postList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: childAS,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, count) {
                      return CharacterWidget(postsModel: _postList[count]);
                    }),
                state is PostLoading
                    ? const SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()))
                    : Container()
              ],
            ),
          );
        },
      ));
    });
  }
}
