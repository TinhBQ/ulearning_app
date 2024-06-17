class WelcomeStates {
  int page;
  WelcomeStates({required this.page});
}

class InitStates extends WelcomeStates {
  InitStates() : super(page: 0);
}
