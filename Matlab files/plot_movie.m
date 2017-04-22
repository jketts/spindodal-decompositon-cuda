%fpath= ['\images\'];    
%image directory
imglist= dir(['images\Results_Plot_*.jpg']) ;   % image list

%fpath=['\movies'];
fps= 3;    % frames per second
fname= ['movie.avi'];    % output file name
codec= 'hfyu';    %lossless encoding(Huffmann)

% create movie
for j= 1:1:20;
	img= imread(['images\' imglist(j).name]);    % get image
	m(j)= im2frame(img);    % make frame
%	if rem(j, 250) == 0
	%	disp([num2str(j) ' frames processed...'])
	%end
end

% convert movie to avi:
movie2avi(m, fname, 'compression', 'Cinepak', 'fps', fps);    % convert
%movie frames to movie.avi @ 25fps using Huffmann encoding

% free used variables
clear imglist img m

