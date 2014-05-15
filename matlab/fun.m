clear;
close all;

src = imread('1a.jpg'); % ���Ŵ�ͼ��
source = imread('1.jpg'); % ԭʼͼ�������������
k = 2; % �Ŵ���
method = 'linear';

% nearest������ڲ�ֵ��
% linear�����Բ�ֵ��
% cubic�����ζ���ʽ��ֵ��
% spline������������ֵ��

% ͼ��Ŵ�
src = double(src);
m = size(src, 1);
n = size(src, 2);
[x, y] = meshgrid(1 : n, 1 : m);
[xi, yi] = meshgrid(1 / k : 1 / k : n, 1 / k : 1 / k : m);
dst( : , : , 1) = interp2(x, y, src( : , : , 1), xi, yi, method);
dst( : , : , 2) = interp2(x, y, src( : , : , 2), xi, yi, method);
dst( : , : , 3) = interp2(x, y, src( : , : , 3), xi, yi, method);

imshow(uint8(dst));

% ���ͳ��
s1 = double(0); 
totalNum = 0; % ��¼�ܵ���
for i = 1 : 1 : min(size(source, 1), size(dst, 1))
    for j = 1 : 1 : min(size(source, 2), size(dst, 1))
        totalNum = totalNum + 1;
        for q = 1 : 1 : 3
            s1 = s1 + double(source(i, j, q) - dst(i, j, q)) ^ 2;
        end
    end
end
s1 = s1 / (3 * totalNum);
disp(s1);