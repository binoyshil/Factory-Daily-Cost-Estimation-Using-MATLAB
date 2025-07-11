    
function [amount,material_one] = materials()
disp('----------------------------------------');
disp('  Material     Density     Cost (/cm³) ');
disp('----------------------------------------');
disp(' 1. Steel        7.85        $0.10');
disp(' 2. Aluminum     2.70        $0.08');
disp(' 3. ABS Plastic  1.20        $0.05');
disp('----------------------------------------');

which_material = input('Enter  = ');
if which_material ==1
    amount = 0.10;
    material_one = 'Steel';
elseif which_material ==2
    amount =0.08;
    material_one ='Aluminum';

elseif which_material ==3
    amount = 0.05;
    material_one = 'ABS Plastic';

end
