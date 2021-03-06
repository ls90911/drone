function [ ] = plot_actuator()
%PLOT_ACTUATOR ????????????
%   ????????
global actuator_states time drone_states desired_omega pointer
figure(1);
desired_omega(:,pointer) = desired_omega(:,end);
subplot(2,2,1)
plot(time,actuator_states(1,:),time,desired_omega(1,:));

subplot(2,2,2)
plot(time,actuator_states(2,:),time,desired_omega(2,:));
subplot(2,2,3)
plot(time,actuator_states(3,:),time,desired_omega(3,:));
subplot(2,2,4)
plot(time,actuator_states(4,:),time,desired_omega(4,:));


figure(2)
subplot(4,3,1)
plot(time,drone_states(1,:));
subplot(4,3,2)
plot(time,drone_states(2,:));
subplot(4,3,3)
plot(time,drone_states(3,:));
subplot(4,3,4)
plot(time,drone_states(4,:));
subplot(4,3,5)
plot(time,drone_states(5,:));
subplot(4,3,6)
plot(time,drone_states(6,:));
subplot(4,3,7)
plot(time,drone_states(7,:));
subplot(4,3,8)
plot(time,drone_states(8,:));
subplot(4,3,9)
plot(time,drone_states(9,:));
subplot(4,3,10)
plot(time,drone_states(10,:));
subplot(4,3,11)
plot(time,drone_states(11,:));
subplot(4,3,12)
plot(time,drone_states(12,:));


end

