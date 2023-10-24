import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_9/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: const ProfileContent(),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);
  @override
  ProfileContentState createState() => ProfileContentState();
}

class ProfileContentState extends State<ProfileContent> {
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
            return const CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title: ${state.title}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page3');
                  },
                  child: const Text('Go to Page 3'),
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Text('Error: ${state.error}');
          } else {
            return const Text('Press the button to load profile data.');
          }
        },
      ),
    );
  }
}
