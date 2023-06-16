part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class ActionState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;

  const PostLoadedState({required this.posts});
}
class DataPostingToApiState extends ActionState {}


class DataPostedToApiState extends ActionState {}
