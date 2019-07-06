close all;
theta1 = 2.0 * pi / 180;
KK = [0.1, 0.2, 0.5, 1.0, 1.2, 2.5, 5, 10];
MM= [-100, -50, -30, -20, -10, -9, -8, -6, -5, -3, -2, -1, -0.5];
delta_alpha = 0;

fig = figure;
for i = 1 : length(KK)
    for j = 1 : length(MM)
        K = KK(i);
        M = MM(j);
        [x, y] = risley_prisms(theta1, K, M, delta_alpha); 
        plot(x, y, 'color', rand(1, 3));
        hold off;
        axis equal;
        stitle = sprintf('K = %.1f, theta_1 = %.1f_M = %.1f', K, theta1 * 180 / pi,  M);
        title(stitle)
        
        filename = sprintf('data/K_%.1f_theta_%.1f_M_%.1f.png', K, theta1 * 180 / pi, M);
        saveas(fig, filename)
    end
end


