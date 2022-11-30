import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final socialIcon;
  const SocialIcon({
    Key? key,
    this.socialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        socialIcon,
        width: 20,
        height: 20,
      ),
    );
  }
}
