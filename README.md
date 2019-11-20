# empyr-bridge

## Getting started

`$ npm install empyr-bridge --save`

### Mostly automatic installation

`$ react-native link empyr-bridge`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `empyr-bridge` and add `EmpyrBridge.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libEmpyrBridge.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.empyr.react.EmpyrBridgePackage;` to the imports at the top of the file
  - Add `new EmpyrBridgePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':empyr-bridge'
  	project(':empyr-bridge').projectDir = new File(rootProject.projectDir, 	'../node_modules/empyr-bridge/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':empyr-bridge')
  	```


## Usage
```javascript
import EmpyrBridge from 'empyr-bridge';

// TODO: What to do with the module?
EmpyrBridge;
```
