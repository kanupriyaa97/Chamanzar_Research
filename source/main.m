function main2()
    close all;
    clear all;
    imnum = 0;
    
    cam = webcam('Microsoft® LifeCam HD-3000');
    k = [];
    %we first check for key press and then getthe most recent key press
    %instead of getting the most recent key press and then checking if the 
    %key was pressed.
    set(gcf,'KeyPressFcn','k = get(gcf, "CurrentCharacter");');
    
    while 1
        imdata = snapshot(cam);
        imagesc(imdata(:,:,1));
        disp(k);
        if ~isempty(k)
            if strcmp(k,'f')
                disp('freeze');
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
    %m=[];
    %set(gcf,'keypress','m=get(gcf,''current char'');');
    while 1
        imshow(imdata);
        pause;
        %if ~isempty(m)
            %if strcmp(m,'u')
                %return;
            %end
        %end
    end
end

function take_pic(imnum, imdata)

    savepath = 'C:\Users\Kanupriyaa\Desktop';
    nametemplate = 'image_%04d.png';
    thisfile = sprintf(nametemplate, imnum);
    fullname = fullfile(savepath, thisfile);
    imwrite(imdata, fullname);
    
end
