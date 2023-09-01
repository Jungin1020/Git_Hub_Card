import 'package:flutter/material.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/presentation/card/component/icon_and_info_widget.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../../core/utils/utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.currentUser}) : super(key: key);
  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    final utils = Utils();

    final List<String> userInfos = [
      currentUser.company,
      currentUser.location,
      currentUser.email,
      currentUser.blog,
      // currentUser.twitter
    ];

    return SizedBox(
      width: 308,
      height: 554,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
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
                      Container(
                        width: 240,
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
                      Text(
                        currentUser.displayName,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // const CircleAvatar(
                      //   backgroundColor: Colors.grey,
                      //   radius: 43,
                      // ),
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
                                  Color(0xff4E8678),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.avatarUrl),
                          radius: 42,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: userInfos
                    .where((e) => e.isNotEmpty)
                    .map((e) => IconAndInfoWidget(
                        icon: utils.icons[userInfos.indexOf(e)], info: e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
