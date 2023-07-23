extension DateTimeExt on DateTime {
  DateTime clearTime() => DateTime(year, month, day);

  String toDateShortString() {
    final day = this.day;
    final month = this.month;
    final year = this.year;
    return '$day.$month.$year';
  }
}
