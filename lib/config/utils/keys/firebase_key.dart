class FirebaseUserKey {
  static String userCollection = 'users';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String userName = 'userName';
  static String nameOption = 'nameOption';
  static String updatedAt = 'updatedAt';
}

class FirebaseFollowKey {
  static String followCollection = 'follows';
  static String userId = 'userId';
  static String followId = 'followId';
  static String followUserId = 'followUserId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseChatKey {
  static String chatCollection = 'chats';
  static String chatId = 'chatId';
  static String usersId = 'usersId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseMessageKey {
  static String messageCollection = 'messages';
  static String messageId = 'messageId';
  static String sendUserId = 'sendUserId';
  static String chatId = 'chatId';
  static String text = 'text';
  static String imageUrl = 'imageUrl';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseNewsKey {
  static String newsCollection = 'news';
  static String newsId = 'newsId';
  static String newsTitle = 'newsTitle';
  static String newsMessage = 'newsMessage';
  static String readUserId = 'readUserId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseDraftNewsKey {
  static String draftNewsCollection = 'draftNews';
  static String draftNewsId = 'draftNewsId';
  static String newsTitle = 'newsTitle';
  static String draftNewsMessage = 'draftNewsMessage';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}
