import 'package:flutter/material.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/presentation/card/component/icon_and_info_widget.dart';
import 'package:git_hub_card/presentation/card/component/info_icons.dart';
import 'package:widget_mask/widget_mask.dart';

class NameAndAvatarWidget extends StatelessWidget {
  const NameAndAvatarWidget({Key? key, required this.currentUser})
      : super(key: key);
  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    final infoIcons = InfoIcons();

    final List<String> userInfos = [
      currentUser.company,
      currentUser.location,
      currentUser.email,
      currentUser.blog,
      // currentUser.twitter
    ];

    return Stack(
      children: [
        SizedBox(
          width: 308,
          height: 554,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 45, bottom: 45),
            child: RotatedBox(
              quarterTurns: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          SizedBox(
                            width: 220,
                            child: Text(
                              currentUser.name,
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontFamily: 'NotoSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            width: 220,
                            child: Text(
                              currentUser.displayName,
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      WidgetMask(
                        blendMode: BlendMode.softLight,
                        mask: CircleAvatar(
                          radius: 42,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white,
                                  Color(0xff49549D),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.avatarUrl),
                          radius: 42,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 40,
          child: RotatedBox(
            quarterTurns: 1,
            child: Column(
              children: userInfos
                  .where((e) => e.isNotEmpty)
                  .map((e) => IconAndInfoWidget(
                      icon: infoIcons.icons[userInfos.indexOf(e)], info: e))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
