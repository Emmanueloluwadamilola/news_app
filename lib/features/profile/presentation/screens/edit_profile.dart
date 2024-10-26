import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/custom_loading_widget.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/pop_widget.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/features/home/domain/util/util.dart';
import 'package:news_app/features/profile/presentation/manager/profile_provider.dart';
import 'package:news_app/features/profile/presentation/screens/widgets/profile_image.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  static const id = 'edit-profile';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? profileImage;
  final picker = ImagePicker();
  ProfileProvider? _provider;

  Future getImage(ImageSource source) async {
    var image = await picker.pickImage(source: source);
    setState(() {
      if (image != null) {
        _provider?.state.profileImage = File(image.path);
        Logger().i('>>>>>> ${_provider?.state.profileImage!.path}');
      }
    });
  }

  @override
  void initState() {
    _provider?.listen((event) {
      if (event == 1) {
        context.pop();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: ProfileProvider(),
        children: (provider, theme) {
          _provider ??= provider;
          final state = provider.state;
          final customLoader = LoadingOverlay.of(context);
          return [
            AppToolBar(
              title: 'Edit Profile',
              isPrefix: true,
            ),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(40),
                    Stack(clipBehavior: Clip.none, children: [
                      Clickable(
                          onPressed: () {
                            _imageDialog(context);
                          },
                          child: state.profileImage == null
                              ? ProfileImage(initials: initials)
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CustomImage(
                                    asset: '',
                                    file: state.profileImage,
                                    isFile: true,
                                    height: 140,
                                    width: 140,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: blueColor),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 28,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ]),
                    const Gap(20),
                    InputField(
                      onChange: (value) {
                        provider.setName(name: value);
                      },
                      inputFieldLabel: 'Full Name',
                      hint: '',
                      icon: Icons.person_outline,
                    ),
                    const Gap(60),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        onTap: () async {
                          customLoader.showLoader();
                          provider.updateProfile().whenComplete(() {
                            customLoader.hide();
                            context.pop();
                          });
                        },
                        title: 'Update Cahnges',
                        isDisabled:
                            state.name.isEmpty || state.profileImage == null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }

  _imageDialog(BuildContext context) {
    final theme = Theme.of(context);
    final dialog = Container(
      height: 150,
      width: MediaQuery.of(context).size.width * .5,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Text('Choose where to select image from',
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 16)),
            const Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.image,
                        color: blueColor,
                        size: 60,
                      ),
                      const Gap(5),
                      Text('Gallery',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                const Gap(40),
                InkWell(
                  onTap: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.camera_alt_rounded,
                        color: blueColor,
                        size: 60,
                      ),
                      const Gap(5),
                      Text(
                        'Camera',
                        style:
                            theme.textTheme.titleMedium?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            backgroundColor: theme.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: dialog,
          );
        });
  }
}
