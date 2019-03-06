theta1 = 0.05;%rand() * 10 / 180 * pi;
theta2 = 0.05;%rand() * 10 / 180 * pi;
n = 0.95;

w1 = 0.15;
w2 = 0.30;

t = 0 : 0.001 : 100;
N = length(t);
alpha1 = w1 * t;
alpha2 = w2 * t;

r1 = [0, 0, 1]';
n1 = [-sin(theta1), 0, cos(theta1)]';
n2 = [-sin(theta2), 0, cos(theta2)]';

target = zeros(3, N);
for i = 100 : N
      alpha = alpha1(i);
      R = [cos(alpha), -sin(alpha), 0
          sin(alpha), cos(alpha), 0
          0, 0, 1];
       nn1 = R * n1
       
       r2 = refract(r1, nn1, n)
       
      alpha = alpha2(i);
      R = [cos(alpha), -sin(alpha), 0
          sin(alpha), cos(alpha), 0
          0, 0, 1];
       nn2 = R * n2
     
       r3 = refract(r2, nn2, 1/n)
       
       nn3 = [0, 0, 1]';
       r4 = refract(r3, nn3, n);
       
       r4 = r4 / norm(r4);
       
       target(:, i) = r4;
%       d = cross(r1, nn1);
%       d = d / norm(d);
%       
%       beta1 = acos(dot(r1, nn1) / (norm(r1) * norm(nn1)) );
%       beta2 = asin(sin(beta1) / n);
end


