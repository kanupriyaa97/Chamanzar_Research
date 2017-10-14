# I found thisblaaaaaaaa   
% display one channel only
clear all;

im=imread('images/DSC1228L_512.jpg');
im_red = im;
im_green = im;
im_blue = im;

% Red channel only
im_red(:,:,2) = 0; 
im_red(:,:,3) = 0; 
figure, imshow(im_red);

% Green channel only
im_green(:,:,1) = 0; 
im_green(:,:,3) = 0; 
figure, imshow(im_green);

% Blue channel only
im_blue(:,:,1) = 0; 
im_blue(:,:,2) = 0; 
figure, imshow(im_blue);
#dont delete this im gonna put it in another file and keep for record
    def removeColour():
        img =  vdfrm.convert('RGB') #Opens up image file "test.pNg" and converTs to RGB 
        source = img.split() #splits into three distinct channels R B G
        R, G, B = 0, 1, 2 #assignsValues to each channel
        out = source[R].point(lambda i: i * 0) 
        source[R].paste(out, None, None)#these two lines remove red
        img = Image.merge(img.mode, source) #combines 3 back to 1
        img.save('testNoRed.png') #saves modified file as pNg image
        img.show() #displays image
        