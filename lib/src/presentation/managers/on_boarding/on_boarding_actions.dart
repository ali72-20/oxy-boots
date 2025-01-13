sealed class OnBoardingActions {}
class NavigateToLoginAction extends OnBoardingActions {}
class LastPageAction extends OnBoardingActions {
  final int? index;
  LastPageAction({this.index});
}
