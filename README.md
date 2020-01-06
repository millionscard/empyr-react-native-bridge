## Install
[![npm version](https://badge.fury.io/js/empyr-react-native-bridge.svg)](https://badge.fury.io/js/empyr-react-native-bridge)

Install react native command line tools.

```
npm install -g react-native-cli
```

Create a sample application, skip this if you already have an application.

```
react-native init SampleApp --version react-native@0.59.10
```

Add the empyr-react-native-bridge from the npm registry.

```
yarn add empyr-react-native-bridge
```

If using react native < 0.60, you will have to link dependencies.

```
react-native link
```

If using react native >= 0.60, you will have to run pod install.

```bash
cd SampleApp/ios
pod install
```

Since our module uses swift you need to have at least one swift file and bridging header in your main xcode project.  This answer on stack overflow has some screenshots how to do it.

https://stackoverflow.com/a/56187043

This is also vaguely documented at the bottom of the react native docs, so facebook is aware of the issue but hasn't got around to fixing it yet.

https://facebook.github.io/react-native/docs/native-modules-ios

## Integrate

First the EmpyrBridge should be initialized in your componentDidMount method.

```js
  componentDidMount(){
    NativeModules.EmpyrBridge.initialize("23d5f04e-424b-4751-b862-94cae1787c74")
  }
```

Next update your javascript code to call the EmpyrBridge track method with the offerId and type of impression.  The offerId would be the offer that is being viewed by the user and IS NOT the business id but the actual offer id.  For any given business if there is more than one offer then this would result in more than one call to the callEmpyrTracker method

Note that the tracker does not make a call over network for each time it is called, but rather collects, coalates and makes network calls only periodically to reduce the load on your network.

Type of impression can be of two choices: "PROFILE_VIEW" or "SEARCH_VIEW"
```js
  trackProfileView = () => {
    NativeModules.EmpyrBridge.track(1111,"PROFILE_VIEW")
  }
```

## Example

A very simple example can be found in the sample directory.

[App.js](sample/App.js)
```js
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button, NativeModules} from 'react-native';

type Props = {};
export default class App extends Component<Props> {
  state = {
    count: 0
  }

  componentDidMount(){
    NativeModules.EmpyrBridge.initialize("23d5f04e-424b-4751-b862-94cae1787c74")
  }

  trackProfileView = () => {
    NativeModules.EmpyrBridge.track(1111,"PROFILE_VIEW")
  }

  trackSearchView = () => {
    NativeModules.EmpyrBridge.track(1111,"SEARCH_VIEW")
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Sample App for Empyr Bridge</Text>
        <Button
          onPress={this.trackProfileView}
          title="Track - profile view"
          color="#FF6347" />
        <Button
          onPress={this.trackSearchView}
          title="Track - search view"
          color="#FF6347" />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
```

### Running on IOS

You can now run the application in the ios simulator.

```
react-native run-ios
```

The sample app has two buttons to test the tracking functionality.

![ios-screenshot](docs/ios-screenshot.png?raw=true "ios screenshot")

## Running on Android

Before you can build android, you will need to specify the location of the android sdk.

```
export ANDROID_HOME=~/Library/Android/sdk
```

You are now ready to run the android application.   You will have to connect an android device or start the android emulator from android studio for this to work.

```
react-native run-android
```

![android-screenshot](docs/android-screenshot.png?raw=true "Android screenshot")
