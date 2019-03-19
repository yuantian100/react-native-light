# react-native-light

React Native module for mobile flashlight. 

## Install

```shell
yarn add react-native-light
react-native link react-native-light
```

## Usage

### Methods
| Method Name | Return type | Description |
| ---- | :-----: |:-------: |
| turnLightOn |  | trun light on |
| turnLightOff |  | turn light off |
| toggle |  |toggle light |
| isLightActive | Boolean | if light is active |

```js
import { turnLightOn, turnLightOff, toggle } from "react-native-light";

<Button title='on' onPress={() => turnLightOn()} />
<Button title='off' onPress={() => turnLightOff()} />
<Button title='toggle' onPress={() => toggle()} />
```

