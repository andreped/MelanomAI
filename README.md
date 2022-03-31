# melanom.ai
Mobile app for Android and iOS for real-time, automatic melanoma detection and classification using a mobile camera.

## ToDo
* [x] Setup App development environment (ended up using Android Studio and Flutter for cross-platform dev)
* [x] Setup access to mobile camera
* [x] Get access to pretrained image classification model in tf-lite format
* [x] Setup app for running image classification on-the-fly when streaming images with the camera
* [x] Add FPS counter
* [x] Setup APK build
* [x] Build APK on the cloud using GitHub Actions (CI)
* [x] Test built APK (in debug mode) on new Android device (works!)
* [ ] Bug: memory leak - something fails to be destroyed for each image during inference
* [ ] Bug: app does not gracefully exit
* [ ] Try to improve inference speed (currently, FPS: ~ 4.5)
* [ ] Add mole detection model/method
* [ ] Switch current MobileNetV1 model with melanoma classification model

## Credit
As I know fuck all about Flutter nor mobile app development, I have taken great inspiration from other open-source projects in the development of my app. These were:

* https://github.com/MCarlomagno/FlutterMobilenet
* https://github.com/kr1210/Flutter-Real-Time-Image-Classification
* https://github.com/jagrut-18/flutter_camera_app


