# react-native-light

React Native module for mobile flashlight. 

## Install

```shell
yarn add react-native-light
react-native link react-native-light
```

## Usage

### Methods
| Prop | Description |
| ---- | :------: |
| turnLightOn | trun light on |
| turnLightOff | turn light off |
| toggle | toggle light |
| isLightActive | check if light is active |

```js
import { turnLightOn, turnLightOff, toggle } from "react-native-light";

<Button title='on' onPress={() => turnLightOn()} />
<Button title='off' onPress={() => turnLightOff()} />
<Button title='toggle' onPress={() => toggle()} />
```

