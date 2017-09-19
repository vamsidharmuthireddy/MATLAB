import numpy as np 
from math import e
import pdb
from utils import convolution, padding
def gaussian_filter(image, n_dim, sigma):
	gauss_filter = np.zeros((n_dim, n_dim))
	mat = np.zeros((n_dim,n_dim))
	normalization_constant = 1/(float(np.sqrt(2*np.pi))*2*sigma)
	pos = np.arange(-(n_dim//2), (n_dim//2)+1)
	#print(pos)
	#
	for i in range(n_dim):
		#pdb.set_trace()
		for j in range(n_dim):
			gauss_filter[j,i] = e**(-((pos[i]**2 + pos[j]**2)/float(sigma**2)))
			mat[j ,i] = -(pos[i]**2 + pos[j]**2)/float(2*sigma)	
	
	kernel = gauss_filter*normalization_constant
	output = convolution(image, kernel)		
	return output

def median_filter(image, n_dim):
	
	pad = int((n_dim-1)/2)
	im_bg,h, w = padding(image, pad)
	result = np.zeros((h,w), dtype='float')
	for y in np.arange(pad, h+pad):
		for x in np.arange(pad, w+pad):
			roi = im_bg[y - pad:y + pad + 1, x - pad:x + pad + 1]
			k = np.median(roi)
			result[y-pad, x-pad] = k
	return result

def mean_filter(image, n_dim):
	
	pad = int((n_dim-1)/2)
	im_bg,h, w = padding(image, pad)
	result = np.zeros((h,w), dtype='float')
	for y in np.arange(pad, h+pad):
		for x in np.arange(pad, w+pad):
			roi = im_bg[y - pad:y + pad + 1, x - pad:x + pad + 1]
			k = np.mean(roi)
			result[y-pad, x-pad] = k
	return result

def highboost_filter(image, n_dim, lam):
	mean_image = mean_filter(image, n_dim)
	edges = image - mean_image
	output = image + lam*edges
	return(output)


		