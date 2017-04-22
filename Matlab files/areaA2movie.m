%Makes movie files
phimat = 1;
x=1;
y=1;
phi=0;
clear F, phi,x,y;
count1=1;

for frame=1:1:50
    
   matsize = 32;  %this was 512
   submat = 32;  %this was 512
  
   subplot(1,2,1)
%   filetoload = ['psi_part_0_gdot_4_w_0_loop_' int2str(frame) '.txt'];
  filetoload = ['layer_results/phi_counter_start_0_counter_2_layer_4.txt'];
   phi = load(filetoload,'-ascii');
   count = 1;
   phisp_av(frame,1) = 0;
   phidp_av(frame,1) = 0;
   areadp = 0;
   areasp = 0;
   
   for i = 1:matsize
       for j = 1:matsize
           phimat(j,i) = phi(1,count);
           if (phi(1,count) > 0.6)
               phidp_av(frame,1) = phidp_av(frame,1)+phi(1,count);
               areadp = areadp + 1;
           end
           if (phi(1,count) < 0.4)
               phisp_av(frame,1) = phisp_av(frame,1)+phi(1,count);
               areasp = areasp + 1;
           end
           count = count+1;
       end
   end
   phidp_av(frame,1) = phidp_av(frame,1)/areadp;
   phisp_av(frame,1) = phisp_av(frame,1)/areasp;
   
   imagesc(phimat);
   shading interp;
   grid off;
   axis square;
   axis off;
   caxis([-1 1]);
   colormap(jet);
   
   subplot(1,2,2)
   filetoload = ['results/phi_part_0_gdot_4_w_0_loop_' int2str(frame) '.txt'];
   phi = load(filetoload,'-ascii');
   count = 1;
   phisp_av(frame,1) = 0;
   phidp_av(frame,1) = 0;
   areadp = 0;
   areasp = 0;
   
   for i = 1:matsize
       for j = 1:matsize
           phimat(j,i) = phi(1,count);
           if (phi(1,count) > 0.6)
               phidp_av(frame,1) = phidp_av(frame,1)+phi(1,count);
               areadp = areadp + 1;
           end
           if (phi(1,count) < 0.4)
               phisp_av(frame,1) = phisp_av(frame,1)+phi(1,count);
               areasp = areasp + 1;
           end
           count = count+1;
       end
   end
   phidp_av(frame,1) = phidp_av(frame,1)/areadp;
   phisp_av(frame,1) = phisp_av(frame,1)/areasp;
   phisub=phimat(1:submat,1:submat);
   imagesc(phisub);
   shading interp;
   grid off;
   axis square;
   axis off;
   caxis([-2 2]);
   colormap(jet);
   
%    subplot(1,3,3)
%    filetoload = ['results/phi_part_0_gdot_2_w_0_loop_' int2str(frame) '.txt'];
%    phi = load(filetoload,'-ascii');
%    count = 1;
%    phisp_av(frame,1) = 0;
%    phidp_av(frame,1) = 0;
%    areadp = 0;
%    areasp = 0;
%    
%    for i = 1:matsize
%        for j = 1:matsize
%            phimat(j,i) = phi(1,count);
%            if (phi(1,count) > 0.6)
%                phidp_av(frame,1) = phidp_av(frame,1)+phi(1,count);
%                areadp = areadp + 1;
%            end
%            if (phi(1,count) < 0.4)
%                phisp_av(frame,1) = phisp_av(frame,1)+phi(1,count);
%                areasp = areasp + 1;
%            end
%            count = count+1;
%        end
%    end
%    phidp_av(frame,1) = phidp_av(frame,1)/areadp;
%    phisp_av(frame,1) = phisp_av(frame,1)/areasp;
%    phisub=phimat(1:submat,1:submat);
%    imagesc(phisub);
%    shading interp;
%    grid off;
%    axis square;
%    axis off;
%    caxis([-2 2]);
%    colormap(jet);
%    

   
   F(count1)=getframe(gcf);
   count1 = count1 + 1;
end
%movie2avi(F,'phasesep2dcuda.avi')