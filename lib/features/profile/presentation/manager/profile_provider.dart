import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/profile/presentation/manager/profile_state.dart';

class ProfileProvider extends CustomProvider {
  var state = ProfileState();
  final storageRef = getIt.get<FirebaseStorage>();
  final firebase = getIt.get<FirebaseAuth>();

  setName({required String name}) {
    state.name = name;
    notifyListeners();
  }

  updateProfile() async {
    onLoad();
    final imageBucket =
        storageRef.ref().child('user_images').child('${user!.uid}.jpg');
    Logger().i(imageBucket);

    await imageBucket.putFile(state.profileImage!);
    final userImage = await imageBucket.getDownloadURL();
    Logger().i(userImage);

    await firebase.currentUser!
        .updateProfile(displayName: state.name, photoURL: userImage);

    user = firebase.currentUser;
    Logger().i(user);
    
    add(1);
    onLoad();
    notifyListeners();

  }
}
