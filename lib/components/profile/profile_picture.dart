import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_icon.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:provider/provider.dart';

class ProfilePicture extends StatefulWidget {
  final String profileUrl;

  ProfilePicture({@required this.profileUrl});

  @override
  _ProfilePictureState createState() => _ProfilePictureState(
        profileUrl: profileUrl,
      );
}

class _ProfilePictureState extends State<ProfilePicture> {
  String profileUrl;
  File _profileFile;
  bool imageLoading = false;

  _ProfilePictureState({@required this.profileUrl});

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 10,
          ),
          child: _profileFile == null
              ? Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(profileUrl),
                    ),
                  ),
                )
              : Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: FileImage(_profileFile)),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () async {
            imageLoading = true;
            File selected =
                await ImagePicker.pickImage(source: ImageSource.gallery);
            File cropped = await ImageCropper.cropImage(
              sourcePath: selected.path,
              cropStyle: CropStyle.circle,
              iosUiSettings: IOSUiSettings(
                aspectRatioLockEnabled: true,
                rotateButtonsHidden: true,
                resetButtonHidden: true,
                title: "Edit Profile Photo",
              ),
            );

            setState(() async {
              _profileFile = cropped ?? selected;
              Response response = await _userService.uploadImage(_profileFile);
              if (response.status == Status.FAILURE) {
                print(response.message); // TODO: Inform user of error
              }
            });
            imageLoading = false;
          },
          child: GradientIcon(
            icon: Icons.add_circle,
            size: 35,
          ),
        ),
      ],
    );
  }
}
