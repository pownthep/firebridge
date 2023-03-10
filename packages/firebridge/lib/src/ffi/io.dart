import 'dart:ffi';
import 'dart:io';
import 'package:firebridge/src/bridge_generated.dart';

DynamicLibrary createLibraryImpl() {
  const base = 'firebridge';

  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.executable();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}

typedef ExternalLibrary = DynamicLibrary;

Firebridge createWrapperImpl(ExternalLibrary dylib) => FirebridgeImpl(dylib);
