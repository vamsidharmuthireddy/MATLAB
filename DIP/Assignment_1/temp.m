
clear;
close all;
clc;

% input_image = imread('Assign1_imgs/pea1.bmp');
% input_image =double(imread('Assign1_imgs/portraits2.jpg'))./255;
% 
% % filter_sizes = [3,5,8];
% filter_sizes = 8;
% for filter_size=filter_sizes
%     gaussian_sigmas=[5,15,30];
% %     gaussian_sigmas=5;
%     for gaussian_sigma = gaussian_sigmas
% %         gaussian_sigma = 2;
%         gaussian_image=apply_gaussian(input_image,filter_size,gaussian_sigma);
% %         imwrite(gaussian_image,['gaussian_filter_',int2str(filter_size),'.jpg']);
%         imwrite(gaussian_image,['gaussian_sigma_',int2str(gaussian_sigma),'.jpg']);
%         
%     end
% end
% 

% 
% input_image =double(imread('Assign1_imgs/SaltPepperNoise.jpg'))./255;
% filter_sizes = [3,5,8];
% for filter_size=filter_sizes
%     median_image = apply_median(input_image,filter_size);
%     imwrite(median_image,['median_filter_',int2str(filter_size),'.jpg']);
% end
% imwrite(median_image,'median_blur.jpg');
% 
% input_image =double(imread('Assign1_imgs/blur2.jpg'))./255;
% % filter_sizes = [3,5,8];
% filter_sizes = 3;
% for filter_size=filter_sizes
%     lambdas = [5,10,15];
% %     lambdas = 1;
%     for lambda=lambdas        
%         highboost_image = apply_highboost(input_image,filter_size,lambda);
% %         imwrite(highboost_image,['highboost_filter_',int2str(filter_size),'.jpg']);
%         imwrite(highboost_image,['highboost_lambda_',int2str(lambda),'.jpg']);
%     
%     end
% end

% 
% 
% input_image =double(imread('Assign1_imgs/portraits.jpg'))./255;
% % filter_size = 3;
% gaussian_sigma = 8;
% % filter_sizes=[3,5,8];
% filter_sizes=8;
% for filter_size=filter_sizes
% %     sigma_rs = [30,60,90];
%     sigma_rs = 90;
%     for sigma_r=sigma_rs
% %         sigma_r = 30;
%         bilateral_image = apply_bilateral(input_image,filter_size,gaussian_sigma,sigma_r);
%         imwrite(bilateral_image,['bilateral_filter_size_',int2str(filter_size),'.jpg']);
% %         imwrite(bilateral_image,['bilateral_sigma_r_',int2str(sigma_r),'.jpg']);
%     
%     end
% end


% period = [5,10,15];
period = 5;
% amplitude = [5,10,15];
amplitude = 5;
for p = period
    for am= amplitude
    ripple_image = ripple(A,10,20,120,150);
    imwrite(ripple_image,['ripple_',int2str(periodX),'_',int2str(amplitudeX),'.jpg']);
    end
end



