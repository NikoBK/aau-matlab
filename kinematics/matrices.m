% Name:     mactrices.m
% Created:  07/17/2023
% Author:   NikoBK

% Clear cache and console.
clear; clc; close all;

disp("If you are reading this in your command window it means you have pressed 'Run'.")
disp("Please use 'Run Section' while being in the correct section within the code instead.")
return;

%% Template for Transformation Matrices
% Usefull for matrix multiplication

% Wrist -> mantel
T = [
    0.7500   -0.6597    0.0474  100;
    0.4330    0.4356   -0.7891  300;
    0.5000    0.6124    0.6124  200;
         0         0         0    1
];

% Base -> mantel
T2 = [  
       1           0           0         500;
       0           1           0        2200;
       0           0           1           0;
       0           0           0           1
];

inv(T2) * T

%% Matrix Representation to Axis-Angle Representation
% The firsth method of doing this is to insert the transformation matrix in
% the following code which the script will use to yield a vector that
% represents the axis-angle.

m = [
   0    -0.866  0.5     -0.4;
   0   -0.5    -0.866   1.2;
   1    0       0       0.6;
   0    0       0       1
];

radangle = acos((m(1,1) + m(2, 2) + m(3, 3) - 1) / 2);
angle = rad2deg(acos((m(1,1) + m(2,2) + m(3,3) - 1) / 2));
x = (m(3,2) - m(2,3)) / sqrt((m(3,2) - m(2,3))^2 + (m(1,3) - m(3,1))^2 + (m(2,1) - m(1,2))^2);
y = (m(1,3) - m(3,1)) / sqrt((m(3,2) - m(2,3))^2 + (m(1,3) - m(3,1))^2 + (m(2,1) - m(1,2))^2);
z = (m(2,1) - m(1,2)) / sqrt((m(3,2) - m(2,3))^2 + (m(1,3) - m(3,1))^2 + (m(2,1) - m(1,2))^2);

% The alternative method by Craig:
x1 = (1 / (2 * sin(radangle))) * (m(3,2) - m(2,3));
y1 = (1 / (2 * sin(radangle))) * (m(1,3) - m(3,1));
z1 = (1 / (2 * sin(radangle))) * (m(2,1) - m(1,2));

AxisAngle = [angle, x, y, z]
CraigAngle = [angle, x1, y1, z1]'