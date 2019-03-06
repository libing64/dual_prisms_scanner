function r2 = refract(r1, n1, n)

      d = cross(r1, n1);
      d = d / norm(d)
      if (r1(3) < 0) 
         r1 = r1 * -1; 
      end
      r1
      n1
      beta1 = acos(dot(r1, n1) / (norm(r1) * norm(n1)) )
      beta2 = asin(sin(beta1) / n)
      
      axis_angle = zeros(1, 4);
      axis_angle(1:3) = d';
      axis_angle(4) = beta2;
      R = axang2rotm(axis_angle)
      r2 = R * r1;

end
