close all;
theta1 = 2.0 * pi / 180;
K = 1;
M = 0;
delta_alpha_q = [0, pi/2, pi, pi/2 * 3];

fig = figure;
hold on;
for i = 1 : length(delta_alpha_q)
    
   delta_alpha = delta_alpha_q(i)
   [x, y] = risley_prisms(theta1, K, M, delta_alpha); 
   plot(x, y, 'color', rand(1, 3));
end
hold off;

axis equal;

 stitle = sprintf('delta_alpha,theta1 = %f, K = %f, M = %f.png', theta1 * 180 / pi, K, M);
 title(stitle)
filename = sprintf('delta_alpha,theta1 = %f, K = %f, M = %f.png', theta1 * 180 / pi, K, M);
saveas(fig, filename)  


