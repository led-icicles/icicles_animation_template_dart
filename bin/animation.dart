// Import the icicles_animation_dart package
import 'package:icicles_animation_dart/icicles_animation_dart.dart';

void main() async {
  /// Defines the animation settings.
  final animation = Animation(
    // Name of the animation (UTF-8 encoded - may include Polish characters).
    'Police',
    // Number of icicles in the animation.
    xCount: 20,
    // Number of pixels/LEDs per icicle.
    yCount: 30,
    // Number of radio panels.
    radioPanelsCount: 2,
    // Resolution of each radio panel, specified as the number of pixels/LEDs.
    radioPanelPixelCount: 50,
    // Number of times the animation will loop.
    loopsCount: 10,
    // Maximum framerate for the animation.
    framerate: Framerate.fps30,
    // Defines the behavior when a frame is added with a framerate
    // higher than the supported limit.
    framerateBehavior: FramerateBehavior.error,
    // If set to true, reduces file size using RGB565 color encoding.
    useRgb565: false,
    // Optimizes the animation by removing redundant frames and using
    // the most size-efficient format available.
    optimize: true,
  );

  final icicles = Icicles(animation);

  /// Instead of the RGB color constructor, we can also
  /// use the Colors.red constant defined by this library.
  icicles.setAllPixelsColor(Color.fromRGB(255, 0, 0));

  /// Sets the radio panels color to red.
  icicles.setAllRadioPanelsColor(Colors.red);

  /// Display the current icicles state for 500 milliseconds
  icicles.show(Duration(milliseconds: 500));

  /// The same steps for the blue color
  icicles
    ..setAllPixelsColor(Colors.blue)
    ..setAllRadioPanelsColor(Colors.blue)
    ..show(Duration(milliseconds: 500));

  /// Thats all. Now we can save our animation
  /// under the provided path.
  ///
  /// The `.anim` extension is required by most controllers.
  await animation.toFile('./generated/police.anim');
}
