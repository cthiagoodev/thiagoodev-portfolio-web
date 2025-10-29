import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

final class Hero extends StatelessWidget {
  const Hero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _MainInfo(),
      ],
    );
  }
}

class _MainInfo extends StatelessWidget {
  const _MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CircularProfileImage(),
        Wrap(
          spacing: 7.h,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          children: [
            _buildTitle(context),
            _buildSubTitle(context),
            _buildDescription(context),
          ],
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      "Sou Thiago Sousa",
      style: theme.textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSubTitle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final primaryLightColor = theme.colorScheme.tertiary;
    final TextStyle? style = theme.textTheme.titleLarge
        ?.copyWith(fontWeight: FontWeight.w700);
    return Text.rich(
      style: style,
      TextSpan(
        text: "Engenheiro de Software",
        children: [
          TextSpan(
            text: "  •  ",
            style: style?.copyWith(color: primaryColor),
          ),
          TextSpan(
              text: "criador da ",
          ),
          TextSpan(
            text: "Mobile Devs Ceará",
            style: style?.copyWith(color: primaryLightColor)
          ),
        ]
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? style = theme.textTheme.bodyLarge;
    return Text.rich(
      style: style,
      TextSpan(
          text: "Meu trabalho é simples: transformar código em ",
          children: [
            TextSpan(
              text: "sistemas inteligentes e funcionais.",
              style: style?.copyWith(fontWeight: FontWeight.w700,),
            ),
          ]
      ),
    );
  }
}

class _CircularProfileImage extends StatelessWidget {
  const _CircularProfileImage({super.key});

  static const double radius = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}


