import 'package:flutter/material.dart';

class ProfileInfoContainerWidget extends StatelessWidget {
  const ProfileInfoContainerWidget(
      {Key? key, required this.info, required this.description})
      : super(key: key);
  final String info;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isInfoEmpty = info == '';
    final bool isDescriptionEmpty = description == '';
    final infoString = isInfoEmpty
        ? 'You can register your ${description.toLowerCase()} at GitHub'
        : info;

    return Column(
      children: [
        isDescriptionEmpty
            ? const SizedBox()
            : Row(
                children: [
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff494949)),
                  )
                ],
              ),
        const SizedBox(height: 3),
        Container(
          height: 48,
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                width: 2,
                color: isInfoEmpty
                    ? const Color(0xff8593C0).withOpacity(0.5)
                    : Colors.transparent),
            color: isInfoEmpty ? const Color(0xffe5e5ff) : Colors.white,
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                width: width * 0.7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    infoString,
                    style: const TextStyle(color: Colors.grey),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
