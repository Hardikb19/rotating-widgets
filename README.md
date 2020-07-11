# rotating_widgets
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

A simple widget which allows widgets to be turned into rotate-able widgets

Note: This widget doesn't allow automatic rotation as of yet

<p>
  <img width="205px" alt="X Y Active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/flutter_01.png"/>
  <img width="220px" alt="Y active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/flutter_05.png"/>
  <img width="220px" alt="X active" src="https://raw.githubusercontent.com/hardikb19/rotating-widgets/master/example/screenshots/flutter_07.png" />
</p>


## Custom Usage
There are several options that allow for more control:

|  Properties  | Type |   Description   |
|--------------|-----------------|-----------------|
| `child` | `Widget` | This is the widget which needs to be made rotate-able |
| `rotateX` | `boolean` | `true` if widget is allowed to rotate along X-Axis |
| `rotateY` | `boolean` | `true` if widget is allowed to rotate along Y-Axis |
| `rotateZ` | `boolean` | `true` if widget is allowed to rotate along Z-Axis. Note: This allows circular rotation on 2D plane |
| `angleRadian` | `double` | Specify the angle by which rotation is calculated |

<br>
<br>