import 'package:common/common.dart';
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
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _CircularProfileImage(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30.h,
          children: [
            Column(
              spacing: 7.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(context),
                _buildSubTitle(context),
                _buildDescription(context),
              ],
            ),
            _MainButtons(),
          ],
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            theme.colorScheme.onSurface,
            theme.colorScheme.tertiary,
            theme.colorScheme.onTertiary,
          ],
        ).createShader(bounds);
      },
      child: Text(
        "Sou Thiago Sousa",
        style: theme.textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
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
    final ThemeData theme = Theme.of(context);
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        border: BoxBorder.all(
          color: theme.colorScheme.tertiary,
          width: 2,
        ),
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          image: AssetImage(AssetsImages.profile),
        ),
      ),
    );
  }
}

class _MainButtons extends StatelessWidget {
  const _MainButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: HeroIcon(HeroIcons.envelope),
          label: Text("Entrar em contato"),
        ),

        OutlinedButton.icon(
          onPressed: () {},
          iconAlignment: IconAlignment.end,
          icon: HeroIcon(HeroIcons.arrowRight),
          label: Text("Blog"),
        ),
      ],
    );
  }
}

