class UserJobPostsModel {
  final bool isExpired;
  final String postId;
  final DateTime createdAt;

  UserJobPostsModel({
    required this.postId,
    required this.isExpired,
    required this.createdAt,
  });

  Map<String, dynamic> toFirestore() => {
        createdAt.toString(): {
          "postId": postId,
          "isExpired": isExpired,
        }
      };
}
