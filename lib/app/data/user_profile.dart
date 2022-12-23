// below data models for user`s profiles purposes :: if required

class UserData {
  final String? userId;
  final String? name;
  final String? email;

  UserData({
    this.userId,
    this.name,
    this.email,
  });
}

class UserFirebase {
  late String? userId;
  late String? name;
  late String? email;

  UserFirebase();

  void updateUserData(String userId, String name, String email) {
    this.userId = userId;
    this.name = name;
    this.email = email;
  }

  void clearUserData() {
    userId = null;
    name = null;
    email = null;
  }
}


  // example: snapshot.data UserData firebase
  //
  // User(
  //   displayName: ,
  //   email: bije519@pakis.com,
  //   emailVerified: false,
  //   isAnonymous: false,
  //   metadata: UserMetadata(
  //               creationTime: 2022-10-09 10:50:04.509Z,
  //               lastSignInTime: 2022-10-19 19:01:02.660Z
  //             ),
  //    phoneNumber: ,
  //    photoURL: null,
  //    providerData,
  //    [
  //     UserInfo(
  //       displayName: ,
  //       email: bije519@pakis.com,
  //       phoneNumber: ,
  //       photoURL: null,
  //       providerId: password,
  //       uid: bije519@pakis.com
  //     )
  //   ],
  //   refreshToken: ,
  //   tenantId: null,
  //   uid: P2DK07ziWqOwZSxr7yO2lTRfwtp1
  // )

  // User(
  //   displayName: ,
  //   email: chiep519@pakis.com,
  //   emailVerified: false,
  //   isAnonymous: false,
  //   metadata: UserMetadata(
  //               creationTime: 2022-10-09 10:54:17.570Z,
  //               lastSignInTime: 2022-10-20 14:40:23.258Z
  //             ),
  //    phoneNumber: ,
  //    photoURL: null,
  //    providerData,
  //    [
  //     UserInfo(
  //       displayName: ,
  //       email: chiep519@pakis.com,
  //       phoneNumber: ,
  //       photoURL: null,
  //       providerId: password,
  //       uid: chiep519@pakis.com
  //     )
  //   ],
  //   refreshToken: ,
  //   tenantId: null,
  //   uid: NxSEiz7EqmNQMEoJepcZwolC3vR2
  // )

