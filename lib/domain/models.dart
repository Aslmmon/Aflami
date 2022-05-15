class OnBoardingSlider {
  final String title;
  final String subtitle;
  final String icon;

  OnBoardingSlider(
      {required this.title, required this.subtitle, required this.icon});
}

class Customer {
  final String id;
  final int name;
  final int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}
