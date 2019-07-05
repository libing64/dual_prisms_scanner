close all;
theta1 = 2.0 * pi / 180;
KK = [0.2, 0.5, 1.0, 1.2, 2.5, 5, 10, 15, 20, 30];
M = -100;
delta_alpha = 0;


for i = 1 : length(KK)
    K = KK(i);
   fig = figure;
   [x, y] = risley_prisms(theta1, K, M, delta_alpha); 
   plot(x, y, 'color', rand(1, 3));
    hold off;
    axis equal;
    stitle = sprintf('K = %f, theta_1 = %f,  M = %f', K, theta1 * 180 / pi,  M);
    title(stitle)
    
    filename = sprintf('K = %f, theta_1 = %f, M = %f.png', K, theta1 * 180 / pi, M);
    saveas(fig, filename)
end


