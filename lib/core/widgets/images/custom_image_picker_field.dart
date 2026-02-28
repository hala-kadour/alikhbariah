import 'package:alikhbariah/config/scales/gap.dart';
import 'package:flutter/material.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';

class CustomImagePickerField extends StatelessWidget {
  final String formControlName;
  final String label;

  const CustomImagePickerField({
    super.key,
    required this.formControlName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFilePicker<PlatformFile>(
      formControlName: formControlName,
      type: FileType.image,
      withData: true,
      filePickerBuilder: (pickImage, files, onChange) {
        final PlatformFile? file = files.platformFiles.firstOrNull;
        return Column(
          children: [
            InkWell(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: file?.bytes != null
                    ? MemoryImage(file!.bytes!)
                    : null,
                child: file == null
                    ? const Icon(Icons.camera_alt, size: 30)
                    : null,
              ),
            ),
            Gap.h8,
            Text(label),
            if (file != null)
              TextButton(
                onPressed: () {
                  onChange(files.copyWith(platformFiles: []));
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
