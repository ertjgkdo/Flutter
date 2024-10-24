// package exports
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

const storage = FlutterSecureStorage(wOptions: WindowsOptions.defaultOptions);
