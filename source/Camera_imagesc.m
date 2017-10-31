close all
clear all
clc


vid = webcam('Lenovo EasyCamera');%videoinput('winvideo', 1, 'YUY2_1280x720'); %use the image acquisition tool (in the "APPS" ribbon) to identify your camera. 
%set(vid,'FramesPerTrigger',Inf);
%set(vid,'ReturnedColorspace','rgb');
%vid.FrameGrabInterval=1; %extract image each x ms
%start(vid);



k=[];
set(gcf,'keypress','k=get(gcf,''currentchar'');');
while 1
    data=snapshot(vid);
    imagesc(data(:,:,1))

  if ~isempty(k)
    if strcmp(k,'s'); 
        colorbar
        break; end; % the s key save the current frame (using natural colors, not the scaled colors)
    if strcmp(k,'p'); disp('p');pause; k=[]; end; %the p key freeze the image
  end
end
str=datestr(now,30);

imwrite(data, strcat('D:\',str,'.png'));


stop(vid)
flushdata(vid);