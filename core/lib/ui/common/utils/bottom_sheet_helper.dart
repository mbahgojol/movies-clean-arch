import 'dart:io';

import 'package:core/di/injection.dart';
import 'package:core/ui/common/bloc/file_image/file_image_bloc.dart';
import 'package:core/ui/common/widgets/pick_image_source.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

mixin BottomSheetHelper {
  Future<File?> showImageSourceBottomSheet({
    required BuildContext context,
  }) async {
    return showModalBottomSheet<File?>(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => getIt<FileImageBloc>(),
        child: BlocListener<FileImageBloc, FileImageState>(
          listener: (context, state) {
            state.result.fold(
              () {},
              (a) => a.fold(
                (l) {
                  print(l);
                },
                (r) {
                  AutoRouter.of(context).pop(r);
                },
              ),
            );
          },
          child: const PickImageSource(),
        ),
      ),
    );
  }
}
