import 'bridge_generated.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

Firebridge createLib() => createWrapper(createLibraryImpl());

Firebridge? _wrapper;

Firebridge createWrapper(ExternalLibrary lib) {
  _wrapper ??= createWrapperImpl(lib);
  return _wrapper!;
}
