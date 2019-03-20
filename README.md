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
| Method Name | Return type | Notes |
| ---- | :-----: |:-------: |
| turnLightOn |  | trun light on |
| turnLightOff |  | turn light off |
| toggle |  |toggle light |
| isLightActive | Boolean | if light is active |

### Events
| Event Name | Returns | Notes |
| ---- | :-----: |:-------: |
| onLightTurnedOn |  | Callback that is called once the light turned on. |
| onLightTurnedOff |  | Callback that is called once the light turned off. |

### Example
```js
import React, { Component } from 'react';
import { StyleSheet, Button, View } from 'react-native';
import { turnLightOn, turnLightOff, toggle, isLightActive, lightEventEmitter } from "react-native-light";

export default class App extends Component {  

  async showState() {
    const state = await isLightActive();
    alert(state);
  }

  componentDidMount() {
    lightEventEmitter.addListener('onLightTurnedOn', () => {
      alert('you just turned on the light')
    });
    lightEventEmitter.addListener('onLightTurnedOff', () => {
      alert('you just turned off the light')
    });
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.buttons}>
          <Button title='on' onPress={() => turnLightOn()} />
          <Button title='off' onPress={() => turnLightOff()} />
          <Button title='toggle' onPress={() => toggle()} />
          <Button title='state' onPress={() => this.showState()} />
        </View>
      </View>
      );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  buttons: {
    justifyContent: 'space-between',
    alignItems: 'center',
    height: 200
  }
});
```

