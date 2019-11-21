## Instructions how to add the empyr to your react native application

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

Next link dependencies (not required if using react native >= 0.60)

```
react-native link
```

If using react native >= 0.60, you will have to run pod install.

```bash
cd SampleApp/ios
pod install
```

The empyr module uses swift, so you must have at least one swift file in your main application as specified in the react native documentation (you may skip this step if you already have one)

https://facebook.github.io/react-native/docs/native-modules-ios

1. Open the Xcode project for your application.
2. Select File/New/File...
3. Choose Swift file and click Next.
4. Name it however you want and create it.
5. Click accept to create Objective-C bridging header.

Next update your javascript code to call the EmpyrBridge track method with the offerId and type of impression.  The offerId would be the offer that is being viewed by the user and IS NOT the business id but the actual offer id.  For any given business if there is more than one offer then this would result in more than one call to the callEmpyrTracker method

Note that the tracker does not make a call over network for each time it is called, but rather collects, coalates and makes network calls only periodically to reduce the load on your network.

Type of impression can be of two choices: "PROFILE_VIEW" or "SEARCH_VIEW"

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

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

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
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>{instructions}</Text>
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

#### Instructions to run IOS

You can now run the application in the ios simulator.

```
react-native run-ios
```

The sample app has two buttons to test the tracking functionality.

![ios-screenshot](docs/ios-screenshot.png?raw=true "ios screenshot")

### Instructions to run Android

Before you can build android, you will need to specify the location of the android sdk.

```
export ANDROID_HOME=~/Library/Android/sdk
```

You are now ready to run the android application.   You will have to connect an android device or start the android emulator from android studio for this to work.

```
react-native run-android
```

![android-screenshot](docs/android-screenshot.png?raw=true "Android screenshot")
