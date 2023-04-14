part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<Item> movie;
  MovieSuccess({required this.movie});
}
