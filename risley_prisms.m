function [x, y] = risley_prisms(theta1, K, M, delta_alpha)

% K = K;
% M = 0;
alpha1_init = 0;
alpha2_init = delta_alpha;

%theta1 = 0.1;%rand() * 10 / 180 * pi;
theta2 = K * theta1;%rand() * 10 / 180 * pi;
n = 0.6;

w1 = 1.5;
w2 = M * w1;

t = 0 : 0.1 : 1000;
N = length(t);
alpha1 = w1 * t + alpha1_init;
alpha2 = w2 * t + alpha2_init;

r1 = [0, 0, 1]';
n1 = [-sin(theta1), 0, cos(theta1)]';
n2 = [-sin(theta2), 0, cos(theta2)]';

target = zeros(3, N);
for i = 1 : N
      alpha = alpha1(i);
      R = [cos(alpha), -sin(alpha), 0
          sin(alpha), cos(alpha), 0
          0, 0, 1];
       nn1 = R * n1;
       
       r2 = refract(r1, nn1, n);
       
      alpha = alpha2(i);
      R = [cos(alpha), -sin(alpha), 0
          sin(alpha), cos(alpha), 0
          0, 0, 1];
       nn2 = R * n2;
     
       r3 = refract(r2, nn2, 1/n);
       
       nn3 = [0, 0, 1]';
       r4 = refract(r3, nn3, n);
       
       r4 = r4 / norm(r4);
       target(:, i) = r4;

end
x = target(1, :);
y = target(2, :);
%plot(target(1,:), target(2, :));
%axis equal;

