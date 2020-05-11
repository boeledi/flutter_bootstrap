# flutter_bootstrap

A partial implementation of Bootstrap Grid system in Flutter for Responsive Layout.

![](flutter_bootstrap.gif)
<br/><br/>

---
## Getting Started

You should ensure that you add the following dependency in your Flutter project.

```yaml
dependencies:
 flutter_bootstrap: "^1.0.0+1"
```

You should then run `flutter packages upgrade` or update your packages in IntelliJ.

In your Dart code, to use it:
```dart
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
```
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