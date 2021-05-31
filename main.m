Im = imread('Lena.png');
Im = rgb2gray(Im);

[Im,Threshold] = Otsu_Thresholding(Im);

imshow(Im);