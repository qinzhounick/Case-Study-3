load("lightField.mat")

rays_in = [0,-pi/400,0,0;
           0,-pi/200,0,0;
           0,-pi/100,0,0;
           0,0,0,0;
           0,pi/100,0,0;
           0,pi/200,0,0;
           0,pi/400,0,0;].';

rays_in1 = [0.01,-pi*0.03,0,0;
           0.01,-pi*0.01,0,0;
           0.01,pi*0,0,0;
           0.01,pi*0.01,0,0;
           0.01,pi*0.03,0,0;].';
d1 = 4;
M1 = [1 d1 0 0;
     0 1 0 0;
     0 0 1 d1;
     0 0 0 1];

d2 = 4;
M2 = [1 d2 0 0;
     0 1 0 0;
     0 0 1 d2;
     0 0 0 1];
f = 2;
Mf = [1 0 0 0;
     -1/f 1 0 0;
     0 0 1 0;
     0 0 -1/f 1];


rays_middle = M1*rays_in;
rays_out = M1*Mf*rays_middle;
rays_end = M1*rays_out;
rays_out1 = Mf*M2*rays_in1;

ray_z = [zeros(1,size(rays_in,2)); d1*ones(1,size(rays_in,2))];
ray_z1 = [zeros(1,size(rays_in1,2)); d2*ones(1,size(rays_in1,2))];

figure(1)
plot([0 d1/2], [rays_in(1,:); rays_middle(1,:)]);
hold on
plot([d1/2 d1], [rays_middle(1,:); rays_out(1,:)]);
plot([d1 d1+2], [rays_out(1,:); rays_end(1,:)]);
%plot(ray_z1, [rays_in1(1,:); rays_out1(1,:)]);
hold off
