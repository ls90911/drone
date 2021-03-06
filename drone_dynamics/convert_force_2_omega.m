function [ omega_needed ] = convert_force_2_omega(F,M)
%CONVERT_FORCE_2_OMEGA ????????????
%   ????????
global k_F L k_M
matrix_omega_2_force = [k_F k_F k_F k_F; 0 k_F*L 0 -k_F*L;...
    -k_F*L 0 k_F*L 0; k_M -k_M k_M -k_M];
matrix_force_2_omega = inv(matrix_omega_2_force);

omega_needed = sqrt(matrix_force_2_omega * [F;M]);
end

