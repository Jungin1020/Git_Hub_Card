import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_card/presentation/card/component/utils.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/domain/model/logo.dart';
import 'package:git_hub_card/domain/use_case/word_symbol_switch_use_case.dart';
import 'package:git_hub_card/presentation/profile/components/profile_info_container_widget.dart';
import 'package:git_hub_card/presentation/profile/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {Key? key, required this.currentUser, required this.logos})
      : super(key: key);

  final CurrentUser currentUser;
  final List<Logo> logos;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FixedExtentScrollController _baseScrollController =
      FixedExtentScrollController();

  @override
  void dispose() {
    _baseScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final viewModel = context.watch<ProfileViewModel>();
    final state = viewModel.state;
    final cupertinoDialog = CupertinoDialog();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffEFEFEF).withOpacity(0.5),
        elevation: 0,
        forceMaterialTransparency: true,
        // excludeHeaderSemantics: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop(state.languages);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Opacity(
                opacity: 0.9,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.currentUser.avatarUrl),
                  radius: 48,
                ),
              ),
              const SizedBox(height: 18),
              ProfileInfoContainerWidget(
                info: widget.currentUser.name,
                description: 'Name',
              ),
              ProfileInfoContainerWidget(
                info: widget.currentUser.displayName,
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
                info: widget.currentUser.email,
                description: 'Email',
              ),
              ProfileInfoContainerWidget(
                info: widget.currentUser.company,
                description: 'Company',
              ),
              ProfileInfoContainerWidget(
                info: widget.currentUser.location,
                description: 'Location',
              ),
              ProfileInfoContainerWidget(
                info: widget.currentUser.blog,
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
                  return GestureDetector(
                    child: ProfileInfoContainerWidget(
                        color: const Color(0xff1e1e1e),
                        info: WordSymbolSwitchUseCase()
                            .wordToSymbol(state.languages[index])
                            .toUpperCase(),
                        description: (index == 0) ? 'Languages' : ''),
                    onTap: () {
                      _baseScrollController.dispose();
                      _baseScrollController = FixedExtentScrollController(
                          // initialItem: widget.state.rates.keys
                          initialItem: widget.logos
                              .map((e) => e.name)
                              .toList()
                              .indexWhere((e) => e == state.languages[index]));
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [
                            SizedBox(
                              height: 350,
                              child: CupertinoPicker(
                                scrollController: _baseScrollController,
                                onSelectedItemChanged: (int idx) {
                                  viewModel.updateLanguages(
                                      widget.logos
                                          .map((e) => e.name)
                                          .toList()[idx],
                                      index);
                                  // print(state.languages);
                                },
                                itemExtent: 64,
                                children: widget.logos
                                    .map((e) => e.name)
                                    .toList()
                                    .map(
                                      (lang) => Center(
                                        child: Text(WordSymbolSwitchUseCase()
                                            .wordToSymbol(lang)),
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text(
                              'Cancel',
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      );
                    },
                  );
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
                  cupertinoDialog.showDialog(context, 0);
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
