function main()
    close all;
    clear all;
    imnum = 0;
    
    cam = webcam('Lenovo EasyCamera');
    k=[];
    set(gcf,'keypress','k=get(gcf,"current char");');
    
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
end


function freeze(imdata)
    m=[];
    set(gcf,'keypress','m=get(gcf,''current char'');');
    while 1
        imshow(imdata);
        if ~isempty(m)
            if strcmp(m,'u')
                return;
            end
        end
    end
end

function take_pic(imnum, imdata)

    savepath = 'C:\Users\Kanupriyaa\Desktop';
    nametemplate = 'image_%04d.png';
    thisfile = sprintf(nametemplate, imnum);
    fullname = fullfile(savepath, thisfile);
    imwrite(imdata, fullname);
    
end
