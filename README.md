# react-native-light

[![npm version](https://badge.fury.io/js/react-native-light.svg)](http://badge.fury.io/js/react-native-light)

React Native module for mobile flashlight. (IOS / ANDROID)

## Installation

Using yarn:

```shell
yarn add react-native-light
```

or using npm:

```shell
npm install --save react-native-light
```

## Linking

```shell
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

### Example
```js
import { turnLightOn, turnLightOff, toggle, isLightActive } from "react-native-light";

  async checkState() {
    const state = await isLightActive();
    this.setState({
      light: state
    });
  }

<Button title='on' onPress={() => turnLightOn()} />
<Button title='off' onPress={() => turnLightOff()} />
<Button title='toggle' onPress={() => toggle()} />
<Button title='state' onPress={() => this.checkState()} />
```

