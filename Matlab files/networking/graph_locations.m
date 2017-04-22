[r_size,c_size]=size(PI_data);

grid_area = max(PI_data);

PI_mat_2009 = zeros(grid_area(2),grid_area(2));
PI_mat_2010 = zeros(grid_area(2),grid_area(2));
PI_mat_2011 = zeros(grid_area(2),grid_area(2));
xy_PI_data_2009 = zeros(grid_area(2),2);
xy_PI_data_2010 = zeros(grid_area(2),2);
xy_PI_data_2011 = zeros(grid_area(2),2);
PI_dept_labels_2009 = cell(grid_area(2),1);
PI_dept_labels_2010 = cell(grid_area(2),1);
PI_dept_labels_2011 = cell(grid_area(2),1);


for cell_row = 1:grid_area(2)
    PI_dept_labels_2009(cell_row) = {'2009'};
end
    
grant_no = PI_data(1,1);
count_back_to_row = 1;
for row = 2:1:r_size
    if PI_data(row,1) == grant_no
        if (PI_data(row,6) == 2009)
           for count_back = count_back_to_row:row-1
   %archeology AAP, number 1
                if PI_data(row,3) == 1; %x component relating to department 1
                 x_comp_1=  ( 1465) ; %the x component of 
                 y_comp_1= (( 1071- ( 514)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 1; %x component relating to department 1
                  x_comp_2= 1541-( 1465) ; %the x component of 
                 y_comp_2= (( 1071- (514)) / 1071 ) ; %the y component of   
                end
                
  %autocontron and systems, ACS, 2
                if PI_data(row,3) == 2; %x component relating to department 1
                  x_comp_1=    ( 1378 ) ; %the x component of 
                 y_comp_1=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 2; %x component relating to department 1
                    x_comp_2=    ( 1378 ) ; %the x component of 
                 y_comp_2=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end  
 %AMRC advance manufacturing research centre AMRC  3 (is outside the main campus) 
                if PI_data(row,3) == 3; %x component relating to department 1
                  x_comp_1=  ( 1530 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 162 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 3; %x component relating to department 1
                    x_comp_2=  ( 1530 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 162 )) / 1071 )  ; %the y component of 
        
                end 
                
%Animal and plant APS 4
                if PI_data(row,3) == 4; %x component relating to department 1
                  x_comp_1=  ( 747 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 386)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 4; %x component relating to department 1
                    x_comp_2=  ( 747 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 386)) / 1071 ) ; %the y component of 
         
                end

                

   %architecture ARC 5
                if PI_data(row,3) == 5; %x component relating to department 1
                  x_comp_1=  ( 735) ; %the x component of 
                 y_comp_1= (( 1071- ( 259)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 5;  %x component relating to department 1
                   x_comp_2=  ( 735) ; %the x component of 
                 y_comp_2= (( 1071- ( 259)) / 1071 ) ; %the y component of 
          
                end
                
 %ARN ????? 6
                if PI_data(row,3) == 6; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 6; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
  %Bone biology 7
                if PI_data(row,3) == 7; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 7; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end 
                
  %biomedical genetics BGE 8
                if PI_data(row,3) == 8; %x component relating to department 1
                  x_comp_1=  ( 596 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 8; %x component relating to department 1
                    x_comp_2=  ( 596 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end 
                
                                              
%Biblical studies BIB, number 9
                if PI_data(row,3) == 9; %x component relating to department 1
                  x_comp_1=  (1147) ; %the x component of 
                 y_comp_1= (( 1071- (525)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 9; %x component relating to department 1
                   x_comp_2=  (1147) ; %the x component of 
                 y_comp_2= (( 1071- (525)) / 1071 ) ; %the y component of   
                end
                

 
   %biomedical BMS 10
                if PI_data(row,3) == 10; %x component relating to department 1
                  x_comp_1=  ( 658 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 10; %x component relating to department 1
                     x_comp_2=  ( 658 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
  %bone metabolism BON 11  - should be at northern general
                if PI_data(row,3) == 11; %x component relating to department 1
                  x_comp_1=  ( 121 ) ; %the x component of 
                 y_comp_1= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 11; %x component relating to department 1
                    x_comp_2=  ( 121 ) ; %the x component of 
                 y_comp_2= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end 
                
    %coronary artery disease group, CAG  12
                if PI_data(row,3) == 12; %x component relating to department 1
                  x_comp_1=  ( 248 ) ; %the x component of 
                 y_comp_1= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 12; %x component relating to department 1
                    x_comp_2=  ( 248 ) ; %the x component of 
                 y_comp_2= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end 
                
     %Oral health  13
                if PI_data(row,3) == 13; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 13; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cardiovascular science, CHL  14
                if PI_data(row,3) == 14; %x component relating to department 1
                  x_comp_1=  ( 210 ) ; %the x component of 
                 y_comp_1= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 14; %x component relating to department 1
                    x_comp_2=  ( 210 ) ; %the x component of 
                 y_comp_2= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                    
                               
  %chemistry CHM 15
                if PI_data(row,3) == 15; %x component relating to department 1
                  x_comp_1=  ( 808 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 306)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 15; %x component relating to department 1
                  x_comp_2=  ( 808 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 306)) / 1071 ) ; %the y component of 
          
                end
                
    %centre for human neutrition CHN   16
                if PI_data(row,3) == 16; %x component relating to department 1
                  x_comp_1=  ( 256 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 16; %x component relating to department 1
                    x_comp_2=  ( 256 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end 
                

                
                                                                   
  %civil and structural CIV 17
                if PI_data(row,3) == 17;%x component relating to department 1
                  x_comp_1=  ( 1366 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 397)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 17; %x component relating to department 1
                    x_comp_2=  ( 1366 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 397)) / 1071 ) ; %the y component of 
         
                end
     %clinical neurology CLN  18
                if PI_data(row,3) == 18; %x component relating to department 1
                  x_comp_1=  ( 471 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 18; %x component relating to department 1
                    x_comp_2=  ( 471 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end 
                
     %clinical onocology CLO 19
                if PI_data(row,3) == 19; %x component relating to department 1
                  x_comp_1=  ( 148 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 19; %x component relating to department 1
                    x_comp_2=  ( 148 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end 
                
                                        
  %computer COM 20
                if PI_data(row,3) == 20; %x component relating to department 1
                  x_comp_1=  ( 1248 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 20; %x component relating to department 1
                   x_comp_2=  ( 1248 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452)) / 1071 ) ; %the y component of 
         
                end
                
  %chemical and biological CPE, 21
                if PI_data(row,3) == 21; %x component relating to department 1
                  x_comp_1=  ( 1451 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 247)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 21; %x component relating to department 1
                    x_comp_2=  ( 1451 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 247)) / 1071 ) ; %the y component of 
          
                end
     %clinical pharamcology CLN,  22
                if PI_data(row,3) == 22; %x component relating to department 1
                  x_comp_1=  ( 300 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 22; %x component relating to department 1
                    x_comp_2=  ( 300 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cariovascular res unit, CRU  23
                if PI_data(row,3) == 23; %x component relating to department 1
                  x_comp_1=  ( 320 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 23; %x component relating to department 1
                    x_comp_2=  ( 320 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
   %detistry DEN 24
                if PI_data(row,3) == 24; %x component relating to department 1
                  x_comp_1=  ( 272 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 646)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 24; %x component relating to department 1
                   x_comp_2=  ( 272 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 646)) / 1071 ) ; %the y component of 
         
                end  
                
     %diabetes, endocr and metabolism, DEU  25
                if PI_data(row,3) == 25; %x component relating to department 1
                  x_comp_1=  ( 306 ) ; %the x component of 
                 y_comp_1= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 25; %x component relating to department 1
                    x_comp_2=  ( 306 ) ; %the x component of 
                 y_comp_2= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end 
                
      %advanced metallic systems DMT  26
                if PI_data(row,3) == 26; %x component relating to department 1
                  x_comp_1=  ( 1980) ; %the x component of 
                 y_comp_1= (( 1071-( 1071 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 26; %x component relating to department 1
                    x_comp_2=  ( 1980 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1071 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %east asian EAS 27
                if PI_data(row,3) == 27; %x component relating to department 1
                  x_comp_1=  ( 879) ; %the x component of 
                 y_comp_1= (( 1071- ( 597)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 27; %x component relating to department 1
                  x_comp_2=  ( 879) ; %the x component of 
                 y_comp_2= (( 1071- ( 597)) / 1071 ) ; %the y component of 
           
                end
                
  %economics ECN 28
                if PI_data(row,3) == 28; %x component relating to department 1
                  x_comp_1=  ( 1316) ; %the x component of 
                 y_comp_1= (( 1071- ( 448)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 28; %x component relating to department 1
                   x_comp_2=  ( 1316) ; %the x component of 
                 y_comp_2= (( 1071- ( 448)) / 1071 ) ; %the y component of 
          
                end
                
  %education EDU 29
                if PI_data(row,3) == 29; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 600)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 29; %x component relating to department 1
                   x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 600)) / 1071 ) ; %the y component of 
          
                end
                
    %electronic and electric EEE 30
                if PI_data(row,3) == 30; %x component relating to department 1
                  x_comp_1=  ( 1338 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 30; %x component relating to department 1
                   x_comp_2=  ( 1338 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
          
                end
                
    %english EGH 31
                if PI_data(row,3) == 31;%x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 31; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                
  %english language and linguistics ELL 32
                if PI_data(row,3) == 32; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 32; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
    %Faculty of arts, FCA  33
                if PI_data(row,3) == 33; %x component relating to department 1
                  x_comp_1=  ( 1020 ) ; %the x component of 
                 y_comp_1= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 33; %x component relating to department 1
                    x_comp_2=  ( 1020 ) ; %the x component of 
                 y_comp_2= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Engineering, FCE  34
                if PI_data(row,3) == 34; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 34; %x component relating to department 1
                    x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Medicine FCM  35
                if PI_data(row,3) == 35; %x component relating to department 1
                  x_comp_1=  ( 287 ) ; %the x component of 
                 y_comp_1= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 35; %x component relating to department 1
                    x_comp_2=  ( 287 ) ; %the x component of 
                 y_comp_2= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end 
                
     %Faculty of science FCP 36
                if PI_data(row,3) == 36; %x component relating to department 1
                  x_comp_1=  ( 625 ) ; %the x component of 
                 y_comp_1= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 36; %x component relating to department 1
                    x_comp_2=  ( 625 ) ; %the x component of 
                 y_comp_2= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end 
                
                                                                   
  %french FRE, 37
                if PI_data(row,3) == 37; %x component relating to department 1
                  x_comp_1=  ( 1013) ; %the x component of 
                 y_comp_1= (( 1071- ( 403)) / 1071 );  %the y component of 
        
                end
                
                if PI_data(count_back,3) == 37; %x component relating to department 1
                    x_comp_2=  ( 1013) ; %the x component of 
                 y_comp_2= (( 1071- ( 403)) / 1071 );  %the y component of 
         
                end   
                
                                     
  %geography GEO 38
                if PI_data(row,3) == 38; %x component relating to department 1
                  x_comp_1=  ( 595) ; %the x component of 
                 y_comp_1= (( 1071- ( 174)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 38; %x component relating to department 1
                   x_comp_2=  ( 595) ; %the x component of 
                 y_comp_2= (( 1071- ( 174)) / 1071 ) ; %the y component of 
          
                end
                
    %ScHARR HAR 39
                if PI_data(row,3) == 39; %x component relating to department 1
                  x_comp_1=  ( 212 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 796)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 39; %x component relating to department 1
                    x_comp_2=  ( 212 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 796)) / 1071 ) ; %the y component of 
         
                end
                
      %institute for study of aging, HCE, 40
                if PI_data(row,3) == 40; %x component relating to department 1
                  x_comp_1=  ( 144 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 40; %x component relating to department 1
                    x_comp_2=  ( 144 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end 
                
       %health economics and decision sc, HCM,  41
                if PI_data(row,3) == 41; %x component relating to department 1
                  x_comp_1=  ( 1245 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 41; %x component relating to department 1
                    x_comp_2=  ( 1245 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end 
                
       %human metabolism, HMC,  42
                if PI_data(row,3) == 42; %x component relating to department 1
                  x_comp_1=  ( 273 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 42; %x component relating to department 1
                    x_comp_2=  ( 273 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end 
                
       %heamostasis group, HMT  43
                if PI_data(row,3) == 43; %x component relating to department 1
                  x_comp_1=  ( 791 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 43; %x component relating to department 1
                    x_comp_2=  ( 791 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
                          
       %humanities research institue, HRI  44
                if PI_data(row,3) == 44; %x component relating to department 1
                  x_comp_1=  ( 1117 ) ; %the x component of 
                 y_comp_1= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 44; %x component relating to department 1
                    x_comp_2=  ( 1117 ) ; %the x component of 
                 y_comp_2= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                         
      %History. HST, 45
                if PI_data(row,3) == 45;%x component relating to department 1
                  x_comp_1=  ( 1050) ; %the x component of 
                 y_comp_1= (( 1071- ( 455)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 45; %x component relating to department 1
                    x_comp_2=  ( 1050) ; %the x component of 
                 y_comp_2= (( 1071- ( 455)) / 1071 ) ; %the y component of 
                end  
                
     %institute for cancer studies, ICS 46
                if PI_data(row,3) == 46; %x component relating to department 1
                  x_comp_1=  ( 143 ) ; %the x component of 
                 y_comp_1= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 46; %x component relating to department 1
                    x_comp_2=  ( 143 ) ; %the x component of 
                 y_comp_2= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end 
                
      %infection and immunity, III 47
                if PI_data(row,3) == 47; %x component relating to department 1
                  x_comp_1=  ( 132 ) ; %the x component of 
                 y_comp_1= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==47 ; %x component relating to department 1
                    x_comp_2=  ( 132 ) ; %the x component of 
                 y_comp_2= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %information INF 48
                if PI_data(row,3) == 48; %x component relating to department 1
                  x_comp_1=  ( 1289) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 48; %x component relating to department 1
                   x_comp_2=  ( 1289) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
          
                end
    %infectious dieseases 49
                if PI_data(row,3) == 49; %x component relating to department 1
                  x_comp_1=  ( 313 ) ; %the x component of 
                 y_comp_1= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 49; %x component relating to department 1
                    x_comp_2=  ( 313 ) ; %the x component of 
                 y_comp_2= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end 
                
    %information resources, INR 50
                if PI_data(row,3) == 50; %x component relating to department 1
                  x_comp_1=  ( 1299 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 50; %x component relating to department 1
                    x_comp_2=  ( 1299 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end 
                
     %inflammatory signalling group, INF  51
                if PI_data(row,3) == 51; %x component relating to department 1
                  x_comp_1=  ( 202 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 51; %x component relating to department 1
                    x_comp_2=  ( 202 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                      
  %journalism JNL 52
                if PI_data(row,3) == 52; %x component relating to department 1
                  x_comp_1=  ( 1252) ; %the x component of 
                 y_comp_1= (( 1071- ( 564)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 52; %x component relating to department 1
                  x_comp_2=  ( 1252) ; %the x component of 
                 y_comp_2= (( 1071- ( 564)) / 1071 ) ; %the y component of 
           
                end
                
   %law LAW 53
                if PI_data(row,3) == 53; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 90)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 53; %x component relating to department 1
                  x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 90)) / 1071 ) ; %the y component of 
           
                end 
                
   %????  LIB   54
                if PI_data(row,3) == 54; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 54; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
                
   %english literature LIT 55
                if PI_data(row,3) == 55; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 55; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                                
             
  %landscape LSC 56
                if PI_data(row,3) == 56; %x component relating to department 1
                  x_comp_1=  ( 717) ; %the x component of 
                 y_comp_1= (( 1071- ( 277)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 56; %x component relating to department 1
                   x_comp_2=  ( 717) ; %the x component of 
                 y_comp_2= (( 1071- ( 277)) / 1071 ) ; %the y component of 
          
                end
                
   %materials MAT 57
                if PI_data(row,3) ==57; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 57; %x component relating to department 1
                   x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
         
                end
                
    %molecular biology and biotech, MBB  58
                if PI_data(row,3) == 58; %x component relating to department 1
                  x_comp_1=  ( 682 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 58; %x component relating to department 1
                    x_comp_2=  ( 682 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end 
                
    %HRR-health services research,  MCR  59
                if PI_data(row,3) == 59; %x component relating to department 1
                  x_comp_1=  ( 1233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 59; %x component relating to department 1
                    x_comp_2=  ( 1233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end 
                
    %FME-medical education, MDE  60
                if PI_data(row,3) == 60; %x component relating to department 1
                  x_comp_1=  ( 643 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 60; %x component relating to department 1
                    x_comp_2=  ( 643 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %mechanical MEC 61
                if PI_data(row,3) == 61; %x component relating to department 1
                  x_comp_1=  ( 1409 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 363)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 61;%x component relating to department 1
                   x_comp_2=  ( 1409 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 363)) / 1071 ) ; %the y component of 
          
                end              

     %chool of medicine MED  62
                if PI_data(row,3) == 62; %x component relating to department 1
                  x_comp_1=  ( 48 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 62; %x component relating to department 1
                    x_comp_2=  ( 48 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end 
                
                            
    %management MGT 63
                if PI_data(row,3) == 63; %x component relating to department 1
                  x_comp_1=  ( 1328) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 63; %x component relating to department 1
                   x_comp_2=  ( 1328) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
          
                end
                

                
  %modern languages MLT, (MLM is 64?)
                if PI_data(row,3) == 64; %x component relating to department 1
                  x_comp_1=  ( 1425) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 64; %x component relating to department 1
                    x_comp_2=  ( 1425) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
     %medical physics MPY 65
                if PI_data(row,3) == 65; %x component relating to department 1
                  x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 65; %x component relating to department 1
                     x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
                end   
                
 %music MUS 66
                if PI_data(row,3) == 66; %x component relating to department 1
                  x_comp_1=  ( 1102) ; %the x component of 
                 y_comp_1= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 66; %x component relating to department 1
                    x_comp_2=  ( 1102) ; %the x component of 
                 y_comp_2= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
    %neuroscience, NEU  67
                if PI_data(row,3) == 67; %x component relating to department 1
                  x_comp_1=  ( 487 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 67; %x component relating to department 1
                    x_comp_2=  ( 487 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end 
                
      %non-mammalian models group, NMM  68
                if PI_data(row,3) == 68; %x component relating to department 1
                  x_comp_1=  ( 603 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 68; %x component relating to department 1
                    x_comp_2=  ( 603 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nephrology NPH  69
                if PI_data(row,3) == 69; %x component relating to department 1
                  x_comp_1=  ( 413 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 69; %x component relating to department 1
                    x_comp_2=  ( 413 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nursing and midwifery NUR 70
                if PI_data(row,3) == 70; %x component relating to department 1
                  x_comp_1=  ( 519 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 70; %x component relating to department 1
                    x_comp_2=  ( 519 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end 
                
      %OMS, oral and maxillo-facial surgery, 71
                if PI_data(row,3) == 71; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 71; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end 
                
       %opthalmology OPH  72
                if PI_data(row,3) == 72; %x component relating to department 1
                  x_comp_1=  ( 90 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 72; %x component relating to department 1
                    x_comp_2=  ( 90 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end 
                
       %ORP, oral and maxillo-facial pathology, 73
                if PI_data(row,3) == 73; %x component relating to department 1
                  x_comp_1=  ( 380 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 780 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 73; %x component relating to department 1
                    x_comp_2=  ( 380 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 780 )) / 1071 ) ; %the y component of 
        
                end 
                
       %Child health PDT  74
                if PI_data(row,3) == 74; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 74; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                                 
  %Philosophy PHI, 75
                if PI_data(row,3) == 75; %x component relating to department 1
                  x_comp_1=  ( 1149 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==75; %x component relating to department 1
                     x_comp_2=  ( 1149 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
      %HRR- public health 76
                if PI_data(row,3) == 76; %x component relating to department 1
                  x_comp_1=  ( 1278 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 76; %x component relating to department 1
                    x_comp_2=  ( 1278 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %physics and astronomy PHY 77
                if PI_data(row,3) == 77; %x component relating to department 1
                  x_comp_1=  ( 868) ; %the x component of 
                 y_comp_1= (( 1071- ( 526)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 77; %x component relating to department 1
                    x_comp_2=  ( 868) ; %the x component of 
                 y_comp_2= (( 1071- ( 526)) / 1071 ) ; %the y component of 
          
                end
                
      %Platlet group PLG 78
                if PI_data(row,3) == 78; %x component relating to department 1
                  x_comp_1=  ( 233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 78; %x component relating to department 1
                    x_comp_2=  ( 233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end 
                
                 
  %politics POL 79
                if PI_data(row,3) == 79; %x component relating to department 1
                  x_comp_1=  ( 58) ; %the x component of 
                 y_comp_1= (( 1071- ( 324)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 79; %x component relating to department 1
                  x_comp_2=  ( 58) ; %the x component of 
                 y_comp_2= (( 1071- ( 324)) / 1071 ) ; %the y component of 
           
                end
                
      %academic unit of primary care PRC  80 (should be at northern
      %general)
                if PI_data(row,3) == 80; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 80; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end 
                
       %chinical psychiatry PSI 81
                if PI_data(row,3) == 81; %x component relating to department 1
                  x_comp_1=  ( 490 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 81; %x component relating to department 1
                    x_comp_2=  ( 490 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end 
                
                                     
    %Psycology PSY 82
                if PI_data(row,3) == 82; %x component relating to department 1
                  x_comp_1=  ( 235) ; %the x component of 
                 y_comp_1= (( 1071- ( 450)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 82; %x component relating to department 1
                   x_comp_2=  ( 235) ; %the x component of 
                 y_comp_2= (( 1071- ( 450)) / 1071 ) ; %the y component of 
          
                end 
     %pathology PTH  83
                if PI_data(row,3) == 83; %x component relating to department 1
                  x_comp_1=  ( 432 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 83; %x component relating to department 1
                    x_comp_2=  ( 432 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %pulmonary vascular group PVG 84
                if PI_data(row,3) == 84; %x component relating to department 1
                  x_comp_1=  ( 183 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 84; %x component relating to department 1
                    x_comp_2=  ( 183 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end 
                
     %radiology RAD  85
                if PI_data(row,3) == 85; %x component relating to department 1
                  x_comp_1=  ( 44 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 85; %x component relating to department 1
                    x_comp_2=  ( 44 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end 
                
     %reproductive and development med RPM  86
                if PI_data(row,3) == 86; %x component relating to department 1
                  x_comp_1=  ( 232 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 86; %x component relating to department 1
                    x_comp_2=  ( 232 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end 
                
      %adult dental care RSD  87
                if PI_data(row,3) == 87; %x component relating to department 1
                  x_comp_1=  ( 322 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 87; %x component relating to department 1
                    x_comp_2=  ( 322 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end 
                
       %respiratory medicine RSM   88
                if PI_data(row,3) == 88; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 88; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                    
 %Russian and slavonic, RUS, 89
                if PI_data(row,3) == 89; %x component relating to department 1
                  x_comp_1=  ( 1001 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 89; %x component relating to department 1
                   x_comp_2=  ( 1001 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
         
                end  
                
  %sociological studies SCS 90
                if PI_data(row,3) == 90; %x component relating to department 1
                  x_comp_1=  ( 87) ; %the x component of 
                 y_comp_1= (( 1071- ( 344)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 90; %x component relating to department 1
                   x_comp_2=  ( 87) ; %the x component of 
                 y_comp_2= (( 1071- ( 344)) / 1071 ) ; %the y component of 
           
                end
                  
  %maths and stats MAS/SOM 91
                if PI_data(row,3) == 91; %x component relating to department 1
                  x_comp_1=  ( 823 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 488)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 91; %x component relating to department 1
                    x_comp_2=  ( 823 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 488)) / 1071 ) ; %the y component of 
         
                end
                
       %surgical onocolgy SON  92
                if PI_data(row,3) == 92; %x component relating to department 1
                  x_comp_1=  ( 22 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 92; %x component relating to department 1
                    x_comp_2=  ( 22 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end 
                
     %human communication science SPE  93
                if PI_data(row,3) == 93; %x component relating to department 1
                  x_comp_1=  ( 309 ) ; %the x component of 
                 y_comp_1= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 93; %x component relating to department 1
                    x_comp_2=  ( 309 ) ; %the x component of 
                 y_comp_2= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %acad unit of supportive care SUP  94
                if PI_data(row,3) == 94; %x component relating to department 1
                  x_comp_1=  ( 119 ) ; %the x component of 
                 y_comp_1= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 94; %x component relating to department 1
                    x_comp_2=  ( 119 ) ; %the x component of 
                 y_comp_2= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                 
  %town/regional planning TRP 95
                if PI_data(row,3) == 95; %x component relating to department 1
                  x_comp_1=  ( 597 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 224)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 95; %x component relating to department 1
                   x_comp_2=  ( 597 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 224)) / 1071 ) ; %the y component of 
          
                end
  
      % urology URO  96
                if PI_data(row,3) == 96; %x component relating to department 1
                  x_comp_1=  ( 150 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 96; %x component relating to department 1
                    x_comp_2=  ( 150 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end 
                
     %vascular biology group VBG  97
                if PI_data(row,3) == 97; %x component relating to department 1
                  x_comp_1=  ( 134 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 97; %x component relating to department 1
                    x_comp_2=  ( 134 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end 
                
     %institute of work psychology WPS  98
                if PI_data(row,3) == 98; %x component relating to department 1
                  x_comp_1=  ( 1390 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 445 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 98; %x component relating to department 1
                    x_comp_2=  ( 1390 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 445 )) / 1071 )  ; %the y component of 
        
                end 

               
                PI_mat_2009(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2009(PI_data(count_back,2),PI_data(row,2)) = 1;
               

                 xy_PI_data_2009(PI_data(row,2),1) = x_comp_1 ; %the x component of 
                 xy_PI_data_2009(PI_data(count_back,2),1)= x_comp_2 ; %the x component of 
              
                 xy_PI_data_2009(PI_data(row,2),2)= y_comp_1; %the y component of
                 xy_PI_data_2009(PI_data(count_back,2),2)= y_comp_2; %the y component of
                              
                PI_dept_labels_2009(PI_data(row,2))=dept_labels(PI_data(row,3));
                PI_dept_labels_2009(PI_data(count_back,2))=dept_labels(PI_data(count_back,3));


           end
        end
    else
        grant_no = PI_data(row,1);
        count_back_to_row = row;
    end
end

for cell_row = 1:grid_area(2)
    PI_dept_labels_2010(cell_row) = {'2010'};
end
grant_no = PI_data(1,1);
count_back_to_row = 1;
for row = 2:1:r_size
    if PI_data(row,1) == grant_no
        if (PI_data(row,6) == 2010)
           for count_back = count_back_to_row:row-1
   %archeology AAP, number 1
                if PI_data(row,3) == 1; %x component relating to department 1
                 x_comp_1=  ( 1465) ; %the x component of 
                 y_comp_1= (( 1071- ( 514)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 1; %x component relating to department 1
                  x_comp_2= 1541-( 1465) ; %the x component of 
                 y_comp_2= (( 1071- (514)) / 1071 ) ; %the y component of   
                end
                
  %autocontron and systems, ACS, 2
                if PI_data(row,3) == 2; %x component relating to department 1
                  x_comp_1=    ( 1378 ) ; %the x component of 
                 y_comp_1=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 2; %x component relating to department 1
                    x_comp_2=    ( 1378 ) ; %the x component of 
                 y_comp_2=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end  
 %AMRC advance manufacturing research centre AMRC  3 (is outside the main campus) 
                if PI_data(row,3) == 3; %x component relating to department 1
                  x_comp_1=  ( 1530 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 162 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 3; %x component relating to department 1
                    x_comp_2=  ( 1530 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 162 )) / 1071 )  ; %the y component of 
        
                end 
                
%Animal and plant APS 4
                if PI_data(row,3) == 4; %x component relating to department 1
                  x_comp_1=  ( 747 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 386)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 4; %x component relating to department 1
                    x_comp_2=  ( 747 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 386)) / 1071 ) ; %the y component of 
         
                end

                

   %architecture ARC 5
                if PI_data(row,3) == 5; %x component relating to department 1
                  x_comp_1=  ( 735) ; %the x component of 
                 y_comp_1= (( 1071- ( 259)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 5;  %x component relating to department 1
                   x_comp_2=  ( 735) ; %the x component of 
                 y_comp_2= (( 1071- ( 259)) / 1071 ) ; %the y component of 
          
                end
                
 %ARN ????? 6
                if PI_data(row,3) == 6; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 6; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
  %Bone biology 7
                if PI_data(row,3) == 7; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 7; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end 
                
  %biomedical genetics BGE 8
                if PI_data(row,3) == 8; %x component relating to department 1
                  x_comp_1=  ( 596 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 8; %x component relating to department 1
                    x_comp_2=  ( 596 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end 
                
                                              
%Biblical studies BIB, number 9
                if PI_data(row,3) == 9; %x component relating to department 1
                  x_comp_1=  (1147) ; %the x component of 
                 y_comp_1= (( 1071- (525)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 9; %x component relating to department 1
                   x_comp_2=  (1147) ; %the x component of 
                 y_comp_2= (( 1071- (525)) / 1071 ) ; %the y component of   
                end
                

 
   %biomedical BMS 10
                if PI_data(row,3) == 10; %x component relating to department 1
                  x_comp_1=  ( 658 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 10; %x component relating to department 1
                     x_comp_2=  ( 658 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
  %bone metabolism BON 11  - should be at northern general
                if PI_data(row,3) == 11; %x component relating to department 1
                  x_comp_1=  ( 121 ) ; %the x component of 
                 y_comp_1= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 11; %x component relating to department 1
                    x_comp_2=  ( 121 ) ; %the x component of 
                 y_comp_2= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end 
                
    %coronary artery disease group, CAG  12
                if PI_data(row,3) == 12; %x component relating to department 1
                  x_comp_1=  ( 248 ) ; %the x component of 
                 y_comp_1= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 12; %x component relating to department 1
                    x_comp_2=  ( 248 ) ; %the x component of 
                 y_comp_2= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end 
                
     %Oral health  13
                if PI_data(row,3) == 13; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 13; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cardiovascular science, CHL  14
                if PI_data(row,3) == 14; %x component relating to department 1
                  x_comp_1=  ( 210 ) ; %the x component of 
                 y_comp_1= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 14; %x component relating to department 1
                    x_comp_2=  ( 210 ) ; %the x component of 
                 y_comp_2= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                    
                               
  %chemistry CHM 15
                if PI_data(row,3) == 15; %x component relating to department 1
                  x_comp_1=  ( 808 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 306)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 15; %x component relating to department 1
                  x_comp_2=  ( 808 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 306)) / 1071 ) ; %the y component of 
          
                end
                
    %centre for human neutrition CHN   16
                if PI_data(row,3) == 16; %x component relating to department 1
                  x_comp_1=  ( 256 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 16; %x component relating to department 1
                    x_comp_2=  ( 256 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end 
                

                
                                                                   
  %civil and structural CIV 17
                if PI_data(row,3) == 17;%x component relating to department 1
                  x_comp_1=  ( 1366 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 397)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 17; %x component relating to department 1
                    x_comp_2=  ( 1366 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 397)) / 1071 ) ; %the y component of 
         
                end
     %clinical neurology CLN  18
                if PI_data(row,3) == 18; %x component relating to department 1
                  x_comp_1=  ( 471 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 18; %x component relating to department 1
                    x_comp_2=  ( 471 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end 
                
     %clinical onocology CLO 19
                if PI_data(row,3) == 19; %x component relating to department 1
                  x_comp_1=  ( 148 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 19; %x component relating to department 1
                    x_comp_2=  ( 148 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end 
                
                                        
  %computer COM 20
                if PI_data(row,3) == 20; %x component relating to department 1
                  x_comp_1=  ( 1248 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 20; %x component relating to department 1
                   x_comp_2=  ( 1248 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452)) / 1071 ) ; %the y component of 
         
                end
                
  %chemical and biological CPE, 21
                if PI_data(row,3) == 21; %x component relating to department 1
                  x_comp_1=  ( 1451 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 247)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 21; %x component relating to department 1
                    x_comp_2=  ( 1451 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 247)) / 1071 ) ; %the y component of 
          
                end
     %clinical pharamcology CLN,  22
                if PI_data(row,3) == 22; %x component relating to department 1
                  x_comp_1=  ( 300 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 22; %x component relating to department 1
                    x_comp_2=  ( 300 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cariovascular res unit, CRU  23
                if PI_data(row,3) == 23; %x component relating to department 1
                  x_comp_1=  ( 320 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 23; %x component relating to department 1
                    x_comp_2=  ( 320 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
   %detistry DEN 24
                if PI_data(row,3) == 24; %x component relating to department 1
                  x_comp_1=  ( 272 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 646)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 24; %x component relating to department 1
                   x_comp_2=  ( 272 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 646)) / 1071 ) ; %the y component of 
         
                end  
                
     %diabetes, endocr and metabolism, DEU  25
                if PI_data(row,3) == 25; %x component relating to department 1
                  x_comp_1=  ( 306 ) ; %the x component of 
                 y_comp_1= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 25; %x component relating to department 1
                    x_comp_2=  ( 306 ) ; %the x component of 
                 y_comp_2= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end 
                
      %advanced metallic systems DMT  26
                if PI_data(row,3) == 26; %x component relating to department 1
                  x_comp_1=  ( 1980) ; %the x component of 
                 y_comp_1= (( 1071-( 1071 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 26; %x component relating to department 1
                    x_comp_2=  ( 1980 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1071 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %east asian EAS 27
                if PI_data(row,3) == 27; %x component relating to department 1
                  x_comp_1=  ( 879) ; %the x component of 
                 y_comp_1= (( 1071- ( 597)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 27; %x component relating to department 1
                  x_comp_2=  ( 879) ; %the x component of 
                 y_comp_2= (( 1071- ( 597)) / 1071 ) ; %the y component of 
           
                end
                
  %economics ECN 28
                if PI_data(row,3) == 28; %x component relating to department 1
                  x_comp_1=  ( 1316) ; %the x component of 
                 y_comp_1= (( 1071- ( 448)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 28; %x component relating to department 1
                   x_comp_2=  ( 1316) ; %the x component of 
                 y_comp_2= (( 1071- ( 448)) / 1071 ) ; %the y component of 
          
                end
                
  %education EDU 29
                if PI_data(row,3) == 29; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 600)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 29; %x component relating to department 1
                   x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 600)) / 1071 ) ; %the y component of 
          
                end
                
    %electronic and electric EEE 30
                if PI_data(row,3) == 30; %x component relating to department 1
                  x_comp_1=  ( 1338 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 30; %x component relating to department 1
                   x_comp_2=  ( 1338 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
          
                end
                
    %english EGH 31
                if PI_data(row,3) == 31;%x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 31; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                
  %english language and linguistics ELL 32
                if PI_data(row,3) == 32; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 32; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
    %Faculty of arts, FCA  33
                if PI_data(row,3) == 33; %x component relating to department 1
                  x_comp_1=  ( 1020 ) ; %the x component of 
                 y_comp_1= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 33; %x component relating to department 1
                    x_comp_2=  ( 1020 ) ; %the x component of 
                 y_comp_2= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Engineering, FCE  34
                if PI_data(row,3) == 34; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 34; %x component relating to department 1
                    x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Medicine FCM  35
                if PI_data(row,3) == 35; %x component relating to department 1
                  x_comp_1=  ( 287 ) ; %the x component of 
                 y_comp_1= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 35; %x component relating to department 1
                    x_comp_2=  ( 287 ) ; %the x component of 
                 y_comp_2= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end 
                
     %Faculty of science FCP 36
                if PI_data(row,3) == 36; %x component relating to department 1
                  x_comp_1=  ( 625 ) ; %the x component of 
                 y_comp_1= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 36; %x component relating to department 1
                    x_comp_2=  ( 625 ) ; %the x component of 
                 y_comp_2= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end 
                
                                                                   
  %french FRE, 37
                if PI_data(row,3) == 37; %x component relating to department 1
                  x_comp_1=  ( 1013) ; %the x component of 
                 y_comp_1= (( 1071- ( 403)) / 1071 );  %the y component of 
        
                end
                
                if PI_data(count_back,3) == 37; %x component relating to department 1
                    x_comp_2=  ( 1013) ; %the x component of 
                 y_comp_2= (( 1071- ( 403)) / 1071 );  %the y component of 
         
                end   
                
                                     
  %geography GEO 38
                if PI_data(row,3) == 38; %x component relating to department 1
                  x_comp_1=  ( 595) ; %the x component of 
                 y_comp_1= (( 1071- ( 174)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 38; %x component relating to department 1
                   x_comp_2=  ( 595) ; %the x component of 
                 y_comp_2= (( 1071- ( 174)) / 1071 ) ; %the y component of 
          
                end
                
    %ScHARR HAR 39
                if PI_data(row,3) == 39; %x component relating to department 1
                  x_comp_1=  ( 212 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 796)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 39; %x component relating to department 1
                    x_comp_2=  ( 212 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 796)) / 1071 ) ; %the y component of 
         
                end
                
      %institute for study of aging, HCE, 40
                if PI_data(row,3) == 40; %x component relating to department 1
                  x_comp_1=  ( 144 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 40; %x component relating to department 1
                    x_comp_2=  ( 144 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end 
                
       %health economics and decision sc, HCM,  41
                if PI_data(row,3) == 41; %x component relating to department 1
                  x_comp_1=  ( 1245 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 41; %x component relating to department 1
                    x_comp_2=  ( 1245 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end 
                
       %human metabolism, HMC,  42
                if PI_data(row,3) == 42; %x component relating to department 1
                  x_comp_1=  ( 273 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 42; %x component relating to department 1
                    x_comp_2=  ( 273 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end 
                
       %heamostasis group, HMT  43
                if PI_data(row,3) == 43; %x component relating to department 1
                  x_comp_1=  ( 791 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 43; %x component relating to department 1
                    x_comp_2=  ( 791 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
                          
       %humanities research institue, HRI  44
                if PI_data(row,3) == 44; %x component relating to department 1
                  x_comp_1=  ( 1117 ) ; %the x component of 
                 y_comp_1= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 44; %x component relating to department 1
                    x_comp_2=  ( 1117 ) ; %the x component of 
                 y_comp_2= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                         
      %History. HST, 45
                if PI_data(row,3) == 45;%x component relating to department 1
                  x_comp_1=  ( 1050) ; %the x component of 
                 y_comp_1= (( 1071- ( 455)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 45; %x component relating to department 1
                    x_comp_2=  ( 1050) ; %the x component of 
                 y_comp_2= (( 1071- ( 455)) / 1071 ) ; %the y component of 
                end  
                
     %institute for cancer studies, ICS 46
                if PI_data(row,3) == 46; %x component relating to department 1
                  x_comp_1=  ( 143 ) ; %the x component of 
                 y_comp_1= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 46; %x component relating to department 1
                    x_comp_2=  ( 143 ) ; %the x component of 
                 y_comp_2= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end 
                
      %infection and immunity, III 47
                if PI_data(row,3) == 47; %x component relating to department 1
                  x_comp_1=  ( 132 ) ; %the x component of 
                 y_comp_1= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==47 ; %x component relating to department 1
                    x_comp_2=  ( 132 ) ; %the x component of 
                 y_comp_2= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %information INF 48
                if PI_data(row,3) == 48; %x component relating to department 1
                  x_comp_1=  ( 1289) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 48; %x component relating to department 1
                   x_comp_2=  ( 1289) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
          
                end
    %infectious dieseases 49
                if PI_data(row,3) == 49; %x component relating to department 1
                  x_comp_1=  ( 313 ) ; %the x component of 
                 y_comp_1= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 49; %x component relating to department 1
                    x_comp_2=  ( 313 ) ; %the x component of 
                 y_comp_2= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end 
                
    %information resources, INR 50
                if PI_data(row,3) == 50; %x component relating to department 1
                  x_comp_1=  ( 1299 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 50; %x component relating to department 1
                    x_comp_2=  ( 1299 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end 
                
     %inflammatory signalling group, INF  51
                if PI_data(row,3) == 51; %x component relating to department 1
                  x_comp_1=  ( 202 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 51; %x component relating to department 1
                    x_comp_2=  ( 202 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                      
  %journalism JNL 52
                if PI_data(row,3) == 52; %x component relating to department 1
                  x_comp_1=  ( 1252) ; %the x component of 
                 y_comp_1= (( 1071- ( 564)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 52; %x component relating to department 1
                  x_comp_2=  ( 1252) ; %the x component of 
                 y_comp_2= (( 1071- ( 564)) / 1071 ) ; %the y component of 
           
                end
                
   %law LAW 53
                if PI_data(row,3) == 53; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 90)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 53; %x component relating to department 1
                  x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 90)) / 1071 ) ; %the y component of 
           
                end 
                
   %????  LIB   54
                if PI_data(row,3) == 54; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 54; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
                
   %english literature LIT 55
                if PI_data(row,3) == 55; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 55; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                                
             
  %landscape LSC 56
                if PI_data(row,3) == 56; %x component relating to department 1
                  x_comp_1=  ( 717) ; %the x component of 
                 y_comp_1= (( 1071- ( 277)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 56; %x component relating to department 1
                   x_comp_2=  ( 717) ; %the x component of 
                 y_comp_2= (( 1071- ( 277)) / 1071 ) ; %the y component of 
          
                end
                
   %materials MAT 57
                if PI_data(row,3) ==57; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 57; %x component relating to department 1
                   x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
         
                end
                
    %molecular biology and biotech, MBB  58
                if PI_data(row,3) == 58; %x component relating to department 1
                  x_comp_1=  ( 682 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 58; %x component relating to department 1
                    x_comp_2=  ( 682 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end 
                
    %HRR-health services research,  MCR  59
                if PI_data(row,3) == 59; %x component relating to department 1
                  x_comp_1=  ( 1233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 59; %x component relating to department 1
                    x_comp_2=  ( 1233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end 
                
    %FME-medical education, MDE  60
                if PI_data(row,3) == 60; %x component relating to department 1
                  x_comp_1=  ( 643 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 60; %x component relating to department 1
                    x_comp_2=  ( 643 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %mechanical MEC 61
                if PI_data(row,3) == 61; %x component relating to department 1
                  x_comp_1=  ( 1409 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 363)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 61;%x component relating to department 1
                   x_comp_2=  ( 1409 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 363)) / 1071 ) ; %the y component of 
          
                end              

     %chool of medicine MED  62
                if PI_data(row,3) == 62; %x component relating to department 1
                  x_comp_1=  ( 48 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 62; %x component relating to department 1
                    x_comp_2=  ( 48 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end 
                
                            
    %management MGT 63
                if PI_data(row,3) == 63; %x component relating to department 1
                  x_comp_1=  ( 1328) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 63; %x component relating to department 1
                   x_comp_2=  ( 1328) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
          
                end
                

                
  %modern languages MLT, (MLM is 64?)
                if PI_data(row,3) == 64; %x component relating to department 1
                  x_comp_1=  ( 1425) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 64; %x component relating to department 1
                    x_comp_2=  ( 1425) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
     %medical physics MPY 65
                if PI_data(row,3) == 65; %x component relating to department 1
                  x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 65; %x component relating to department 1
                     x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
                end   
                
 %music MUS 66
                if PI_data(row,3) == 66; %x component relating to department 1
                  x_comp_1=  ( 1102) ; %the x component of 
                 y_comp_1= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 66; %x component relating to department 1
                    x_comp_2=  ( 1102) ; %the x component of 
                 y_comp_2= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
    %neuroscience, NEU  67
                if PI_data(row,3) == 67; %x component relating to department 1
                  x_comp_1=  ( 487 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 67; %x component relating to department 1
                    x_comp_2=  ( 487 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end 
                
      %non-mammalian models group, NMM  68
                if PI_data(row,3) == 68; %x component relating to department 1
                  x_comp_1=  ( 603 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 68; %x component relating to department 1
                    x_comp_2=  ( 603 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nephrology NPH  69
                if PI_data(row,3) == 69; %x component relating to department 1
                  x_comp_1=  ( 413 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 69; %x component relating to department 1
                    x_comp_2=  ( 413 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nursing and midwifery NUR 70
                if PI_data(row,3) == 70; %x component relating to department 1
                  x_comp_1=  ( 519 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 70; %x component relating to department 1
                    x_comp_2=  ( 519 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end 
                
      %OMS, oral and maxillo-facial surgery, 71
                if PI_data(row,3) == 71; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 71; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end 
                
       %opthalmology OPH  72
                if PI_data(row,3) == 72; %x component relating to department 1
                  x_comp_1=  ( 90 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 72; %x component relating to department 1
                    x_comp_2=  ( 90 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end 
                
       %ORP, oral and maxillo-facial pathology, 73
                if PI_data(row,3) == 73; %x component relating to department 1
                  x_comp_1=  ( 380 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 780 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 73; %x component relating to department 1
                    x_comp_2=  ( 380 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 780 )) / 1071 ) ; %the y component of 
        
                end 
                
       %Child health PDT  74
                if PI_data(row,3) == 74; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 74; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                                 
  %Philosophy PHI, 75
                if PI_data(row,3) == 75; %x component relating to department 1
                  x_comp_1=  ( 1149 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==75; %x component relating to department 1
                     x_comp_2=  ( 1149 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
      %HRR- public health 76
                if PI_data(row,3) == 76; %x component relating to department 1
                  x_comp_1=  ( 1278 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 76; %x component relating to department 1
                    x_comp_2=  ( 1278 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %physics and astronomy PHY 77
                if PI_data(row,3) == 77; %x component relating to department 1
                  x_comp_1=  ( 868) ; %the x component of 
                 y_comp_1= (( 1071- ( 526)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 77; %x component relating to department 1
                    x_comp_2=  ( 868) ; %the x component of 
                 y_comp_2= (( 1071- ( 526)) / 1071 ) ; %the y component of 
          
                end
                
      %Platlet group PLG 78
                if PI_data(row,3) == 78; %x component relating to department 1
                  x_comp_1=  ( 233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 78; %x component relating to department 1
                    x_comp_2=  ( 233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end 
                
                 
  %politics POL 79
                if PI_data(row,3) == 79; %x component relating to department 1
                  x_comp_1=  ( 58) ; %the x component of 
                 y_comp_1= (( 1071- ( 324)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 79; %x component relating to department 1
                  x_comp_2=  ( 58) ; %the x component of 
                 y_comp_2= (( 1071- ( 324)) / 1071 ) ; %the y component of 
           
                end
                
      %academic unit of primary care PRC  80 (should be at northern
      %general)
                if PI_data(row,3) == 80; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 80; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end 
                
       %chinical psychiatry PSI 81
                if PI_data(row,3) == 81; %x component relating to department 1
                  x_comp_1=  ( 490 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 81; %x component relating to department 1
                    x_comp_2=  ( 490 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end 
                
                                     
    %Psycology PSY 82
                if PI_data(row,3) == 82; %x component relating to department 1
                  x_comp_1=  ( 235) ; %the x component of 
                 y_comp_1= (( 1071- ( 450)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 82; %x component relating to department 1
                   x_comp_2=  ( 235) ; %the x component of 
                 y_comp_2= (( 1071- ( 450)) / 1071 ) ; %the y component of 
          
                end 
     %pathology PTH  83
                if PI_data(row,3) == 83; %x component relating to department 1
                  x_comp_1=  ( 432 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 83; %x component relating to department 1
                    x_comp_2=  ( 432 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %pulmonary vascular group PVG 84
                if PI_data(row,3) == 84; %x component relating to department 1
                  x_comp_1=  ( 183 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 84; %x component relating to department 1
                    x_comp_2=  ( 183 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end 
                
     %radiology RAD  85
                if PI_data(row,3) == 85; %x component relating to department 1
                  x_comp_1=  ( 44 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 85; %x component relating to department 1
                    x_comp_2=  ( 44 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end 
                
     %reproductive and development med RPM  86
                if PI_data(row,3) == 86; %x component relating to department 1
                  x_comp_1=  ( 232 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 86; %x component relating to department 1
                    x_comp_2=  ( 232 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end 
                
      %adult dental care RSD  87
                if PI_data(row,3) == 87; %x component relating to department 1
                  x_comp_1=  ( 322 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 87; %x component relating to department 1
                    x_comp_2=  ( 322 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end 
                
       %respiratory medicine RSM   88
                if PI_data(row,3) == 88; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 88; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                    
 %Russian and slavonic, RUS, 89
                if PI_data(row,3) == 89; %x component relating to department 1
                  x_comp_1=  ( 1001 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 89; %x component relating to department 1
                   x_comp_2=  ( 1001 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
         
                end  
                
  %sociological studies SCS 90
                if PI_data(row,3) == 90; %x component relating to department 1
                  x_comp_1=  ( 87) ; %the x component of 
                 y_comp_1= (( 1071- ( 344)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 90; %x component relating to department 1
                   x_comp_2=  ( 87) ; %the x component of 
                 y_comp_2= (( 1071- ( 344)) / 1071 ) ; %the y component of 
           
                end
                  
  %maths and stats MAS/SOM 91
                if PI_data(row,3) == 91; %x component relating to department 1
                  x_comp_1=  ( 823 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 488)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 91; %x component relating to department 1
                    x_comp_2=  ( 823 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 488)) / 1071 ) ; %the y component of 
         
                end
                
       %surgical onocolgy SON  92
                if PI_data(row,3) == 92; %x component relating to department 1
                  x_comp_1=  ( 22 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 92; %x component relating to department 1
                    x_comp_2=  ( 22 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end 
                
     %human communication science SPE  93
                if PI_data(row,3) == 93; %x component relating to department 1
                  x_comp_1=  ( 309 ) ; %the x component of 
                 y_comp_1= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 93; %x component relating to department 1
                    x_comp_2=  ( 309 ) ; %the x component of 
                 y_comp_2= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %acad unit of supportive care SUP  94
                if PI_data(row,3) == 94; %x component relating to department 1
                  x_comp_1=  ( 119 ) ; %the x component of 
                 y_comp_1= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 94; %x component relating to department 1
                    x_comp_2=  ( 119 ) ; %the x component of 
                 y_comp_2= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                 
  %town/regional planning TRP 95
                if PI_data(row,3) == 95; %x component relating to department 1
                  x_comp_1=  ( 597 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 224)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 95; %x component relating to department 1
                   x_comp_2=  ( 597 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 224)) / 1071 ) ; %the y component of 
          
                end
  
      % urology URO  96
                if PI_data(row,3) == 96; %x component relating to department 1
                  x_comp_1=  ( 150 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 96; %x component relating to department 1
                    x_comp_2=  ( 150 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end 
                
     %vascular biology group VBG  97
                if PI_data(row,3) == 97; %x component relating to department 1
                  x_comp_1=  ( 134 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 97; %x component relating to department 1
                    x_comp_2=  ( 134 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end 
                
     %institute of work psychology WPS  98
                if PI_data(row,3) == 98; %x component relating to department 1
                  x_comp_1=  ( 1390 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 445 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 98; %x component relating to department 1
                    x_comp_2=  ( 1390 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 445 )) / 1071 )  ; %the y component of 
        
                end 

               
                PI_mat_2010(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2010(PI_data(count_back,2),PI_data(row,2)) = 1;
               

                 xy_PI_data_2010(PI_data(row,2),1) = x_comp_1 ; %the x component of 
                 xy_PI_data_2010(PI_data(count_back,2),1)= x_comp_2 ; %the x component of 
              
                 xy_PI_data_2010(PI_data(row,2),2)= y_comp_1; %the y component of
                 xy_PI_data_2010(PI_data(count_back,2),2)= y_comp_2; %the y component of
                              
                PI_dept_labels_2010(PI_data(row,2))=dept_labels(PI_data(row,3));
                PI_dept_labels_2010(PI_data(count_back,2))=dept_labels(PI_data(count_back,3));


           end
        end
    else
        grant_no = PI_data(row,1);
        count_back_to_row = row;
    end
end

for cell_row = 1:grid_area(2)
    PI_dept_labels_2011(cell_row) = {'2011'};
end
grant_no = PI_data(1,1);
count_back_to_row = 1;
for row = 2:1:r_size
    if PI_data(row,1) == grant_no
        if (PI_data(row,6) == 2011)
           for count_back = count_back_to_row:row-1

    %archeology AAP, number 1
                if PI_data(row,3) == 1; %x component relating to department 1
                 x_comp_1=  ( 1465) ; %the x component of 
                 y_comp_1= (( 1071- ( 514)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 1; %x component relating to department 1
                  x_comp_2= 1541-( 1465) ; %the x component of 
                 y_comp_2= (( 1071- (514)) / 1071 ) ; %the y component of   
                end
                
  %autocontron and systems, ACS, 2
                if PI_data(row,3) == 2; %x component relating to department 1
                  x_comp_1=    ( 1378 ) ; %the x component of 
                 y_comp_1=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 2; %x component relating to department 1
                    x_comp_2=    ( 1378 ) ; %the x component of 
                 y_comp_2=   (( 1071- ( 470)) / 1071 ) ; %the y component of 
        
                end  
 %AMRC advance manufacturing research centre AMRC  3 (is outside the main campus) 
                if PI_data(row,3) == 3; %x component relating to department 1
                  x_comp_1=  ( 1530 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 162 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 3; %x component relating to department 1
                    x_comp_2=  ( 1530 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 162 )) / 1071 )  ; %the y component of 
        
                end 
                
%Animal and plant APS 4
                if PI_data(row,3) == 4; %x component relating to department 1
                  x_comp_1=  ( 747 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 386)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 4; %x component relating to department 1
                    x_comp_2=  ( 747 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 386)) / 1071 ) ; %the y component of 
         
                end

                

   %architecture ARC 5
                if PI_data(row,3) == 5; %x component relating to department 1
                  x_comp_1=  ( 735) ; %the x component of 
                 y_comp_1= (( 1071- ( 259)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 5;  %x component relating to department 1
                   x_comp_2=  ( 735) ; %the x component of 
                 y_comp_2= (( 1071- ( 259)) / 1071 ) ; %the y component of 
          
                end
                
 %ARN ????? 6
                if PI_data(row,3) == 6; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 6; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
  %Bone biology 7
                if PI_data(row,3) == 7; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 7; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 824 )) / 1071 ) ; %the y component of 
        
                end 
                
  %biomedical genetics BGE 8
                if PI_data(row,3) == 8; %x component relating to department 1
                  x_comp_1=  ( 596 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 8; %x component relating to department 1
                    x_comp_2=  ( 596 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452 )) / 1071 ) ; %the y component of 
        
                end 
                
                                              
%Biblical studies BIB, number 9
                if PI_data(row,3) == 9; %x component relating to department 1
                  x_comp_1=  (1147) ; %the x component of 
                 y_comp_1= (( 1071- (525)) / 1071 ) ; %the y component of 
                end
                
                if PI_data(count_back,3) == 9; %x component relating to department 1
                   x_comp_2=  (1147) ; %the x component of 
                 y_comp_2= (( 1071- (525)) / 1071 ) ; %the y component of   
                end
                

 
   %biomedical BMS 10
                if PI_data(row,3) == 10; %x component relating to department 1
                  x_comp_1=  ( 658 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 10; %x component relating to department 1
                     x_comp_2=  ( 658 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 348)) / 1071 ) ; %the y component of 
        
                end
                
  %bone metabolism BON 11  - should be at northern general
                if PI_data(row,3) == 11; %x component relating to department 1
                  x_comp_1=  ( 121 ) ; %the x component of 
                 y_comp_1= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 11; %x component relating to department 1
                    x_comp_2=  ( 121 ) ; %the x component of 
                 y_comp_2= (( 1071-( 840 )) / 1071 ) ; %the y component of 
        
                end 
                
    %coronary artery disease group, CAG  12
                if PI_data(row,3) == 12; %x component relating to department 1
                  x_comp_1=  ( 248 ) ; %the x component of 
                 y_comp_1= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 12; %x component relating to department 1
                    x_comp_2=  ( 248 ) ; %the x component of 
                 y_comp_2= (( 1071-( 848 )) / 1071 ) ; %the y component of 
        
                end 
                
     %Oral health  13
                if PI_data(row,3) == 13; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 13; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cardiovascular science, CHL  14
                if PI_data(row,3) == 14; %x component relating to department 1
                  x_comp_1=  ( 210 ) ; %the x component of 
                 y_comp_1= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 14; %x component relating to department 1
                    x_comp_2=  ( 210 ) ; %the x component of 
                 y_comp_2= (( 1071-( 810 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                    
                               
  %chemistry CHM 15
                if PI_data(row,3) == 15; %x component relating to department 1
                  x_comp_1=  ( 808 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 306)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 15; %x component relating to department 1
                  x_comp_2=  ( 808 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 306)) / 1071 ) ; %the y component of 
          
                end
                
    %centre for human neutrition CHN   16
                if PI_data(row,3) == 16; %x component relating to department 1
                  x_comp_1=  ( 256 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 16; %x component relating to department 1
                    x_comp_2=  ( 256 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 735 )) / 1071 ) ; %the y component of 
        
                end 
                

                
                                                                   
  %civil and structural CIV 17
                if PI_data(row,3) == 17;%x component relating to department 1
                  x_comp_1=  ( 1366 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 397)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 17; %x component relating to department 1
                    x_comp_2=  ( 1366 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 397)) / 1071 ) ; %the y component of 
         
                end
     %clinical neurology CLN  18
                if PI_data(row,3) == 18; %x component relating to department 1
                  x_comp_1=  ( 471 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 18; %x component relating to department 1
                    x_comp_2=  ( 471 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 852 )) / 1071 ) ; %the y component of 
        
                end 
                
     %clinical onocology CLO 19
                if PI_data(row,3) == 19; %x component relating to department 1
                  x_comp_1=  ( 148 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 19; %x component relating to department 1
                    x_comp_2=  ( 148 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 579 )) / 1071 ) ; %the y component of 
        
                end 
                
                                        
  %computer COM 20
                if PI_data(row,3) == 20; %x component relating to department 1
                  x_comp_1=  ( 1248 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 452)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 20; %x component relating to department 1
                   x_comp_2=  ( 1248 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 452)) / 1071 ) ; %the y component of 
         
                end
                
  %chemical and biological CPE, 21
                if PI_data(row,3) == 21; %x component relating to department 1
                  x_comp_1=  ( 1451 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 247)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 21; %x component relating to department 1
                    x_comp_2=  ( 1451 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 247)) / 1071 ) ; %the y component of 
          
                end
     %clinical pharamcology CLN,  22
                if PI_data(row,3) == 22; %x component relating to department 1
                  x_comp_1=  ( 300 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 22; %x component relating to department 1
                    x_comp_2=  ( 300 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 894 )) / 1071 ) ; %the y component of 
        
                end 
                
      %cariovascular res unit, CRU  23
                if PI_data(row,3) == 23; %x component relating to department 1
                  x_comp_1=  ( 320 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 23; %x component relating to department 1
                    x_comp_2=  ( 320 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 710 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
   %detistry DEN 24
                if PI_data(row,3) == 24; %x component relating to department 1
                  x_comp_1=  ( 272 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 646)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 24; %x component relating to department 1
                   x_comp_2=  ( 272 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 646)) / 1071 ) ; %the y component of 
         
                end  
                
     %diabetes, endocr and metabolism, DEU  25
                if PI_data(row,3) == 25; %x component relating to department 1
                  x_comp_1=  ( 306 ) ; %the x component of 
                 y_comp_1= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 25; %x component relating to department 1
                    x_comp_2=  ( 306 ) ; %the x component of 
                 y_comp_2= (( 1071-( 823 )) / 1071 ) ; %the y component of 
        
                end 
                
      %advanced metallic systems DMT  26
                if PI_data(row,3) == 26; %x component relating to department 1
                  x_comp_1=  ( 1980) ; %the x component of 
                 y_comp_1= (( 1071-( 1071 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 26; %x component relating to department 1
                    x_comp_2=  ( 1980 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1071 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %east asian EAS 27
                if PI_data(row,3) == 27; %x component relating to department 1
                  x_comp_1=  ( 879) ; %the x component of 
                 y_comp_1= (( 1071- ( 597)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 27; %x component relating to department 1
                  x_comp_2=  ( 879) ; %the x component of 
                 y_comp_2= (( 1071- ( 597)) / 1071 ) ; %the y component of 
           
                end
                
  %economics ECN 28
                if PI_data(row,3) == 28; %x component relating to department 1
                  x_comp_1=  ( 1316) ; %the x component of 
                 y_comp_1= (( 1071- ( 448)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 28; %x component relating to department 1
                   x_comp_2=  ( 1316) ; %the x component of 
                 y_comp_2= (( 1071- ( 448)) / 1071 ) ; %the y component of 
          
                end
                
  %education EDU 29
                if PI_data(row,3) == 29; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 600)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 29; %x component relating to department 1
                   x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 600)) / 1071 ) ; %the y component of 
          
                end
                
    %electronic and electric EEE 30
                if PI_data(row,3) == 30; %x component relating to department 1
                  x_comp_1=  ( 1338 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 30; %x component relating to department 1
                   x_comp_2=  ( 1338 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
          
                end
                
    %english EGH 31
                if PI_data(row,3) == 31;%x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 31; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                
  %english language and linguistics ELL 32
                if PI_data(row,3) == 32; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 32; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
    %Faculty of arts, FCA  33
                if PI_data(row,3) == 33; %x component relating to department 1
                  x_comp_1=  ( 1020 ) ; %the x component of 
                 y_comp_1= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 33; %x component relating to department 1
                    x_comp_2=  ( 1020 ) ; %the x component of 
                 y_comp_2= (( 1071-414 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Engineering, FCE  34
                if PI_data(row,3) == 34; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 34; %x component relating to department 1
                    x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071-350 ) / 1071 ) ; %the y component of 
        
                end 
                
    %Faculty of Medicine FCM  35
                if PI_data(row,3) == 35; %x component relating to department 1
                  x_comp_1=  ( 287 ) ; %the x component of 
                 y_comp_1= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 35; %x component relating to department 1
                    x_comp_2=  ( 287 ) ; %the x component of 
                 y_comp_2= (( 1071-797 ) / 1071 ) ; %the y component of 
        
                end 
                
     %Faculty of science FCP 36
                if PI_data(row,3) == 36; %x component relating to department 1
                  x_comp_1=  ( 625 ) ; %the x component of 
                 y_comp_1= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 36; %x component relating to department 1
                    x_comp_2=  ( 625 ) ; %the x component of 
                 y_comp_2= (( 1071-446 ) / 1071 ) ; %the y component of 
        
                end 
                
                                                                   
  %french FRE, 37
                if PI_data(row,3) == 37; %x component relating to department 1
                  x_comp_1=  ( 1013) ; %the x component of 
                 y_comp_1= (( 1071- ( 403)) / 1071 );  %the y component of 
        
                end
                
                if PI_data(count_back,3) == 37; %x component relating to department 1
                    x_comp_2=  ( 1013) ; %the x component of 
                 y_comp_2= (( 1071- ( 403)) / 1071 );  %the y component of 
         
                end   
                
                                     
  %geography GEO 38
                if PI_data(row,3) == 38; %x component relating to department 1
                  x_comp_1=  ( 595) ; %the x component of 
                 y_comp_1= (( 1071- ( 174)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 38; %x component relating to department 1
                   x_comp_2=  ( 595) ; %the x component of 
                 y_comp_2= (( 1071- ( 174)) / 1071 ) ; %the y component of 
          
                end
                
    %ScHARR HAR 39
                if PI_data(row,3) == 39; %x component relating to department 1
                  x_comp_1=  ( 212 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 796)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 39; %x component relating to department 1
                    x_comp_2=  ( 212 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 796)) / 1071 ) ; %the y component of 
         
                end
                
      %institute for study of aging, HCE, 40
                if PI_data(row,3) == 40; %x component relating to department 1
                  x_comp_1=  ( 144 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 40; %x component relating to department 1
                    x_comp_2=  ( 144 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 733 )) / 1071 ) ; %the y component of 
        
                end 
                
       %health economics and decision sc, HCM,  41
                if PI_data(row,3) == 41; %x component relating to department 1
                  x_comp_1=  ( 1245 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 41; %x component relating to department 1
                    x_comp_2=  ( 1245 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 504 )) / 1071 ) ; %the y component of 
        
                end 
                
       %human metabolism, HMC,  42
                if PI_data(row,3) == 42; %x component relating to department 1
                  x_comp_1=  ( 273 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 42; %x component relating to department 1
                    x_comp_2=  ( 273 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 711 )) / 1071 ) ; %the y component of 
        
                end 
                
       %heamostasis group, HMT  43
                if PI_data(row,3) == 43; %x component relating to department 1
                  x_comp_1=  ( 791 ) ; %the x component of 
                 y_comp_1= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 43; %x component relating to department 1
                    x_comp_2=  ( 791 ) ; %the x component of 
                 y_comp_2= (( 1071-( 773 )) / 1071 ) ; %the y component of 
        
                end 
                
                          
       %humanities research institue, HRI  44
                if PI_data(row,3) == 44; %x component relating to department 1
                  x_comp_1=  ( 1117 ) ; %the x component of 
                 y_comp_1= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 44; %x component relating to department 1
                    x_comp_2=  ( 1117 ) ; %the x component of 
                 y_comp_2= (( 1071-( 518 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                         
      %History. HST, 45
                if PI_data(row,3) == 45;%x component relating to department 1
                  x_comp_1=  ( 1050) ; %the x component of 
                 y_comp_1= (( 1071- ( 455)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 45; %x component relating to department 1
                    x_comp_2=  ( 1050) ; %the x component of 
                 y_comp_2= (( 1071- ( 455)) / 1071 ) ; %the y component of 
                end  
                
     %institute for cancer studies, ICS 46
                if PI_data(row,3) == 46; %x component relating to department 1
                  x_comp_1=  ( 143 ) ; %the x component of 
                 y_comp_1= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 46; %x component relating to department 1
                    x_comp_2=  ( 143 ) ; %the x component of 
                 y_comp_2= (( 1071-( 770 )) / 1071 ) ; %the y component of 
        
                end 
                
      %infection and immunity, III 47
                if PI_data(row,3) == 47; %x component relating to department 1
                  x_comp_1=  ( 132 ) ; %the x component of 
                 y_comp_1= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==47 ; %x component relating to department 1
                    x_comp_2=  ( 132 ) ; %the x component of 
                 y_comp_2= (( 1071-( 718 )) / 1071 ) ; %the y component of 
        
                end 
                
                                       
  %information INF 48
                if PI_data(row,3) == 48; %x component relating to department 1
                  x_comp_1=  ( 1289) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 48; %x component relating to department 1
                   x_comp_2=  ( 1289) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
          
                end
    %infectious dieseases 49
                if PI_data(row,3) == 49; %x component relating to department 1
                  x_comp_1=  ( 313 ) ; %the x component of 
                 y_comp_1= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 49; %x component relating to department 1
                    x_comp_2=  ( 313 ) ; %the x component of 
                 y_comp_2= (( 1071-( 700 )) / 1071 ) ; %the y component of 
        
                end 
                
    %information resources, INR 50
                if PI_data(row,3) == 50; %x component relating to department 1
                  x_comp_1=  ( 1299 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 50; %x component relating to department 1
                    x_comp_2=  ( 1299 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 499 )) / 1071 ) ; %the y component of 
        
                end 
                
     %inflammatory signalling group, INF  51
                if PI_data(row,3) == 51; %x component relating to department 1
                  x_comp_1=  ( 202 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 51; %x component relating to department 1
                    x_comp_2=  ( 202 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 762 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                      
  %journalism JNL 52
                if PI_data(row,3) == 52; %x component relating to department 1
                  x_comp_1=  ( 1252) ; %the x component of 
                 y_comp_1= (( 1071- ( 564)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 52; %x component relating to department 1
                  x_comp_2=  ( 1252) ; %the x component of 
                 y_comp_2= (( 1071- ( 564)) / 1071 ) ; %the y component of 
           
                end
                
   %law LAW 53
                if PI_data(row,3) == 53; %x component relating to department 1
                  x_comp_1=  ( 633) ; %the x component of 
                 y_comp_1= (( 1071- ( 90)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 53; %x component relating to department 1
                  x_comp_2=  ( 633) ; %the x component of 
                 y_comp_2= (( 1071- ( 90)) / 1071 ) ; %the y component of 
           
                end 
                
   %????  LIB   54
                if PI_data(row,3) == 54; %x component relating to department 1
                  x_comp_1=  ( 1 ) ; %the x component of 
                 y_comp_1= (( 0 ) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 54; %x component relating to department 1
                    x_comp_2=  ( 1 ) ; %the x component of 
                 y_comp_2= (( 0 ) / 1071 ) ; %the y component of 
        
                end 
                
                
   %english literature LIT 55
                if PI_data(row,3) == 55; %x component relating to department 1
                  x_comp_1=  (1006) ; %the x component of 
                 y_comp_1= (( 1071- (388)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 55; %x component relating to department 1
                   x_comp_2=  (1006) ; %the x component of 
                 y_comp_2= (( 1071- (388)) / 1071 ) ; %the y component of 
         
                end
                                
             
  %landscape LSC 56
                if PI_data(row,3) == 56; %x component relating to department 1
                  x_comp_1=  ( 717) ; %the x component of 
                 y_comp_1= (( 1071- ( 277)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 56; %x component relating to department 1
                   x_comp_2=  ( 717) ; %the x component of 
                 y_comp_2= (( 1071- ( 277)) / 1071 ) ; %the y component of 
          
                end
                
   %materials MAT 57
                if PI_data(row,3) ==57; %x component relating to department 1
                  x_comp_1=  ( 1384 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 346)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 57; %x component relating to department 1
                   x_comp_2=  ( 1384 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 346)) / 1071 ) ; %the y component of 
         
                end
                
    %molecular biology and biotech, MBB  58
                if PI_data(row,3) == 58; %x component relating to department 1
                  x_comp_1=  ( 682 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 58; %x component relating to department 1
                    x_comp_2=  ( 682 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 344 )) / 1071 ) ; %the y component of 
        
                end 
                
    %HRR-health services research,  MCR  59
                if PI_data(row,3) == 59; %x component relating to department 1
                  x_comp_1=  ( 1233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 59; %x component relating to department 1
                    x_comp_2=  ( 1233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 481 )) / 1071 ) ; %the y component of 
        
                end 
                
    %FME-medical education, MDE  60
                if PI_data(row,3) == 60; %x component relating to department 1
                  x_comp_1=  ( 643 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 60; %x component relating to department 1
                    x_comp_2=  ( 643 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 725 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %mechanical MEC 61
                if PI_data(row,3) == 61; %x component relating to department 1
                  x_comp_1=  ( 1409 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 363)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 61;%x component relating to department 1
                   x_comp_2=  ( 1409 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 363)) / 1071 ) ; %the y component of 
          
                end              

     %chool of medicine MED  62
                if PI_data(row,3) == 62; %x component relating to department 1
                  x_comp_1=  ( 48 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 62; %x component relating to department 1
                    x_comp_2=  ( 48 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 825 )) / 1071 ) ; %the y component of 
        
                end 
                
                            
    %management MGT 63
                if PI_data(row,3) == 63; %x component relating to department 1
                  x_comp_1=  ( 1328) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 63; %x component relating to department 1
                   x_comp_2=  ( 1328) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
          
                end
                

                
  %modern languages MLT, (MLM is 64?)
                if PI_data(row,3) == 64; %x component relating to department 1
                  x_comp_1=  ( 1425) ; %the x component of 
                 y_comp_1= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 64; %x component relating to department 1
                    x_comp_2=  ( 1425) ; %the x component of 
                 y_comp_2= (( 1071- ( 499)) / 1071 ) ; %the y component of 
        
                end
                
     %medical physics MPY 65
                if PI_data(row,3) == 65; %x component relating to department 1
                  x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 65; %x component relating to department 1
                     x_comp_1=  ( 870) ; %the x component of 
                 y_comp_1= (( 1071- ( 530)) / 1071 ) ; %the y component of 
                end   
                
 %music MUS 66
                if PI_data(row,3) == 66; %x component relating to department 1
                  x_comp_1=  ( 1102) ; %the x component of 
                 y_comp_1= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 66; %x component relating to department 1
                    x_comp_2=  ( 1102) ; %the x component of 
                 y_comp_2= (( 1071- ( 433 )) / 1071 ) ; %the y component of 
        
                end
                
    %neuroscience, NEU  67
                if PI_data(row,3) == 67; %x component relating to department 1
                  x_comp_1=  ( 487 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 67; %x component relating to department 1
                    x_comp_2=  ( 487 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 924 )) / 1071 ) ; %the y component of 
        
                end 
                
      %non-mammalian models group, NMM  68
                if PI_data(row,3) == 68; %x component relating to department 1
                  x_comp_1=  ( 603 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 68; %x component relating to department 1
                    x_comp_2=  ( 603 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 368 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nephrology NPH  69
                if PI_data(row,3) == 69; %x component relating to department 1
                  x_comp_1=  ( 413 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 69; %x component relating to department 1
                    x_comp_2=  ( 413 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 833 )) / 1071 ) ; %the y component of 
        
                end 
                
     %nursing and midwifery NUR 70
                if PI_data(row,3) == 70; %x component relating to department 1
                  x_comp_1=  ( 519 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 70; %x component relating to department 1
                    x_comp_2=  ( 519 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 779 )) / 1071 ) ; %the y component of 
        
                end 
                
      %OMS, oral and maxillo-facial surgery, 71
                if PI_data(row,3) == 71; %x component relating to department 1
                  x_comp_1=  ( 376 ) ; %the x component of 
                 y_comp_1= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 71; %x component relating to department 1
                    x_comp_2=  ( 376 ) ; %the x component of 
                 y_comp_2= (( 1071 - (773 )) / 1071 ) ; %the y component of 
        
                end 
                
       %opthalmology OPH  72
                if PI_data(row,3) == 72; %x component relating to department 1
                  x_comp_1=  ( 90 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 72; %x component relating to department 1
                    x_comp_2=  ( 90 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 881 )) / 1071 ) ; %the y component of 
        
                end 
                
       %ORP, oral and maxillo-facial pathology, 73
                if PI_data(row,3) == 73; %x component relating to department 1
                  x_comp_1=  ( 380 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 780 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 73; %x component relating to department 1
                    x_comp_2=  ( 380 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 780 )) / 1071 ) ; %the y component of 
        
                end 
                
       %Child health PDT  74
                if PI_data(row,3) == 74; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 74; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071 - ( 510 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                                 
  %Philosophy PHI, 75
                if PI_data(row,3) == 75; %x component relating to department 1
                  x_comp_1=  ( 1149 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) ==75; %x component relating to department 1
                     x_comp_2=  ( 1149 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 552)) / 1071 ) ; %the y component of 
        
                end
                
      %HRR- public health 76
                if PI_data(row,3) == 76; %x component relating to department 1
                  x_comp_1=  ( 1278 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 76; %x component relating to department 1
                    x_comp_2=  ( 1278 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 542 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                       
  %physics and astronomy PHY 77
                if PI_data(row,3) == 77; %x component relating to department 1
                  x_comp_1=  ( 868) ; %the x component of 
                 y_comp_1= (( 1071- ( 526)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 77; %x component relating to department 1
                    x_comp_2=  ( 868) ; %the x component of 
                 y_comp_2= (( 1071- ( 526)) / 1071 ) ; %the y component of 
          
                end
                
      %Platlet group PLG 78
                if PI_data(row,3) == 78; %x component relating to department 1
                  x_comp_1=  ( 233 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 78; %x component relating to department 1
                    x_comp_2=  ( 233 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 963 )) / 1071 ) ; %the y component of 
        
                end 
                
                 
  %politics POL 79
                if PI_data(row,3) == 79; %x component relating to department 1
                  x_comp_1=  ( 58) ; %the x component of 
                 y_comp_1= (( 1071- ( 324)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 79; %x component relating to department 1
                  x_comp_2=  ( 58) ; %the x component of 
                 y_comp_2= (( 1071- ( 324)) / 1071 ) ; %the y component of 
           
                end
                
      %academic unit of primary care PRC  80 (should be at northern
      %general)
                if PI_data(row,3) == 80; %x component relating to department 1
                  x_comp_1=  ( 47 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 80; %x component relating to department 1
                    x_comp_2=  ( 47 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 927 )) / 1071 ) ; %the y component of 
        
                end 
                
       %chinical psychiatry PSI 81
                if PI_data(row,3) == 81; %x component relating to department 1
                  x_comp_1=  ( 490 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 81; %x component relating to department 1
                    x_comp_2=  ( 490 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1019 )) / 1071 ) ; %the y component of 
        
                end 
                
                                     
    %Psycology PSY 82
                if PI_data(row,3) == 82; %x component relating to department 1
                  x_comp_1=  ( 235) ; %the x component of 
                 y_comp_1= (( 1071- ( 450)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 82; %x component relating to department 1
                   x_comp_2=  ( 235) ; %the x component of 
                 y_comp_2= (( 1071- ( 450)) / 1071 ) ; %the y component of 
          
                end 
     %pathology PTH  83
                if PI_data(row,3) == 83; %x component relating to department 1
                  x_comp_1=  ( 432 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 83; %x component relating to department 1
                    x_comp_2=  ( 432 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %pulmonary vascular group PVG 84
                if PI_data(row,3) == 84; %x component relating to department 1
                  x_comp_1=  ( 183 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 84; %x component relating to department 1
                    x_comp_2=  ( 183 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 931 )) / 1071 ) ; %the y component of 
        
                end 
                
     %radiology RAD  85
                if PI_data(row,3) == 85; %x component relating to department 1
                  x_comp_1=  ( 44 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 85; %x component relating to department 1
                    x_comp_2=  ( 44 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 888 )) / 1071 ) ; %the y component of 
        
                end 
                
     %reproductive and development med RPM  86
                if PI_data(row,3) == 86; %x component relating to department 1
                  x_comp_1=  ( 232 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 86; %x component relating to department 1
                    x_comp_2=  ( 232 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 673 )) / 1071 ) ; %the y component of 
        
                end 
                
      %adult dental care RSD  87
                if PI_data(row,3) == 87; %x component relating to department 1
                  x_comp_1=  ( 322 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 87; %x component relating to department 1
                    x_comp_2=  ( 322 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 625 )) / 1071 ) ; %the y component of 
        
                end 
                
       %respiratory medicine RSM   88
                if PI_data(row,3) == 88; %x component relating to department 1
                  x_comp_1=  ( 411 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 88; %x component relating to department 1
                    x_comp_2=  ( 411 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 820 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                                                    
 %Russian and slavonic, RUS, 89
                if PI_data(row,3) == 89; %x component relating to department 1
                  x_comp_1=  ( 1001 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 459)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 89; %x component relating to department 1
                   x_comp_2=  ( 1001 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 459)) / 1071 ) ; %the y component of 
         
                end  
                
  %sociological studies SCS 90
                if PI_data(row,3) == 90; %x component relating to department 1
                  x_comp_1=  ( 87) ; %the x component of 
                 y_comp_1= (( 1071- ( 344)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 90; %x component relating to department 1
                   x_comp_2=  ( 87) ; %the x component of 
                 y_comp_2= (( 1071- ( 344)) / 1071 ) ; %the y component of 
           
                end
                  
  %maths and stats MAS/SOM 91
                if PI_data(row,3) == 91; %x component relating to department 1
                  x_comp_1=  ( 823 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 488)) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 91; %x component relating to department 1
                    x_comp_2=  ( 823 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 488)) / 1071 ) ; %the y component of 
         
                end
                
       %surgical onocolgy SON  92
                if PI_data(row,3) == 92; %x component relating to department 1
                  x_comp_1=  ( 22 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 92; %x component relating to department 1
                    x_comp_2=  ( 22 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 722 )) / 1071 ) ; %the y component of 
        
                end 
                
     %human communication science SPE  93
                if PI_data(row,3) == 93; %x component relating to department 1
                  x_comp_1=  ( 309 ) ; %the x component of 
                 y_comp_1= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 93; %x component relating to department 1
                    x_comp_2=  ( 309 ) ; %the x component of 
                 y_comp_2= (( 1071-( 563 )) / 1071 ) ; %the y component of 
        
                end 
                
      %acad unit of supportive care SUP  94
                if PI_data(row,3) == 94; %x component relating to department 1
                  x_comp_1=  ( 119 ) ; %the x component of 
                 y_comp_1= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 94; %x component relating to department 1
                    x_comp_2=  ( 119 ) ; %the x component of 
                 y_comp_2= (( 1071-( 914 )) / 1071 ) ; %the y component of 
        
                end 
                
                                                 
  %town/regional planning TRP 95
                if PI_data(row,3) == 95; %x component relating to department 1
                  x_comp_1=  ( 597 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 224)) / 1071 ) ; %the y component of 
        
               end
                
                if PI_data(count_back,3) == 95; %x component relating to department 1
                   x_comp_2=  ( 597 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 224)) / 1071 ) ; %the y component of 
          
                end
  
      % urology URO  96
                if PI_data(row,3) == 96; %x component relating to department 1
                  x_comp_1=  ( 150 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 96; %x component relating to department 1
                    x_comp_2=  ( 150 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 965 )) / 1071 ) ; %the y component of 
        
                end 
                
     %vascular biology group VBG  97
                if PI_data(row,3) == 97; %x component relating to department 1
                  x_comp_1=  ( 134 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 97; %x component relating to department 1
                    x_comp_2=  ( 134 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 1115 )) / 1071 ) ; %the y component of 
        
                end 
                
     %institute of work psychology WPS  98
                if PI_data(row,3) == 98; %x component relating to department 1
                  x_comp_1=  ( 1390 ) ; %the x component of 
                 y_comp_1= (( 1071- ( 445 )) / 1071 ) ; %the y component of 
        
                end
                
                if PI_data(count_back,3) == 98; %x component relating to department 1
                    x_comp_2=  ( 1390 ) ; %the x component of 
                 y_comp_2= (( 1071- ( 445 )) / 1071 )  ; %the y component of 
        
                end 

               
                PI_mat_2011(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2011(PI_data(count_back,2),PI_data(row,2)) = 1;
               

                 xy_PI_data_2011(PI_data(row,2),1) = x_comp_1 ; %the x component of 
                 xy_PI_data_2011(PI_data(count_back,2),1)= x_comp_2 ; %the x component of 
              
                 xy_PI_data_2011(PI_data(row,2),2)= y_comp_1; %the y component of
                 xy_PI_data_2011(PI_data(count_back,2),2)= y_comp_2; %the y component of
                              
                PI_dept_labels_2011(PI_data(row,2))=dept_labels(PI_data(row,3));
                PI_dept_labels_2011(PI_data(count_back,2))=dept_labels(PI_data(count_back,3));


           end            
        end
    else
        grant_no = PI_data(row,1);
        count_back_to_row = row;
    end
end

PI_mat_sparse_2009 = sparse(PI_mat_2009);
PI_mat_sparse_2010 = sparse(PI_mat_2010);
PI_mat_sparse_2011 = sparse(PI_mat_2011);



            

graph_draw(PI_mat_sparse_2009,xy_PI_data_2009,'labels',PI_dept_labels_2009,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);
figure;
graph_draw(PI_mat_sparse_2010,xy_PI_data_2010,'labels',PI_dept_labels_2010,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);
figure;
graph_draw(PI_mat_sparse_2011,xy_PI_data_2011,'labels',PI_dept_labels_2011,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);


        
        
        