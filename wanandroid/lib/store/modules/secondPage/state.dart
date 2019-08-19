class SecondPageState {
  int counter;
  SecondPageState({this.counter: 0});

  factory SecondPageState.initial() {
    return new SecondPageState(counter: 0);
  }
}
