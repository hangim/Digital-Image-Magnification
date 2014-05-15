clear;
close all;

src = imread('1a.jpg'); % 待放大图像
source = imread('1.jpg'); % 原始图像，用于评估结果
k = 2; % 放大倍数
method = 'linear';

% nearest：最近邻插值法
% linear：线性插值法
% cubic：三次多项式插值法
% spline：三次样条插值法

% 图像放大
src = double(src);
m = size(src, 1);
n = size(src, 2);

tic
t0 = cputime()
for i = 1 : 1000
    [x, y] = meshgrid(1 : n, 1 : m);
    [xi, yi] = meshgrid(1 / k : 1 / k : n, 1 / k : 1 / k : m);
    dst( : , : , 1) = interp2(x, y, src( : , : , 1), xi, yi, method);
    dst( : , : , 2) = interp2(x, y, src( : , : , 2), xi, yi, method);
    dst( : , : , 3) = interp2(x, y, src( : , : , 3), xi, yi, method);
end
t1 = cputime()
toc
disp(t1 - t0)

% imshow(uint8(dst));