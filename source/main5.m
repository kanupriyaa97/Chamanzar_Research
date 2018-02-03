FS = stoploop({'Press  f to freeze, u to unfreeze and s to save in freeze mode'});
    %return;
    %FS.Clear() ; 
    %clear FS ;
%end

function F = stoploop(str)

error(nargoutchk(1,1,nargout)) ;

if nargin,
    if ~ischar(str) && ~iscellstr(str),
        error([mfilename ':InputString'],...
            'Input should be a string, or a cell array of strings.') ;
    end
else
    % default message string
    str = 'Stop the Loop' ;
end

% create a msgbox displaying the string
H = msgbox(str,'STOPLOOP') ;

% create the two anonymous functions
F.Stop = @() stopfun(H) ; % false if message box still exists
F.Clear = @() clearfun(H) ; % delete message box

function r = stopfun(H)
drawnow ;          % ensure that button presses are recorded
r = ~ishandle(H) ; % false if message box still exists
end 

function clearfun(H)
% clear the message box if it still exists
if ishandle(H),
    delete(H) ;
end
end
end