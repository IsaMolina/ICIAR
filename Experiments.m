close all;
A = (imread('moon.tif'));

A_noisy = (imnoise(A, 'gaussian', 0, 1*0.005));

lambda_1 = 0.01;
lambda_2 = 100; 
u1=totalvar_noiterations(A_noisy, lambda_1);
u2=totalvar_noiterations(A_noisy, lambda_2);
figure; imshow(A); title('Original');
figure; imshow(A_noisy); title('Noisy input');
figure; imshow(u1); title(['lambda = ', num2str(lambda_1)]);
figure; imshow(u2); title(['lambda = ', num2str(lambda_2)]);

B = imread('Original.jpg');
C = imread('Noisy input.jpg');
D = imread('lambda 0.01.jpg');
E = imread('lambda 100.jpg');

figure;
subplot(121); imshow(B);
subplot(122); imshow(C);

figure;
subplot(121); imshow(D);
subplot(122); imshow(E);

ssim(A_noisy,A)
ssim(u1,A)
ssim(u2,A)

psnr(A_noisy,A)
psnr(u1,A)
psnr(u2,A)