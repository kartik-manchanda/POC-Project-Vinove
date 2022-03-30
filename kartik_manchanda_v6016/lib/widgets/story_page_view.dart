import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPageView extends StatelessWidget {
  StoryPageView({Key? key}) : super(key: key);
  final _storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(
          title: '''By Failing to Plan you are planning to fail''',
          backgroundColor: Colors.red),
      StoryItem.pageImage(
          url: "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg",
          controller: _storyController),
      StoryItem.pageImage(
          url:
              "https://media.wired.com/photos/5e82883c6e4b250008c02ecc/1:1/w_572,h_572,c_limit/gear-emails-914669386.jpg",
          controller: _storyController,
          imageFit: BoxFit.contain),
    ];
    return Material(
      child: StoryView(
          storyItems: storyItems,
          controller: controller,
          inline: true,
          repeat: true,
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Navigator.pop(context);
            }
          } // To di
          ),
    );
  }
}
