// To parse this JSON data, do
//
//     final NewsModel = NewsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  final String? status;
  final int? totalNews;
  final List<News>? news;
  final dynamic nextPage;

  NewsModel({
    this.status,
    this.totalNews,
    this.news,
    this.nextPage,
  });

  NewsModel copyWith({
    String? status,
    int? totalNews,
    List<News>? news,
    dynamic nextPage,
  }) =>
      NewsModel(
        status: status ?? this.status,
        totalNews: totalNews ?? this.totalNews,
        news: news ?? this.news,
        nextPage: nextPage ?? this.nextPage,
      );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalNews: json["totalResults"],
        news: json["results"] == null
            ? []
            : List<News>.from(json["results"]!.map((x) => News.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalNews,
        "results": news == null
            ? []
            : List<dynamic>.from(news!.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class News {
  final String? articleId;
  final String? title;
  final String? link;
  final dynamic keywords;
  final List<String>? creator;
  final dynamic videoUrl;
  final String? description;
  final String? content;
  final DateTime? pubDate;
  final String? pubDateTz;
  final String? imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final String? sourceName;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? language;
  final List<String>? country;
  final List<String>? category;
  final String? aiTag;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiRegion;
  final String? aiOrg;
  final bool? duplicate;

  News({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.pubDateTz,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceName,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
    this.duplicate,
  });

  News copyWith({
    String? articleId,
    String? title,
    String? link,
    dynamic keywords,
    List<String>? creator,
    dynamic videoUrl,
    String? description,
    String? content,
    DateTime? pubDate,
    String? pubDateTz,
    String? imageUrl,
    String? sourceId,
    int? sourcePriority,
    String? sourceName,
    String? sourceUrl,
    String? sourceIcon,
    String? language,
    List<String>? country,
    List<String>? category,
    String? aiTag,
    String? sentiment,
    String? sentimentStats,
    String? aiRegion,
    String? aiOrg,
    bool? duplicate,
  }) =>
      News(
        articleId: articleId ?? this.articleId,
        title: title ?? this.title,
        link: link ?? this.link,
        keywords: keywords ?? this.keywords,
        creator: creator ?? this.creator,
        videoUrl: videoUrl ?? this.videoUrl,
        description: description ?? this.description,
        content: content ?? this.content,
        pubDate: pubDate ?? this.pubDate,
        pubDateTz: pubDateTz ?? this.pubDateTz,
        imageUrl: imageUrl ?? this.imageUrl,
        sourceId: sourceId ?? this.sourceId,
        sourcePriority: sourcePriority ?? this.sourcePriority,
        sourceName: sourceName ?? this.sourceName,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        sourceIcon: sourceIcon ?? this.sourceIcon,
        language: language ?? this.language,
        country: country ?? this.country,
        category: category ?? this.category,
        aiTag: aiTag ?? this.aiTag,
        sentiment: sentiment ?? this.sentiment,
        sentimentStats: sentimentStats ?? this.sentimentStats,
        aiRegion: aiRegion ?? this.aiRegion,
        aiOrg: aiOrg ?? this.aiOrg,
        duplicate: duplicate ?? this.duplicate,
      );

  factory News.fromJson(Map<String, dynamic> json) => News(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"],
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate:
            json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        pubDateTz: json["pubDateTZ"],
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        sourceName: json["source_name"],
        sourceUrl: json["source_url"],
        sourceIcon: json["source_icon"],
        language: json["language"],
        country: json["country"] == null
            ? []
            : List<String>.from(json["country"]!.map((x) => x)),
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        aiTag: json["ai_tag"],
        sentiment: json["sentiment"],
        sentimentStats: json["sentiment_stats"],
        aiRegion: json["ai_region"],
        aiOrg: json["ai_org"],
        duplicate: json["duplicate"],
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "keywords": keywords,
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate?.toIso8601String(),
        "pubDateTZ": pubDateTz,
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        "source_name": sourceName,
        "source_url": sourceUrl,
        "source_icon": sourceIcon,
        "language": language,
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "ai_tag": aiTag,
        "sentiment": sentiment,
        "sentiment_stats": sentimentStats,
        "ai_region": aiRegion,
        "ai_org": aiOrg,
        "duplicate": duplicate,
      };
}
