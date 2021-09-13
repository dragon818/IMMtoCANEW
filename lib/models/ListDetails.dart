class ListDetails {
  String name;
  String nameInOtherLanguage;
  String applicationURL;
  String introduction;
  String processTime;
  String imgURL;
  String guideURL;
  List<String> documentLists;
  List<String> eligibility;

  String cost;

  ListDetails(
    this.name,
    this.nameInOtherLanguage,
    this.applicationURL,
    this.introduction,
    this.processTime,
    this.imgURL,
    this.guideURL,
    this.documentLists,
    this.eligibility,
    this.cost,
  );

  factory ListDetails.fromRTDB(Map<String, dynamic> data) {
    final docs = List<String>.from(data['documentLists']);
    final eligibility = List<String>.from(data['eligibility']);
    return ListDetails(
      data['name'],
      data['nameInOtherLanguage'],
      data['applicationURL'],
      data['introduction'],
      data['processTime'],
      data['imgURL'],
      data['guideURL'],
      docs,
      eligibility,
      data['cost'],
    );
  }
}
