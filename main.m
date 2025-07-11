

disp("All Shapes are here .");
disp("1.Solid Cylinder ");
disp("2. Hollow Cylinder ");
disp("3.Rectangular Plate ");
disp("4. Sphere");
how_many = input('How many Items = ');


volume_solid =0;
amount_solid =0;
volume_hollow=0;
amount_hollow =0;
volume_rec =0;
amount_rec =0;
volume_sphere =0;
amount_sphere =0;


total_amount = 0;

% Calculating the total amount of volume,costs of all shapes individualy and storing in variables . 

for i=1:how_many
which_shape = input("Enter the Shape(1-4) = ");

switch which_shape
    case 1 
        disp('Solid Cylinder ');
        radius = input('Enter the radius = ');
        height = input('Enter the height = ');
        quantity_solid = input("Enter Quantity = ");
        
        volume_solid = volume_solid+3.1416*radius^2*height*quantity_solid;
          [amount,material_one] = materials();
        amount_solid = amount*volume_solid;
        total_amount = total_amount+ amount_solid;


    case 2
        disp('Hollow Cylinder ');
        inner_r = input('Enter the inner Radius = ');
        outter_r = input('Enter the outter Radius = ');
        height_hollow = input('Enter the height or length = ');
        quantity_hollow = input('Enter Quantity = ');
        volume_hollow =volume_hollow+ 3.1416*(outter_r^2-inner_r^2)*height_hollow*quantity_hollow;
        [amount,material_one] = materials();
        amount_hollow = amount*volume_hollow;
        total_amount = total_amount+ amount_hollow;

    case 3
        disp('Rectangula Plate');
        length_rec = input('Enter the length = ');
        width_rec = input('Enter the Width = ');
        thickness_rec = input('Enter the thickness = ');
        quantity_rec = input("Enter Quantity = ");
        volume_rec =volume_rec+ length_rec*width_rec*thickness_rec*quantity_rec;
          [amount,material_one] = materials();
        amount_rec = amount*volume_rec;
        
        total_amount = total_amount+ amount_rec;
       
    case 4
        disp('Sphere ');
        radius_sphere = input('Enter the radius = ');
        quantity_sphere = input('Enter Quantity = ');
         volume_sphere = volume_sphere+ 4*3.1416*radius_sphere^3/3*quantity_sphere;

             [amount,material_one] = materials();
        amount_sphere = amount*volume_sphere;
        total_amount = total_amount+ amount_sphere;

end


% Calculating the operational costs of the production. 



end

disp('----------------------------------------------------------');
disp('  Machining Type     Description                   Cost Multiplier');
disp('----------------------------------------------------------');
disp(' 1. Turning            Lathe-based operations        1.15 (adds 15%)');
disp(' 2. Milling            CNC or manual milling         1.10 (adds 10%)');
disp(' 3. 3D Printing        Additive manufacturing (FDM)  1.05 (adds 5%)');
disp('----------------------------------------------------------');

operation_cost_milling = 0;
operation_cost_turning = 0;
operation_cost_3d = 0;
total_operation_cost =0;
materials_costs_total = amount_sphere+amount_rec+amount_hollow+amount_solid;



how_many_operation = input('How many operations = ');
for k =1:how_many_operation
    which_operation = input("Which operation = ");
    if which_operation ==1

    operation_cost_turning =(total_amount*1.15)-total_amount;
    total_operation_cost= total_operation_cost +operation_cost_turning;
    elseif which_operation ==2
        operation_cost_milling= (total_amount*1.10)-total_amount;
         total_operation_cost= total_operation_cost+operation_cost_milling;
    elseif which_operation ==3
         operation_cost_3d =(total_amount*1.05)-total_amount;
         total_operation_cost= total_operation_cost+operation_cost_3d;
    end
end

% Calculating the total man power costs 

disp(' $2.5/hour for workers');
how_many_worker = input("How many workers = ");
how_many_hour = input('How much hours = ');
man_power_wages = how_many_hour*how_many_worker*2.5;
total_amount = total_amount+man_power_wages;

% Calculating the Electricity costs 

disp('Electricity cost -- 1 Unit = 0.50$');
how_unit = input("How much unit = ");

electricity_cost = how_unit*0.50;
total_amount = total_amount+electricity_cost;

% Calculation of other expenses . 

disp('Other COSTS ---');
how_other = input('How much = ');
total_amount = total_amount +how_other;

disp('----------------------');

% Report Submission 

disp('DAILY FACTORY COST ESTIMATION REPORT');

disp('Product Slip ------');
disp('1. Solid Cylinder ');
fprintf('Materials amount = %0.2f',volume_solid);
fprintf('Materials Cost = %0.2f\n',amount_solid);

disp('2. Hollow Cylinder ');
fprintf('Materials amount = %0.2f',volume_hollow);
fprintf('Materials Cost = %0.2f\n',amount_hollow);

disp('3. Rectangular Plate ');
fprintf('Materials amount = %0.2f',volume_rec);
fprintf('Materials Cost = %0.2f\n',amount_rec);

disp('4. Sphere ');
fprintf('Materials amount = %0.2f',volume_sphere);
fprintf('Materials Cost = %0.2f\n',amount_sphere);

disp('-------Operation Cost-------');
fprintf('1.Turning Operation , Cost = %0.2f\n',operation_cost_turning);
fprintf('2.Machining Operation , Cost = %0.2f\n',operation_cost_milling);
fprintf('3.3D Printing, Cost = %0.2f\n',operation_cost_3d);
fprintf('Total Operational Cost = %0.2f\n',total_operation_cost);

disp('-------------------------------------');
fprintf('Man Power cost = %0.2f\n',man_power_wages);
fprintf('Electricity Cost = %0.2f\n',electricity_cost);
fprintf('Other Cost = %0.2f\n',how_other);
disp('--------------------------------');
fprintf('TOTAL Amount = %0.2f',total_amount);



% 1. Pie Chart – Factory Cost Breakdown

costs = [materials_costs_total, total_operation_cost, man_power_wages, electricity_cost, how_other];
labels = {'Material', 'Machining', 'Manpower', 'Electricity', 'Others'};

figure;
pie(costs, labels);
title('Factory Cost Distribution');



% 2. Bar Chart – Material Cost by Shape

shapes = {'Solid Cylinder', 'Hollow Cylinder', 'Rectangular Plate', 'Sphere'};
shape_costs = [amount_solid, amount_hollow, amount_rec, amount_sphere];

figure;
bar(shape_costs, 'FaceColor', [0.2 0.6 0.8]);  % Light blue bars
set(gca, 'XTickLabel', shapes);
xlabel('Geometry Type');
ylabel('Material Cost ($)');
title('Material Cost by Shape');
grid on;



% 3. Bar Chart – Operation Cost by Process

operations = {'Turning', 'Milling', '3D Printing'};
op_costs = [operation_cost_turning, operation_cost_milling, operation_cost_3d];

figure;
bar(op_costs, 'FaceColor', [0.9 0.4 0.3]);  % Warm red-orange bars
set(gca, 'XTickLabel', operations);
xlabel('Machining Process');
ylabel('Operation Cost ($)');
title('Operation Cost by Process');
grid on;
