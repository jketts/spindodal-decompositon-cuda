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
                PI_mat_2009(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2009(PI_data(count_back,2),PI_data(row,2)) = 1;
                xy_PI_data_2009(PI_data(row,2),1)=PI_data(row,5);
                xy_PI_data_2009(PI_data(count_back,2),1)=PI_data(count_back,5);
                xy_PI_data_2009(PI_data(row,2),2)=PI_data(row,4);
                xy_PI_data_2009(PI_data(count_back,2),2)=PI_data(count_back,4);
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
                PI_mat_2010(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2010(PI_data(count_back,2),PI_data(row,2)) = 1;
                xy_PI_data_2010(PI_data(row,2),1)=PI_data(row,5);
                xy_PI_data_2010(PI_data(count_back,2),1)=PI_data(count_back,5);
                xy_PI_data_2010(PI_data(row,2),2)=PI_data(row,4);
                xy_PI_data_2010(PI_data(count_back,2),2)=PI_data(count_back,4);
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
                PI_mat_2011(PI_data(row,2),PI_data(count_back,2)) = 1;
                PI_mat_2011(PI_data(count_back,2),PI_data(row,2)) = 1;
                xy_PI_data_2011(PI_data(row,2),1)=PI_data(row,5);
                xy_PI_data_2011(PI_data(count_back,2),1)=PI_data(count_back,5);
                xy_PI_data_2011(PI_data(row,2),2)=PI_data(row,4);
                xy_PI_data_2011(PI_data(count_back,2),2)=PI_data(count_back,4);
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

for i = 1:grid_area(2)
    for j = 1:grid_area(2)
        if PI_mat_2010(i,j)>0.5
            if xy_PI_data_2010(i,1) < 0.01
                i 
                j
            end
            if xy_PI_data_2010(i,2) < 0.01
                i 
                j
            end
        end
    end
end

            

graph_draw(PI_mat_sparse_2009,xy_PI_data_2009,'labels',PI_dept_labels_2009,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);
figure;
graph_draw(PI_mat_sparse_2010,xy_PI_data_2010,'labels',PI_dept_labels_2010,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);
figure;
graph_draw(PI_mat_sparse_2011,xy_PI_data_2011,'labels',PI_dept_labels_2011,'fontsize',9,'linestyle','--','linecolor','green','linewidth',1);


        
        
        