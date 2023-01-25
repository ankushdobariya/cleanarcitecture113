class NewsInfo {

  final String? url;
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime dateTime;

  const NewsInfo({
    this.url,
    this.title,
    this.author,
    this.imageURL,
    this.content,
    required this.dateTime,
  });
}
