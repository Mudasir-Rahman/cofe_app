import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  bool _profileExists = false;
  String? _avatarUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  void _submitProfile() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final phoneNumber = _mobileNumberController.text.trim();
    final bloc = context.read<ProfileBloc>();

    if (_profileExists) {
      bloc.add(
        UpdateProfileEvent(
          fullName: name,
          phoneNumber: phoneNumber.isEmpty ? null : phoneNumber,
          avatarUrl: _avatarUrl,
        ),
      );
    } else {
      bloc.add(
        CreateProfileEvent(
          fullName: name,
          phoneNumber: phoneNumber.isEmpty ? null : phoneNumber,
          avatarUrl: _avatarUrl,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          _profileExists = true;
          _nameController.text = state.profile.fullName;
          _mobileNumberController.text = state.profile.phoneNumber ?? '';
          _avatarUrl = state.profile.avatarUrl;
        } else if (state is ProfileNotFound) {
          _profileExists = false;
        } else if (state is ProfileCreated || state is ProfileUpdated) {
          _profileExists = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile saved successfully')),
          );
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is ProfileLoading;
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                      color: Color(0xFF18181B),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0x1AC67C4E),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.manage_accounts,
                              color: Color(0xFFC67C4E),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Profile Setup',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Customize your info & coffee tastes',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFA1A1AA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFFA1A1AA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    color: const Color(0xFF18181B),
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF27272A),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Color(0xFFA1A1AA),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFC67C4E),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFF18181B),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFA1A1AA),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your full name',
                            hintStyle: const TextStyle(
                              color: Color(0xFF71717A),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xFFC67C4E),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF27272A),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFA1A1AA),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: _mobileNumberController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: const TextStyle(
                              color: Color(0xFF71717A),
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: Color(0xFFC67C4E),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF27272A),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: isLoading ? null : _submitProfile,
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Save Profile'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
