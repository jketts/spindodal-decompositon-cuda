function graph_diff(gridsize,filename,nofiles )

for i=1:1:nofiles
    close;
   % clf;

fullfilename = strcat('results/',filename,num2str(i),'.txt');
pointcount = 0;
fid = fopen(fullfilename);

[X,Y,Z,A,B,C,H] = textread(fullfilename,'%d, %d, %d, %f, %f, %f, %f');

X_grid = gridsize-1;
Y_grid = gridsize-1;
Z_grid = gridsize-3;


for j=1:1:length(X)
if ((X(j)== 0)||(X(j)== X_grid)||(Y(j) == 0)||(Y(j) ==Y_grid)||(Z(j)  == 0)||(Z(j)==Z_grid))
pointcount=pointcount+1;
x(pointcount) = X(j);
y(pointcount) = Y(j);
z(pointcount) = H(j);
%C{pointcount} =[A(j) B(j) C(j)];
a(pointcount) = A(j);
b(pointcount) = B(j);
c(pointcount) = C(j);
end  
end


C = [a(:) b(:) c(:)];

S = repmat(250,numel(x),1);

h = figure;
scatter3(x,y,z,S(:),C,'filled')
axis([0 X_grid 0 Y_grid 0 Z_grid])
view(60,60);
%f = getframe;
%set(gca,'nextplot','replacechildren','visible','off')

%if( i==1)
 % [im,map] = rgb2ind(f.cdata,256,'nodither');
%im(1,1,1,nofiles) = 0; 
    
%end
%if (i>1)
   
 % im(:,:,1,i) = rgb2ind(f.cdata,map,'nodither');  
    
%end

name = strcat('images/','Results_Plot_',num2str(i));

saveas(h, name,'jpg')


end
%imwrite(im,map,'Plot.gif','DelayTime',0.5,'LoopCount',inf) 


end


