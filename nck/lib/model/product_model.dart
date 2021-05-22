class GoogleProducts {
  final String title;
  final String price;
  List<String> image;

  GoogleProducts(
    this.title,
    this.price,
    this.image,
  );
  static List<GoogleProducts> productItems() => [
        GoogleProducts("Google Home", "129", [
          "assets/g_home.PNG",
          "assets/g_home.PNG",
          "assets/g_home.PNG",
        ]),
        GoogleProducts("Google Clips", "249", [
          "assets/g_clip.PNG",
          "assets/g_clip.PNG",
          "assets/g_clip.PNG",
        ]),
        GoogleProducts("Next protect", "119", [
          "assets/g_cam.PNG",
          "assets/g_cam.PNG",
          "assets/g_cam.PNG",
        ]),
        GoogleProducts("Google Daydream", "99", [
          "assets/g_day.PNG",
          "assets/g_day.PNG",
          "assets/g_day.PNG",
        ]),

         GoogleProducts("Google Home", "129", [
          "assets/g_home.PNG",
          "assets/g_home.PNG",
          "assets/g_home.PNG",
        ]),
        GoogleProducts("Google Clips", "249", [
          "assets/g_clip.PNG",
          "assets/g_clip.PNG",
          "assets/g_clip.PNG",
        ]),
        GoogleProducts("Next protect", "119", [
          "assets/g_cam.PNG",
          "assets/g_cam.PNG",
          "assets/g_cam.PNG",
        ]),
        GoogleProducts("Google Daydream", "99", [
          "assets/g_day.PNG",
          "assets/g_day.PNG",
          "assets/g_day.PNG",
        ]),
      ];
}
