part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostEmpty extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel>? postDataList;

  const PostLoaded({required this.postDataList}) : assert(postDataList != null);

  @override
  List<Object> get props => [postDataList!];
}

class PostError extends PostState {}
