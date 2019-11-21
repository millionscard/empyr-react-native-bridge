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
