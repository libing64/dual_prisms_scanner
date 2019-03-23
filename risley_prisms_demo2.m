close all;
theta1 = 2.0 * pi / 180;
K = 1;
M = 1.1;
delta_alpha = [0, pi/2, pi, pi/2 * 3];

figure;
hold on;
for i = 1 : 1%length(delta_alpha)
   [x, y] = risley_prisms(theta1, K, M, delta_alpha(i)); 
   plot(x, y, 'color', rand(1, 3));
   a = 1
end
hold off;
axis equal;
stitle = sprintf('theta_1 = %f, K = %f, M = %f', theta1 * 180 / pi, K, M);
title(stitle)

