function main()
    imnum = 0;
    cam = webcam(1);
    while 1
        imdata = snapshot(cam);
		imdata(:,:,1) = 0;
        imshow(imdata);
        main2;
        if(ans == 102)
            freeze(imdata, imnum);
            %return;
        end
    end 
    clear cam;
end


function freeze(imdata,imnum)
    while 1
        imshow(imdata);
        main2;
        if (ans == 117)
            return;
        end
        if (ans == 115)
            take_pic(imnum,imdata);
            imnum = imnum + 1;
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