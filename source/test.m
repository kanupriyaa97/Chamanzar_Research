close all
clear all
cam = webcam('Lenovo EasyCamera');

k=[];
set(gcf,'keypress','k=get(gcf,''currentchar'');');
while 1
    data=snapshot(cam);
    
    imdata = data(:,:,1);
    imagesc(imdata);

  if ~isempty(k)
    if strcmp(k,'s'); 
        colorbar
        break; 
    end; 
    if strcmp(k,'f'); 
        disp('f');
        k = [];
        freeze(imdata); 
    end;
  end
end


stop(cam)
flushdata(cam);

function freeze(imdata)
    m=[];
    set(gcf,'keypress','m=get(gcf,''currentchar'');');
    while 1
        imagesc(imdata);
        disp(m);
        if ~isempty(m)
            if strcmp(m,'u')
                return;
            end
        end
    end
end