function take_pic(imnum, imdata)

savepath = 'C:\Users\Kanupriyaa\Desktop';
nametemplate = 'image_%04d.png';
thisfile = sprintf(nametemplate, imnum);
fullname = fullfile(savepath, thisfile);
imwrite(imdata, fullname);

end