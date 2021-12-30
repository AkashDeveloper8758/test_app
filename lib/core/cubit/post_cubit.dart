import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/core/API/post_api_service.dart';
import 'package:todoapp/core/model/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final ApiClient postApiClient;
  List<PostModel> _postModelList = [];
  int _currentOffset = -1;
  bool _fetchingData = false;
  bool _isMaxReached = false;

  PostCubit(this.postApiClient) : super(PostInitial());

  void fetchPosts({bool isInitialCall = false}) async {
    try {
      if (isInitialCall && _postModelList.isNotEmpty) {
        emit(PostLoading());
        emit(PostLoaded(postDataList: _postModelList));
        print('already exist with size: ${_postModelList.length}');
        return;
      }

      if (_fetchingData || _isMaxReached) {
        // print('already fetching .  .  .  .');
        emit(PostLoaded(postDataList: _postModelList));

        return;
      } else {
        _fetchingData = true;
      }
      if (_currentOffset < 0) {
        _currentOffset = 0;
      } else {
        _currentOffset += 10;
      }
      emit(PostLoading());
      List<PostModel> postList = [];
      final response = await postApiClient.getPost(offset: _currentOffset);
      if (response == null) return;

      var mapData =
          (response as List).map((e) => e as Map<String, dynamic>).toList();
      final postModel = mapData.map((e) => PostModel.fromJson(e)).toList();
      if (postModel.isEmpty) {
        _isMaxReached = true;
        print('maxreachec');
        return;
      }
      _fetchingData = false;
      _postModelList.addAll(postModel);
      emit(PostLoaded(postDataList: _postModelList));
    } catch (err) {
      print('post fetching error: ${err.toString()}');
    }
    _fetchingData = false;
  }
}
