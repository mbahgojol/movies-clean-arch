import 'package:core/ui/common/bloc/file_image/file_image_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PickImageSource extends StatelessWidget {
  const PickImageSource({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => AutoRouter.of(context).pop(false),
            icon: const Icon(Icons.close),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<FileImageBloc>()
                        .add(const FileImageEvent.pickFromCamera());
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.camera_alt_outlined),
                      Text(
                        'Camera',
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<FileImageBloc>()
                        .add(const FileImageEvent.pickFromGallery());
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.photo_library_outlined),
                      Text(
                        'Gallery',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
