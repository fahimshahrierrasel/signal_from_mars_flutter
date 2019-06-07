class Page {
  final String name;
  final String image;
  final String story;
  final Choice choice1;
  final Choice choice2;
  const Page(this.name, this.image, this.story, this.choice1, this.choice2);
}

class Choice {
  final String text;
  final String next;
  const Choice(this.text, this.next);
}

final page0 = Page(
    'page0',
    'assets/images/page0.png',
    "On your return trip from studying Saturn\'s rings, you hear a distress signal that seems to be coming from the surface of Mars. It\'s strange because there hasn\'t been a colony there in years. Even stranger, it\'s calling you by name: \"Help me, %1{}, you\'re my only hope.\"",
    Choice('Stop and investigate', 'page1'),
    Choice('Continue home to Earth', 'page2'));

final page1 = Page(
    'page1',
    'assets/images/page1.png',
    "You deftly land your ship near where the distress signal originated. You didn\'t notice anything strange on your fly-by, but there is a cave in front of you. Behind you is an abandoned rover from the early 21st century.",
    Choice('Explore the cave', 'page3'),
    Choice('Explore the rover', 'page4'));

final page2 = Page(
    'page2',
    'assets/images/page2.png',
    "You continue your course to Earth. Two days later, you receive a transmission from HQ saying that they have detected some sort of anomaly on the surface of Mars near an abandoned rover. They ask you to investigate, but ultimately the decision is yours because your mission has already run much longer than planned and supplies are low.",
    Choice('Head back to Mars to investigate', 'page4'),
    Choice('Continue home to Earth', 'page6'));

final page3 = Page(
    'page3',
    'assets/images/page3.png',
    "Your EVA suit is equipped with a headlamp, which you use to navigate the cave. After searching for a while your oxygen levels are starting to get pretty low. You know you should go refill your tank, but there\'s a very faint light up ahead.",
    Choice('Refill at ship and explore the rover', 'page4'),
    Choice('Continue towards the faint light', 'page5'));

final page4 = Page(
    'page4',
    'assets/images/page4.png',
    "The rover is covered in dust and most of the solar panels are broken. But you are quite surprised to see the on-board system booted up and running. In fact, there is a message on the screen: \"%1{}, come to 28.543436, -81.369031.\" Those coordinates aren\'t far, but you don\'t know if your oxygen will last for a trip there and back.",
    Choice('Explore the coordinates', 'page5'),
    Choice('Return to Earth', 'page6'));

final page5 = Page(
    'page5',
    'assets/images/page5.png',
    "After a long walk slightly uphill, you end up at the top of a small crater. You look around, and are overjoyed to see your favorite android, %1{}-S1124. It had been lost on a previous mission to Mars! You take it back to your ship and fly back to Earth.",
    null,
    Choice('Play Again', 'page0'));

final page6 = Page(
    'page6',
    'assets/images/page6.png',
    "You arrive home on Earth. While your mission was a success, you forever wonder what was sending that signal. Perhaps a future mission will be able to investigate…",
    null,
    Choice('Play Again', 'page0'));

final pages = [page0, page1, page2, page3, page4, page5, page6];
