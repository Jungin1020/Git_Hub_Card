import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/core/utils/utils.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/domain/use_case/word_symbol_switch_use_case.dart';
import 'package:git_hub_card/presentation/profile/components/profile_info_container_widget.dart';
import 'package:git_hub_card/presentation/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);

  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final viewModel = context.watch<ProfileViewModel>();
    final state = viewModel.state;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffEFEFEF).withOpacity(0.5),
        elevation: 0,
        forceMaterialTransparency: true,
        // excludeHeaderSemantics: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Opacity(
                opacity: 0.9,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(currentUser.avatarUrl),
                  radius: 48,
                ),
              ),
              const SizedBox(height: 18),
              ProfileInfoContainerWidget(
                info: currentUser.name,
                description: 'Name',
              ),
              ProfileInfoContainerWidget(
                info: currentUser.displayName,
                description: 'Display name',
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: width * 0.8,
                child: Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 8),
              ProfileInfoContainerWidget(
                info: currentUser.email,
                description: 'Email',
              ),
              ProfileInfoContainerWidget(
                info: currentUser.company,
                description: 'Company',
              ),
              ProfileInfoContainerWidget(
                info: currentUser.location,
                description: 'Location',
              ),
              ProfileInfoContainerWidget(
                info: currentUser.blog,
                description: 'Blog',
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: width * 0.8,
                child: Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.languages.length,
                itemBuilder: (context, index) {
                  return ProfileInfoContainerWidget(
                      color: const Color(0xff1e1e1e),
                      info: WordSymbolSwitchUseCase()
                          .wordToSymbol(state.languages[index])
                          .toUpperCase(),
                      description: (index == 0) ? 'Languages' : '');
                },
              ),
              GestureDetector(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.blueAccent,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Column(
                      children: [
                        Text(
                          'add languages',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Utils().showDialog(context, 0);
                },
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffEFEFEF),
    );
  }
}
