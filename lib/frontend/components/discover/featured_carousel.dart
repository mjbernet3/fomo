import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/backend/state_models/carousel_model.dart';
import 'package:project_fomo/frontend/components/discover/carousel_ellipse.dart';
import 'package:project_fomo/frontend/components/discover/event_card.dart';
import 'package:project_fomo/frontend/components/state_widget.dart';
import 'package:project_fomo/style.dart';

class FeaturedCarousel extends StatelessWidget {
  final List<Event> events;

  FeaturedCarousel(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 5.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featured",
              style: TextStyle(
                color: AppTextColor.title,
                fontSize: AppFontSize.size22,
                fontFamily: AppFontFamily.family,
              ),
            ),
          ),
        ),
        StateWidget<CarouselModel>(
          stateModel: CarouselModel(),
          builder: (context, model, child) {
            List<Widget> ellipses = [];
            for (var i = 0; i < events.length; i++) {
              ellipses.add(CarouselEllipse(activated: (i == model.index)));
            }
            return Column(
              children: <Widget>[
                CarouselSlider(
                  height: 220,
                  viewportFraction: 1.1,
                  onPageChanged: (int index) => (model.index = index),
                  items: events
                      .map<Widget>(
                        (event) => Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: SmallEventCard(event: event),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ellipses,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
