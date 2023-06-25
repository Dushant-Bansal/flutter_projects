import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? image;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/baby S.png', scale: 2),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: CircleAvatar(
                backgroundColor: Color(0xFF3E8B3A),
                child: Icon(Icons.arrow_back_outlined, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 3 / 4 - 10,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: image == null
                        ? ClipOval(
                            child: FutureBuilder<void>(
                              future: _initializeControllerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  // If the Future is complete, display the preview.
                                  return CameraPreview(_controller);
                                } else {
                                  // Otherwise, display a loading indicator.
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(File(image!.path)),
                          ),
                  ),
                  Text(
                    image == null ? 'Click your meal' : 'Will you eat this?',
                    style: const TextStyle(
                      color: Color(0xFF3C3C3C),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF3E8B3A),
                    radius: 32.0,
                    child: image == null
                        ? GestureDetector(
                            onTap: () async {
                              try {
                                await _initializeControllerFuture;
                                image = await _controller.takePicture();
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Thank you for sharing food with me',
                                    ),
                                  ),
                                );
                                setState(() {});
                              } catch (e) {
                                // If an error occurs, log the error to the console.
                                print(e);
                              }
                            },
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          )
                        : GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GoodJob(),
                              ),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GoodJob extends StatelessWidget {
  const GoodJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Good Job',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3E8B3A),
          ),
        ),
      ),
    );
  }
}
