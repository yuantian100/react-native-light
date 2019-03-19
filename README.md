# react-native-light

React Native module for mobile flashlight. 

## Install

```
yarn add react-native-light
react-native link react-native-light
```

## Usage

```js
import { turnLightOn, turnLightOff, toggle } from "react-native-light";

<Button title='on' onPress={() => turnLightOn()} />
<Button title='off' onPress={() => turnLightOff()} />
<Button title='toggle' onPress={() => toggle()} />
```

