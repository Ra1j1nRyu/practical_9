import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_9/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: ProfileContent(),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileData());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
            return Text('Title: ${state.title}');
          } else if (state is ProfileError) {
            return Text('Error: ${state.error}');
          } else {
            return Text('Press the button to load profile data.');
          }
        },
      ),
    );
  }
}
