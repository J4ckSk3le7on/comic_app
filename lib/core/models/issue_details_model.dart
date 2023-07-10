import 'dart:convert';

class IssueDetailsModel {
    String? error;
    int? limit;
    int? offset;
    int? numberOfPageResults;
    int? numberOfTotalResults;
    int? statusCode;
    Results? results;
    String? version;

    IssueDetailsModel({
        this.error,
        this.limit,
        this.offset,
        this.numberOfPageResults,
        this.numberOfTotalResults,
        this.statusCode,
        this.results,
        this.version,
    });

    factory IssueDetailsModel.fromRawJson(String str) => IssueDetailsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssueDetailsModel.fromJson(Map<String, dynamic> json) => IssueDetailsModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: json["results"] == null ? null : Results.fromJson(json["results"]),
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results?.toJson(),
        "version": version,
    };
}

class Results {
    dynamic aliases;
    String? apiDetailUrl;
    List<AssociatedImage>? associatedImages;
    List<Volume>? characterCredits;
    List<dynamic>? characterDiedIn;
    List<Volume>? conceptCredits;
    DateTime? coverDate;
    DateTime? dateAdded;
    DateTime? dateLastUpdated;
    dynamic deck;
    String? description;
    dynamic firstAppearanceCharacters;
    dynamic firstAppearanceConcepts;
    dynamic firstAppearanceLocations;
    dynamic firstAppearanceObjects;
    dynamic firstAppearanceStoryarcs;
    dynamic firstAppearanceTeams;
    bool? hasStaffReview;
    int? id;
    Image? image;
    String? issueNumber;
    List<Volume>? locationCredits;
    String? name;
    List<dynamic>? objectCredits;
    List<Volume>? personCredits;
    String? siteDetailUrl;
    dynamic storeDate;
    List<dynamic>? storyArcCredits;
    List<Volume>? teamCredits;
    List<dynamic>? teamDisbandedIn;
    Volume? volume;

    Results({
        this.aliases,
        this.apiDetailUrl,
        this.associatedImages,
        this.characterCredits,
        this.characterDiedIn,
        this.conceptCredits,
        this.coverDate,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.firstAppearanceCharacters,
        this.firstAppearanceConcepts,
        this.firstAppearanceLocations,
        this.firstAppearanceObjects,
        this.firstAppearanceStoryarcs,
        this.firstAppearanceTeams,
        this.hasStaffReview,
        this.id,
        this.image,
        this.issueNumber,
        this.locationCredits,
        this.name,
        this.objectCredits,
        this.personCredits,
        this.siteDetailUrl,
        this.storeDate,
        this.storyArcCredits,
        this.teamCredits,
        this.teamDisbandedIn,
        this.volume,
    });

    factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        associatedImages: json["associated_images"] == null ? [] : List<AssociatedImage>.from(json["associated_images"]!.map((x) => AssociatedImage.fromJson(x))),
        characterCredits: json["character_credits"] == null ? [] : List<Volume>.from(json["character_credits"]!.map((x) => Volume.fromJson(x))),
        characterDiedIn: json["character_died_in"] == null ? [] : List<dynamic>.from(json["character_died_in"]!.map((x) => x)),
        conceptCredits: json["concept_credits"] == null ? [] : List<Volume>.from(json["concept_credits"]!.map((x) => Volume.fromJson(x))),
        coverDate: json["cover_date"] == null ? null : DateTime.parse(json["cover_date"]),
        dateAdded: json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        dateLastUpdated: json["date_last_updated"] == null ? null : DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: json["location_credits"] == null ? [] : List<Volume>.from(json["location_credits"]!.map((x) => Volume.fromJson(x))),
        name: json["name"],
        objectCredits: json["object_credits"] == null ? [] : List<dynamic>.from(json["object_credits"]!.map((x) => x)),
        personCredits: json["person_credits"] == null ? [] : List<Volume>.from(json["person_credits"]!.map((x) => Volume.fromJson(x))),
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        storyArcCredits: json["story_arc_credits"] == null ? [] : List<dynamic>.from(json["story_arc_credits"]!.map((x) => x)),
        teamCredits: json["team_credits"] == null ? [] : List<Volume>.from(json["team_credits"]!.map((x) => x)),
        teamDisbandedIn: json["team_disbanded_in"] == null ? [] : List<dynamic>.from(json["team_disbanded_in"]!.map((x) => x)),
        volume: json["volume"] == null ? null : Volume.fromJson(json["volume"]),
    );

    Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "associated_images": associatedImages == null ? [] : List<dynamic>.from(associatedImages!.map((x) => x.toJson())),
        "character_credits": characterCredits == null ? [] : List<dynamic>.from(characterCredits!.map((x) => x.toJson())),
        "character_died_in": characterDiedIn == null ? [] : List<dynamic>.from(characterDiedIn!.map((x) => x)),
        "concept_credits": conceptCredits == null ? [] : List<dynamic>.from(conceptCredits!.map((x) => x.toJson())),
        "cover_date": "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image?.toJson(),
        "issue_number": issueNumber,
        "location_credits": locationCredits == null ? [] : List<dynamic>.from(locationCredits!.map((x) => x.toJson())),
        "name": name,
        "object_credits": objectCredits == null ? [] : List<dynamic>.from(objectCredits!.map((x) => x)),
        "person_credits": personCredits == null ? [] : List<dynamic>.from(personCredits!.map((x) => x.toJson())),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": storyArcCredits == null ? [] : List<dynamic>.from(storyArcCredits!.map((x) => x)),
        "team_credits": teamCredits == null ? [] : List<dynamic>.from(teamCredits!.map((x) => x)),
        "team_disbanded_in": teamDisbandedIn == null ? [] : List<dynamic>.from(teamDisbandedIn!.map((x) => x)),
        "volume": volume?.toJson(),
    };
}

class AssociatedImage {
    String? originalUrl;
    int? id;
    dynamic caption;
    String? imageTags;

    AssociatedImage({
        this.originalUrl,
        this.id,
        this.caption,
        this.imageTags,
    });

    factory AssociatedImage.fromRawJson(String str) => AssociatedImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AssociatedImage.fromJson(Map<String, dynamic> json) => AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: json["image_tags"],
    );

    Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTags,
    };
}

class Volume {
    String? apiDetailUrl;
    int? id;
    String? name;
    String? siteDetailUrl;
    String? role;

    Volume({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.siteDetailUrl,
        this.role,
    });

    factory Volume.fromRawJson(String str) => Volume.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role,
    };
}

class Image {
    String? iconUrl;
    String? mediumUrl;
    String? screenUrl;
    String? screenLargeUrl;
    String? smallUrl;
    String? superUrl;
    String? thumbUrl;
    String? tinyUrl;
    String? originalUrl;
    String? imageTags;

    Image({
        this.iconUrl,
        this.mediumUrl,
        this.screenUrl,
        this.screenLargeUrl,
        this.smallUrl,
        this.superUrl,
        this.thumbUrl,
        this.tinyUrl,
        this.originalUrl,
        this.imageTags,
    });

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
    );

    Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
    };
}
