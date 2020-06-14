class Message {
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool response;

  Message({
    this.time,
    this.text,
    this.response
  });
}