close all;
theta1 = 2.0 * pi / 180;
K = 1;
MM = -6 : 6;
delta_alpha = 0;


for i = 1 : length(MM)
    M = MM(i);
   fig = figure;
   [x, y] = risley_prisms(theta1, K, M, delta_alpha); 
   plot(x, y, 'color', rand(1, 3));
    hold off;
    axis equal;
    stitle = sprintf('theta_1 = %f, K = %f, M = %f', theta1 * 180 / pi, K, M);
    title(stitle)
    
    filename = sprintf('theta_1 = %f, K = %f, M = %f.png', theta1 * 180 / pi, K, M);
    saveas(fig, filename)
end


