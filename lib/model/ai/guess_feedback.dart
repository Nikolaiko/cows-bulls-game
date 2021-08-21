class GuessFeedback {
  final int cows;
  final int bulls;

  GuessFeedback(
    this.bulls,
    this.cows
  );

  @override
  int get hashCode {
    return cows.hashCode + bulls.hashCode;
  }

  bool operator == (Object object) {
    if (object is GuessFeedback) {
      return object.bulls == bulls && object.cows == cows;
    } else {
      return false;
    }
  }
}