import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class ProfileEvent {}

class FetchProfileData extends ProfileEvent {}


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String title;

  ProfileLoaded(this.title);
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileData) {
      yield ProfileLoading();
      try {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          yield ProfileLoaded(data['title']);
        } else {
          yield ProfileError('Failed to load profile data');
        }
      } catch (e) {
        yield ProfileError('An error occurred');
      }
    }
  }
}
