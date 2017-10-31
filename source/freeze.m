function freeze(imdata)
m=[];
set(gcf,'keypress','k=get(gcf,''currentchar'');');
while 1
    imshow(imdata);
    if ~isempty(m)
        if strcmp(m,'u')
            return;
        end
    end
end
end