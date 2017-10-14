function main()
    cam = webcam(1);
	  
    while 1
      
        % Get the next frame.
        imdata = snapshot(cam);
        
        % Strip of red component
		imdata(:,:,1) = 0;

        % Display the annotated video frame using the video player object.
        imshow(imdata);
    end
        
    % Clean up.
    clear(cam);
end
