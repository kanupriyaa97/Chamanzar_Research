import image
import matlab.engine
eng = matlab.engine.start_matlab()

def main():
    # Create the webcam object. 
    cam = webcam(1)

    while (True):
        # Get the next frame.
        imdata = snapshot(cam)

        # Strip red component.
        imdata(:,:,1) = 0

        # Output image to screen
        imshow(imdata)

    # Clean up.
    clear(cam)
    