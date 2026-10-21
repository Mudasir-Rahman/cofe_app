import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _coffeeBrown = const Color(0xFF6F4E37);

  bool _profileAvailable = false;
  bool _profileExists = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _nameController.text.trim();
    final profileBloc = context.read<ProfileBloc>();
    if (_profileExists) {
      profileBloc.add(UpdateProfileEvent(fullName: fullName));
    } else {
      profileBloc.add(CreateProfileEvent(fullName: fullName));
    }
  }

  void _handleProfileState(ProfileState state) {
    if (state is ProfileLoaded) {
      _profileAvailable = true;
      _profileExists = true;
      _nameController.text = state.profile.fullName;
      _error = null;
    } else if (state is ProfileUpdated) {
      _profileAvailable = true;
      _profileExists = true;
      _nameController.text = state.profile.fullName;
      _error = null;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile updated.')));
    } else if (state is ProfileCreated) {
      _profileAvailable = true;
      _profileExists = true;
      _nameController.text = state.profile.fullName;
      _error = null;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile created.')));
    } else if (state is ProfileNotFound) {
      _profileAvailable = true;
      _profileExists = false;
      _nameController.clear();
      _error = null;
    } else if (state is ProfileError) {
      _error = state.message;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) => _handleProfileState(state),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7EDE0),
          appBar: AppBar(
            backgroundColor: _coffeeBrown,
            foregroundColor: Colors.white,
            title: const Text('Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: _profileAvailable
                ? _buildProfileForm(state is ProfileLoading)
                : state is ProfileError
                ? _buildLoadError(state.message)
                : const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildProfileForm(bool isSaving) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _profileExists ? 'Update your profile' : 'Set up your profile',
            style: const TextStyle(
              color: Color(0xFF3E2723),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your name here. You can change it anytime.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.person_outline, color: _coffeeBrown),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name.';
              }
              return null;
            },
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: const TextStyle(color: Colors.red)),
          ],
          const SizedBox(height: 24),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: isSaving ? null : _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: _coffeeBrown,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isSaving
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Save profile'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadError(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () =>
                context.read<ProfileBloc>().add(const GetProfileEvent()),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
