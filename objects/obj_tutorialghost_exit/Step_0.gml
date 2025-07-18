image_alpha -= 0.01;
y -= 4;

if (image_alpha <= 0)
    instance_destroy();
