enum SingleRepetitionDuration {
  minute(1),
  twoMinutes(2),
  treeMinutes(3),
  fourMinutes(4),
  fiveMinutes(5),
  tenMinutes(10),
  fifteenMinutes(15),
  twentyMinutes(20),
  twentyFiveMinutes(25),
  thirtyMinutes(30),
  fourtyFiveMinutes(45),
  oneHour(60),
  oneHourAndHalf(90),
  twoHours(120),
  twoHoursAndHalf(150),
  threeHours(180),
  fourHours(240),
  fiveHours(300),
  sixHours(360),
  sevenHours(420),
  eightHours(480),
  nineHours(540),
  tenHours(600),
  elevenHours(660),
  twelveHours(720),
  ;

  const SingleRepetitionDuration(this.minutes);

  final int minutes;

  static SingleRepetitionDuration durationFromMinutes(int minutes) {
    return values.firstWhere((element) => element.minutes == minutes);
  }

  int get indexInList => values.indexWhere((element) => element == this);
}
