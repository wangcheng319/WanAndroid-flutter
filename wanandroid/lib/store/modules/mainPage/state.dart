class MainPageState {
  int counter;
  MainPageState({this.counter: 0});

  factory MainPageState.initial() {
    return new MainPageState(counter: 0);
  }
}
