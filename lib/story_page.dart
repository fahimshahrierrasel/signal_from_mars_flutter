import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'story.dart';

class StoryPage extends StatefulWidget {
  final Page page;

  StoryPage(this.page);

  @override
  _StoryPageState createState() => _StoryPageState(page);
}

class _StoryPageState extends State<StoryPage> {
  Page page;
  _StoryPageState(this.page);
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // Loading the initial sound
    loadMusic('music/Ominous.wav', true);
  }

  /// Playing given audio
  ///
  /// Audio will play in loop based on loop variable
  void loadMusic(String audioPath, bool loop) async {
    // Checking if the audio player is null or not. If instantiated then stop
    // current audio and release it.
    if (_audioPlayer != null) {
      await _audioPlayer.stop();
      await _audioPlayer.release();
    }
    // instantiated audio player with the given audio
    _audioPlayer = await AudioCache().play(audioPath);
    // If loop is true the audio will play in loop
    if (loop) await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  void dispose() {
    _audioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context).settings.arguments;
    void changePageTo(String next) {
      // Get the next page from the given page name
      final nextPage =
          pages.firstWhere((pag) => pag.name == next, orElse: () => pages[0]);
      setState(() {
        // Play different sound based on different page.
        if (nextPage.name == 'page6')
          loadMusic('music/HappyEnding.wav', true);
        else if (nextPage.name == 'page0')
          loadMusic('music/Ominous.wav', false);
        else
          loadMusic('music/PageTurn.wav', false);
        this.page = nextPage;
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(page.image),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  // Set the name in the story where %1{} found
                  page.story.contains('%1{}')
                      ? page.story.replaceAll('%1{}', name)
                      : page.story,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Check if the choice1 is null or not
                page.choice1 != null
                    ? SizedBox(
                        height: 50.0,
                        child: RaisedButton(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Text(page.choice1.text),
                          onPressed: () {
                            changePageTo(page.choice1.next);
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(0.0),
                      ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                ),
                SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Text(page.choice2.text),
                    onPressed: () {
                      changePageTo(page.choice2.next);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
