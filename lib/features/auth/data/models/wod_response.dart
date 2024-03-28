
class WodResponse {
    final int id;
    final String title;
    final String subtitle;
    final String description;
    final String image;

    WodResponse({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.description,
        required this.image,
    });

    factory WodResponse.fromJson(Map<String, dynamic> json) => WodResponse(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "image": image,
    };
}
