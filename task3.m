load("lightField.mat")

d = 1;
M_inverse = [1 -d 0 0;
            0 1 0 0;
            0 0 1 -d;
            0 0 0 1];
M_propagation = [1 -d 0 0;
                0 1 0 0;
                0 0 1 -d;
                0 0 0 1];

rays_new = M_inverse*rays;
rays_x1 = rays_new(1,:);
rays_y1 = rays_new(3,:);
[img1,x,y] = rays2img(rays_x1,rays_y1, 0.02, 500);
figure(3)
%colormap("gray");
imagesc(img1);