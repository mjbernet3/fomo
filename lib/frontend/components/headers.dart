import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/style/fomo_colors.dart';
import 'package:project_fomo/frontend/components/style/fomo_spacing.dart';
import 'package:project_fomo/frontend/components/style/fomo_text.dart';

class FomoPageHeader extends StatelessWidget {
  final String title;

  FomoPageHeader(this.title);

  //TODO: Fix Text Underline
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FomoSeparator.horizontalSeparator[3],
        FomoSeparator.horizontalSeparator[3],
        FomoSeparator.horizontalSeparator[3],
        Padding(
          padding: FomoEdgeInsets.left[3] * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                title,
                style: FomoTextStyle.giantTitle,
              ),
              SizedBox(
                height: FomoSpacer.unit[0],
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: FomoGradient.main,
                  ),
                ),
              ),
            ],
          ),
        ),
        FomoSeparator.horizontalSeparator[3],
        FomoSeparator.horizontalSeparator[3],
      ],
    );
  }
}
