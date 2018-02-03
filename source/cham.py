import matlab.engine
eng = matlab.engine.start_matlab()


#Does the entire loop
def main():
    # Create the webcam object.
    cam = webcam()

    # Capture one frame to get its size.
    videoFrame = snapshot(cam)
    frameSize = size(videoFrame)

    # Create the video player object.
    videoPlayer = vision.VideoPlayer('Position', [100, 100 [frameSize(2), frameSize(1)]+30])

    runLoop = true

    while (runLoop):
        # Get the next frame.
        videoFrame = snapshot(cam)

        imdata = imread(videoFrame)

        for i in range(len(imdata)):
            for j in range(len(imdata[0])):
                rgb = imdata[i][j]
                rgb[0] = 0
                imdata[i][j] = rgb

        # Display the annotated video frame using the video player object.
        step(videoPlayer, imdata)

        # Check whether the video player window has been closed.
        runLoop = isOpen(videoPlayer)

    # Clean up.
    clear(cam)
    release(videoPlayer)