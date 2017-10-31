
close all;
clear all;
imnum = 0;

cam = webcam('Lenovo EasyCamera');

k=[];
set(gcf,'keypress','k=get(gcf,''currentchar'');');

while 1
    imdata = snapshot(cam);
    imagesc(imdata(:,:,1));
    disp(~isempty(k));
    
    if ~isempty(k)
        if strcmp(k,'f')
            disp('f');
            freeze(imdata);
            k = [];
        end
        if strcmp(k,'x')
            disp('x');
            clear all;
            close all;
            return;
        end
        if strcmp(k,'s')
            take_pic(imnum,imdata);
            imnum = imnum + 1;
            k = [];
        end
    end
end





