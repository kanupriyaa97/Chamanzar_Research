close all;
clear all;
clc;

%setup 
cam = webcam('Microsoft® LifeCam HD-3000');
imnum = 0;
k=[];
set(gcf,'keypress','k=get(gcf,''currentchar'');');

%start of main loop
while 1
    data=snapshot(cam);
    imdata = data(:,:,1);
    imagesc(imdata);

  if ~isempty(k)
    %save picture
    if strcmp(k,'s')
        take_pic(imnum,imdata);
        imnum = imnum + 1;
    end
    %exit out of function
    if strcmp(k,'x')
        clear all;
        close all;
        stop(cam);
        flushdata(cam);
        k = [];
        clc;
    end
    %freeze video
    if strcmp(k,'f')
        k = []; 
        freeze(imdata,k); 
    end
  end
end

function freeze(imdata,k)
    while 1
        imagesc(imdata);
        disp(k);
        if ~isempty(k)
            if strcmp(k,'u')
                return;
            end
        end
    end
end

function take_pic(imnum, imdata)
    savepath = 'C:\';
    nametemplate = 'image_%04d.png';
    thisfile = sprintf(nametemplate, imnum);
    fullname = fullfile(savepath, thisfile);
    imwrite(imdata, fullname);
    return;
end
