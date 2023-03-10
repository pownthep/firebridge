import 'package:firebridge/src/bridge_generated.dart';

/// Represents the external library for firebridge
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

Firebridge createWrapperImpl(ExternalLibrary lib) => throw UnimplementedError();

Object createLibraryImpl() => throw UnimplementedError();
