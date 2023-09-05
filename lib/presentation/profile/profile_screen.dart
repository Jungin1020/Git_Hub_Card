import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/presentation/profile/components/profile_info_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {Key? key, required this.languages, required this.currentUser})
      : super(key: key);

  final List<String> languages;
  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
              CircleAvatar(
                backgroundImage: NetworkImage(currentUser.avatarUrl),
                radius: 48,
              ),
              SizedBox(height: 18),
              ProfileInfoContainerWidget(
                info: currentUser.name,
                description: 'Name',
              ),
              ProfileInfoContainerWidget(
                info: currentUser.displayName,
                description: 'Display name',
              ),
              SizedBox(height: 8),
              Container(
                width: width * 0.8,
                child: Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 8),
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
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffEFEFEF),
    );
  }
}
