class Project {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String description;
  final String client;
  final String year;
  final String role;
  final String playStoreLink;
  final String appStoreLink;
  final String? youtubeVideoId;
  final String frontend;
  final String backend;
  final String database;
  final List<String> technologies;
  final List<String> photos;


  const Project({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.client,
    required this.year,
    required this.role,
    required this.playStoreLink,
    required this.appStoreLink,
    required this.frontend,
    this.youtubeVideoId,
    required this.backend,
    required this.database,
    required this.technologies,
    required this.photos,
  });
}
