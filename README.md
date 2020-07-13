# rotating_widgets
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)
[![pub](https://img.shields.io/badge/pub-1.2.0-brightgreen)](https://pub.dev/packages/rotating_widgets)

A simple widget which allows widgets to be turned into rotate-able widgets


## Example App

<p>
  <img width="150px" alt="Example gif" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/example-1.gif"/>
</p>

<br>
<br>

### Screenshots

<p>
  <img width="100px" alt="X Active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/X%20Enabled.png"/>
  <img width="100px" alt="Y active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/Y%20Enabled.png"/>
  <img width="100px" alt="Z active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/Z%20Enabled.png" />
</p>

<p>
  <img width="200px" alt="XY Auto-Rotate" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/Auto-Rotate%20Z.png"/>
</p>



## Custom Usage
There are several options that allow for more control:

|  Properties  | Type |   Description   | Default Value | Required |
|--------------|-----------------|-----------------|-----------------|
| `child` | ```Widget``` | This is the widget which needs to be made rotate-able | ```null``` | ```true``` |
| `rotateX` | ```boolean``` | ```true``` if widget is allowed to rotate along X-Axis | ```true``` | ```false``` |
| `rotateY` | ```boolean``` | ```true``` if widget is allowed to rotate along Y-Axis | ```true``` | ```false``` |
| `rotateZ` | ```boolean``` | ```true``` if widget is allowed to rotate along Z-Axis. Note: This allows circular rotation on 2D plane | ```false``` | ```false``` |
| `angleRadianX` | ```double``` | The angle by which widget turns across X-Axis, per unit `Offset` along that axis and if `autoplay` is false, or per unit `duration` is autoplay is true | ```0.01``` | ```false``` |
| `angleRadianY` | ```double``` | The angle by which widget turns across X-Axis, per unit `Offset` along that axis and if `autoplay` is false, or per unit `duration` is autoplay is true | ```0.01``` | ```false``` |
| `angleRadianZ` | ```double``` | The angle by which widget turns across X-Axis, per unit `Offset` along that axis and if `autoplay` is false, or per unit `duration` is autoplay is true | ```0.01``` | ```false``` |
| `autoplay` | ```boolean``` | Checks whether widget should rotate automatically or not | ```false``` | ```false``` |
| `duration` | ```dart Duration``` | The duration between which said `child` rotates around individual axis by said angle | ```dart Duration(seconds: 1)``` | ```false``` |

<br>
<br>

> This package can convert any widget into a rotate-able widget including scaffold