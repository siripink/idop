# IDOP

IDOP Flutter application.

### Android Release

To bump the app release version

```sh
$ cd android
$ bundle exec fastlane bump_version
```

To build APK or AAB, run the following

```sh
$ cd .. // to the main flutter folder
$ flutter build apk
Or, to build AAB, run the following
$ flutter build appbundle
```

The release bundle for your app is created at 
<app dir>/build/app/outputs/bundle/release/app.aab
("flutter build" command is default to --release)

To release
```sh
$ cd android
$ bundle exec fastlane deploy_alpha
```

### iOS Release

Run this command to create a release iPA build before going into /ios folder

```sh
$ flutter build ios
```

To release

```sh
$ bundle exec fastlane idop_release is_bump_version:true
or
$ bundle exec fastlane idop_release is_bump_version:false build_number:02
```
