import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  print('Current Directory: $dir'); // Print the current directory

  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }

  var filePath = '$dir/test/$name';
  print('File Path: $filePath'); // Print the file path

  return File(filePath).readAsStringSync();
}
