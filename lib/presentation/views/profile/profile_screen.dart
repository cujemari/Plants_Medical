import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_plants/presentation/viewmodels/profile_view_model.dart';
import 'package:app_plants/presentation/wigets/profile_widgets/profile_guest_widget.dart';
import 'package:app_plants/presentation/wigets/profile_widgets/profile_user_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = ProfileViewModel();
        viewModel.loadUser();
        return viewModel;
      },
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          final user = viewModel.user;

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: user != null
                            ? ProfileUserWidget(
                                user: user,
                                onLogout: () => viewModel.logout(context, () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                }),
                              )
                            : const ProfileGuestWidget(),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
