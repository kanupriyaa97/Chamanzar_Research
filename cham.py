import image
import matlab.engine
eng = matlab.engine.start_matlab()

def main():
    # Create the webcam object. 
    cam = webcam(1)

    # Capture one frame to get its size.
    #vdfrm = snapshot(cam)

    # Create the video player object.
    #videoPlayer = vision.VideoPlayer('Position', [100, 100 [frameSize(2), frameSize(1)]+30])

    #runLoop = true

    while (True):
        # Get the next frame.
        imdata = snapshot(cam)
                #imdata = imread(vdfrm);
        imdata(:,:,1) = 0;
                #image(imdata);
        imshow(imdata)
        # Display the annotated video frame using the video player object.
        #step(videoPlayer, imdata)

        # Check whether the video player window has been closed.
        #runLoop = isOpen(videoPlayer)

    # Clean up.
    clear(cam)
    #release(videoPlayer)