function [] = main()
%MAIN ????????????
%   ????????
global simulation_time step pointer;
global drone_states actuator_states;
global i time desired_omega desired_angular_velocity
global desired_angle desired_velocity_body desired_position m g
global_parameters();
%desired_angular_velocity = zeros(3,simulation_time/step);
for i = 0:step:simulation_time
    desired_position(:,pointer) = [1 1 -1]';
    % 2*sin(2*pi/5*i)
    desired_psi = 0;
    [ desired_velocity_body(:,pointer) ] = controller_position_PID(desired_position(:,pointer));
   % desired_velocity_body(:,pointer) = [0 1 0]';
   %% velocity controller
   %desired_velocity_body(:,pointer) = [0 0 -5]';
    [ desired_angle(1:2,pointer),F ] = controller_velocity_body_PID( desired_velocity_body(:,pointer) );
    desired_angle(3,pointer) = desired_psi;
 %% angle controller
  %desired_angle(:,pointer) = [2 0 0]';
    desired_angular_velocity(:,pointer) = controller_angle_PID( desired_angle(:,pointer));
    %temp = desired_angular_velocity(:,pointer)
 %% angular velocity controller   
%  F = m*g;
%     desired_angular_velocity(:,pointer) = [1 0 0]';
    M = controller_angular_velocity_PID( desired_angular_velocity(:,pointer));
    desired_omega(:,pointer) = convert_force_2_omega(F,M);
    %% actuator dynamics
    actuator_states(:,pointer+1) = runge_kutta_actuator(actuator_states(:,pointer),desired_omega(:,pointer));
    
    %% drone dynamics
    drone_states(:,pointer+1) = runge_kutta_drone(drone_states(:,pointer),actuator_states(:,pointer+1));
    %%
    pointer = pointer+1;
    time(pointer) = i;
end

plot_actuator();
end

