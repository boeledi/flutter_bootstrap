# flutter_bootstrap

A partial implementation of Bootstrap Grid system in Flutter for Responsive Layout.

![](flutter_bootstrap.gif)


---
## Getting Started

Requires Flutter 3.47 or later and Dart 3.13 or later. This package and its
example use the official standalone `material_ui` library.

You should ensure that you add the following dependency in your Flutter project.

```yaml
dependencies:
 material_ui: ^1.11.0
 flutter_bootstrap: "^2.0.0"
```

Run `flutter pub get` to resolve dependencies.

In your Dart code, to use it:
```dart
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:material_ui/material_ui.dart';
```

When upgrading an existing application, replace imports of
`package:flutter/material.dart` with `package:material_ui/material_ui.dart`.
See the [official migration guide](https://docs.flutter.dev/release/breaking-changes/material-ui-and-cupertino-ui).

To validate this repository, run `flutter analyze` and `flutter test`. The tests
cover grid layout, responsive resizing, visibility, and the Material UI example
at mobile and desktop widths.
---
## Documentation

This package exposes 4 new **Widgets**:

* BootstrapContainer
* BootstrapRow
* BootstrapCol
* BootstrapVisibility

...and a series of **helper** methods:

* bootstrapGridParameters
* bootstrapPrefixBasedOnWidth
* bootstrapMaxWidthNonFluid
* bootStrapValueBasedOnSize

It implements the following Bootstrap4 features:

* .container
* .container-fluid
* .row
* .col-\*, .col-sm-\*, .col-md-\*, .col-lg-\*, .col-xl-\*
* .offset-\*, .offset-sm-\*, .offset-md-\*, .offset-lg-\*, .offset-xl-\*
* .order-\*, .order-sm-\*, .order-md-\*, .order-lg-\*, .order-xl-\*
* conditional visibility based on device width and column definition

Full documentation and examples can be found <a href="https://www.didierboelens.com/2020/05/responsive-bootstrap-like-solution/" target="_blank">on my website</a>.

---
## Example

An example can be found in the `example` folder.  Check it out.
