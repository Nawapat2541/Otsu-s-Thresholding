function [ImB, Threshold] = Otsu_Thresholding(Im)
%% Read Image and convert to gray if necessary
% outside function
%% Find Histogram
H = imhist(Im);
%% Initialize Variables, (max Variance, Total pixels, etc)
Max_variance = 0;
Sigma = zeros(1,256);
TP = sum(H);
%% Calculate probability of all histogram levels in an array
P = H/TP;
%% Run loop
for k = 50:250
    Wb = sum(P(1:k));
    Wf = sum(P(k+1 : end));
    Ub = dot(1:k,P(1:k)) / Wb;
    Uf = dot(k:255,P(k+1:256)) / Wf;
    Sigma(k) = Wb*Wf*((Ub-Uf)^2);
end
Max_Variance = max(Sigma)
L = find(Sigma==Max_Variance);
Threshold = L-1;
%% Display output

ImB = Im>Threshold;

end