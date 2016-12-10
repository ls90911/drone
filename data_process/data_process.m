function [ output_args ] = data_process( input_args )
%DATA_PROCESS ????????????????????????
%   ????????????????
flight_raw_data = csvread('yellow_set_theta_3.csv');
[m,n] = size(flight_raw_data);
m = 2500;  %!!!!!!!!!!!!!!!!!
flight_data = zeros(1,n+6);
id_counter = 1;
id_time = 2;

id_p = 3;
id_q = 4;
id_r = 5;

id_ax_body = 6;
id_ay_body = 7;
id_az_body = 8;

id_phi = 12;
id_theta = 13;
id_psi = 14;

id_x = 15;
id_y = 16;
id_z = 17;

id_vx = 18;
id_vy = 19;
id_vz = 20;

id_command_trust = 21;

id_sp_phi = 22;
id_sp_theta = 23;
id_sp_psi = 24;

id_rpm_ref1 = 27;
id_rpm_ref2 = 28;
id_rpm_ref3 = 29;
id_rpm_ref4 = 30;

id_rpm_obs1 = 31;
id_rpm_obs2 = 32;
id_rpm_obs3 = 33;
id_rpm_obs4 = 34;

id_vx_body = 36;
id_vy_body = 37;
id_vz_body = 38;

id_ax = 39;
id_ay = 40;
id_az = 41;


p = 1;
x_temp = 10000;

for i = 1:m

if flight_raw_data(i,id_x) == x_temp
    continue;
else
    flight_data(p,1:n) = flight_raw_data(i,:);
    flight_data(p,id_p:id_r) = flight_raw_data(i,id_p:id_r)*0.0139882;
    flight_data(p,id_ax_body:id_az_body) = flight_raw_data(i,id_ax_body:id_az_body)*0.0009766;
    x_temp = flight_raw_data(i,id_x);
    p = p+1;
end
end

v_earth = zeros(size(flight_data,1),3);


for i = 1:size(flight_data,1)
    if i == 1
        v_earth(i,:) = [0 0 0];
    else
        v_earth(i,:) = (flight_data(i,id_x) - flight_data(i-1,id_x))/...
            (flight_data(i,id_time) - flight_data(i-1,id_time));
    end
end
v_earth(1,:) = v_earth(2,:);
v_filtered = smooth(v_earth(:,1),20);

figure(5)
hold on
plot(flight_raw_data(:,id_time),flight_raw_data(:,id_vx));
plot(flight_data(:,id_time),flight_data(:,id_vx))
plot(flight_data(:,id_time),v_earth(:,1));
plot(flight_data(:,id_time),v_filtered);
grid on;
xlabel('t[s]');
ylabel('v_x[m/s]');
legend('calculated v_x','ground truth v_x','filtered v_x','raw v_x')
a_earth = zeros(size(v_earth));

for i = 1:size(flight_data,1)
    if i == 1
        a_earth(i,:) = [0 0 0];
    else
        a_earth(i,:) = (flight_data(i,id_vx) - flight_data(i-1,id_vx))/...
            (flight_data(i,id_time) - flight_data(i-1,id_time));
    end
end
a_earth(1,:) = a_earth(2,:);
a_filtered = smooth(a_earth(:,1),30);
figure(6)
plot(flight_data(:,id_time),a_earth(:,1));
hold on
plot(flight_data(:,id_time),a_filtered);
xlabel('t[s]');
ylabel('a_x[m/s^2]');
legend('calculated a_x','filtered a_x');


figure(1);
subplot(4,3,1)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_x));
xlabel('t/s');
ylabel('x[m]');
subplot(4,3,2)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_y));
xlabel('t/s');
ylabel('y[m]');
subplot(4,3,3)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_z));
xlabel('t/s');
ylabel('z[m]');
subplot(4,3,4)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_vx));
xlabel('t/s');
ylabel('vx[m/s]');
subplot(4,3,5)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_vy));
xlabel('t/s');
ylabel('vy[m/s]');
subplot(4,3,6)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_vz));
xlabel('t/s');
ylabel('vz[m/s]');
subplot(4,3,7)

% plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_sp_phi)/pi*180,...
%     flight_data(1:p-1,id_time),flight_data(1:p-1,id_phi)/pi*180);
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_phi)/pi*180);

xlabel('t/s');
ylabel('phi[degree]');
legend('phi setpoint','phi measured');
subplot(4,3,8)

% plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_sp_theta)/pi*180,...
%     flight_data(1:p-1,id_time),flight_data(1:p-1,id_theta)/pi*180);
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_theta)/pi*180);

xlabel('t/s');
ylabel('theta[degree]');
 legend('theta setpoint','theta measured');
subplot(4,3,9)

% plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_sp_psi)/pi*180,...
%     flight_data(1:p-1,id_time),flight_data(1:p-1,id_psi)/pi*180);
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_psi)/pi*180);

xlabel('t/s');
ylabel('psi[degree]');
legend('psi setpoint','psi measured');

subplot(4,3,10)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_p));
xlabel('t/s');
ylabel('p[deg/s]');

subplot(4,3,11)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_q));
xlabel('t/s');
ylabel('q[deg/s]');

subplot(4,3,12)
plot(flight_data(1:p-1,id_time),flight_data(1:p-1,id_r));
xlabel('t/s');
ylabel('r[deg/s]');

% figure(2)
% subplot(1,3,1)
% plot(flight_data(:,id_time),flight_data(:,id_ax_body));
% xlabel('t[s]');
% ylabel('a\_x\_body[m/s^2]');
% 
% subplot(1,3,2)
% plot(flight_data(:,id_time),flight_data(:,id_ay_body));
% xlabel('t[s]');
% ylabel('a\_y\_body[m/s^2]');
% 
% subplot(1,3,3)
% plot(flight_data(:,id_time),flight_data(:,id_az_body));
% xlabel('t[s]');
% ylabel('a\_z\_body[m/s^2]');
% 
% figure(3)
% subplot(1,3,1)
% plot(flight_data(:,id_time),flight_data(:,id_ax));
% xlabel('t[s]');
% ylabel('a\_x[m/s^2]');
% 
% subplot(1,3,2)
% plot(flight_data(:,id_time),flight_data(:,id_ay));
% xlabel('t[s]');
% ylabel('a\_y[m/s^2]');
% 
% subplot(1,3,3)
% plot(flight_data(:,id_time),flight_data(:,id_az));
% xlabel('t[s]');
% ylabel('a\_z[m/s^2]');



a_11 = 0;
a_12 = 0;
a_21 = 0;
a_22 = 0;
b_11 = 0;
b_21 = 0;
g = 9.8;
mass = 0.414;
for i = 1:p-1
   a_11 = a_11+flight_data(i,id_vx)^2;
   a_12 = a_12+abs(flight_data(i,id_vx))*flight_data(i,id_vx)^2;
   a_21 = a_21+abs(flight_data(i,id_vx))*flight_data(i,id_vx)^2;
   a_22 = flight_data(i,id_vx)^4;
   b_11 = b_11+flight_data(i,id_vx)*(a_filtered(i,1)-g*-flight_data(i,id_theta));
   b_21 = b_21+abs(flight_data(i,id_vx))*flight_data(i,id_vx)*(a_filtered(i,1)-g*-flight_data(i,id_theta));
end

A = [a_11 a_12;a_21 a_22];
B = [b_11;b_21];

parameter = inv(A)*B;
a_bla = parameter(1)/g;
k_par = parameter(2)*mass;
drag_measured = zeros(p-1,1);
for i = 1:p-1
    drag_measured(i) =a_filtered(i,1)-g*-flight_data(i,id_theta);
end
figure(8)
plot(flight_data(:,id_time),drag_measured);
hold on;
plot(flight_data(:,id_time),(a_earth(:,1))-g*-flight_data(i,id_theta));
xlabel('t[s]');
ylabel('drag acceleration[m/s^2]');
end
