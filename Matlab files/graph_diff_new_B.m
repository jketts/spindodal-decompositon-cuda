function graph_diff_new_B(gridsize,filename,nofiles)

Z_grid = gridsize-2;
height = Z_grid;

for n=1:1:nofiles
      close;
   % clf;
   
% i=45;
     
     
   X_grid = gridsize;
   Y_grid = gridsize;
   Z_grid = gridsize-2;
 
marker_color = ['r' 'y' 'g' 'b' 'c' 'm' 'k'];
efficiency_frame = [1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 6 6 6 6 7];
[x,y,z] = meshgrid(1:1:X_grid,1:1:Y_grid,1:1:Z_grid);


%phi_av = 0;

  
       filetoload = ['results/isoplot/phi_B/',filename,num2str(n),'.txt'];
       phi = load(filetoload,'-ascii');
 
       count = 1;
       for i = 1:1:X_grid
           for j = 1:1:Y_grid
               for k = 1:1:Z_grid
                   phi3d(i,j,k) = phi(1,count);
%                  phi_av = phi_av+phi(1,count);
                   count = count+1;           
               end
           end
       end
                    
%        phi_av = phi_av/(X_grid*Y_grid*Z_grid)  
    height = height + 1;

   
    h = figure;  
    p1 = patch(isosurface(phi3d,0.5),'FaceColor','green','EdgeColor','none');
    isonormals(phi3d,p1);
    p2 = patch(isocaps(phi3d,0.5),'FaceColor','interp','EdgeColor','none');
    daspect([1 1 1]);
    view(3);
    camlight;
    lighting phong;
    alpha(0.85);
    axis tight;
    axis([0 X_grid 0 Y_grid 0 height])
     set(gca,'XTickLabel',{''})  % to remove x tick labels
     set(gca,'YTickLabel',{''})  % to remove y tick labels
     set(gca,'ZTickLabel',{''})  % to remove z tick labels
%    axis off;
    grid off;
    axis square;
    camproj perspective;

   
name = strcat('images/phi_B/','Results_Plot_',num2str(n));

saveas(h, name,'jpg')


end


end   


