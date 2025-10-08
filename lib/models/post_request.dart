class PostRequest {
  String title;
  String body;
  int userId;
  PostRequest(this.body, this.title, this.userId);
  toJson() {
    return {
      "title":title,
      "body":body,
      "userId":userId,
    };
  }
}
