
gridsize = 128;
marker_color = ['r' 'y' 'g' 'b' 'c' 'm' 'k'];
efficiency_frame = [1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 6 6 6 6 7];
[x,y,z] = meshgrid(1:1:gridsize,1:1:gridsize,1:1:gridsize);
frame_count = 1;
phi_av = 0;

% for frame = 0:35:35
    frame = 57
    for layer = 0:1:gridsize-1
       filetoload = ['results/phi_start10_run' int2str(frame) 'layer' int2str(layer) '.txt'];
       phi = load(filetoload,'-ascii');
       count = 1;
       for j = 1:1:gridsize
           for k = 1:1:gridsize
            phi3d(k,j,layer+1) = phi(1,count);
            phi_av = phi_av+phi(1,count);
            count = count+1;
           end
       end
    end
    
    phi_av = phi_av/(gridsize*gridsize*gridsize)
   
%    subplot(1,2,1);
    p1 = patch(isosurface(phi3d,0.5),'FaceColor','green','EdgeColor','none');
    isonormals(phi3d,p1);
    p2 = patch(isocaps(phi3d,0.5),'FaceColor','interp','EdgeColor','none');
    daspect([1 1 1]);
    view(3);
    camlight;
    lighting phong;
    alpha(0.85);
    axis tight;
    axis off;
    grid off;
    axis square;
    camproj perspective;
    
%     for layer = 0:1:gridsize-1
%        filetoload = ['seventythirty/results/phi' int2str(frame) 'layer' int2str(layer) '.txt'];
%        phi = load(filetoload,'-ascii');
%        count = 1;
%        for j = 1:1:gridsize
%            for k = 1:1:gridsize
%             phi3d(k,j,layer+1) = phi(1,count);
%             count = count+1;
%            end
%        end
%     end
%    
%     subplot(1,2,2);
%     p1 = patch(isosurface(phi3d,0.3),'FaceColor','blue','EdgeColor','none');
%     isonormals(phi3d,p1);
%     p2 = patch(isocaps(phi3d,0.3),'FaceColor','interp','EdgeColor','none');
%     daspect([1 1 1]);
%     view(3);
%     camlight;
%     lighting gouraud;
%     alpha(0.8);
%     axis tight;
%     axis off;
%     grid off;
%     axis square;
%     camproj perspective;
%     
% 
%     F(frame_count)=getframe(gcf);
%     frame_count = frame_count+1;
%     close;
% end


