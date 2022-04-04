import 'tensorflow-service.dart';
import 'package:camera/camera.dart';

// singleton class used as a service
class CameraService {
  // singleton boilerplate
  static final CameraService _cameraService = CameraService._internal();

  factory CameraService() {
    return _cameraService;
  }
  // singleton boilerplate
  CameraService._internal();

  TensorflowService _tensorflowService = TensorflowService();

  late CameraController _cameraController;
  CameraController? get cameraController => _cameraController;

  bool available = true;

  Future startService(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameraDescription,
      // Define the resolution to use.
      ResolutionPreset.high,
      // disable request of audio, which is not needed.
      enableAudio: false,
    );

    // Next, initialize the controller. This returns a Future.
    return _cameraController.initialize();
    // _initializeControllerFuture = _controller.initialize();

  }

  // @TODO: should there be a "void" here? and what about close? Are we properly destroying all objects?
  void dispose() async {
    _cameraController.dispose();
  }

  Future<void> startStreaming() async {
    _cameraController.startImageStream((img) async {
      try {
        if (available) {
          // Loads the model and recognizes frames
          available = false;
          await _tensorflowService.runModel(img);
          //await Future.delayed(Duration(seconds: 1));
          available = true;
        }
      } catch (e) {
        print('error running model with current frame');
        print(e);
      }
    });
  }

  Future stopImageStream() async {
    await this._cameraController.stopImageStream();
  }
}
