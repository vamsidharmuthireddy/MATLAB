import cv2
import numpy as np 
import os
import sys
import pdb
from math import sqrt
from scipy.ndimage.interpolation import map_coordinates
def ripple_transform(image):
	height, width = image.shape[0], image.shape[1]
	ax, ay, tx, ty = 10, 15, 120, 150
	new_image = np.zeros(image.shape)
	for i in range(height):
		for j in range(width):
			#pdb.set_trace()
			x = i + ax*np.sin((2*np.pi*j)/float(ty))
			y = j + ay*np.sin((2*np.pi*i)/float(tx))
			z = map_coordinates(image, np.array([[x, y]]).T,
			 order=1)
			new_image[i,j] = z[0]
	return new_image


def spherical_transform(image):
	height, width = image.shape[0], image.shape[1]
	xc, yc = 51/2.0, 51/2.0
	p, r_max = 2.5, 100 
	new_image = np.zeros(image.shape)
	for i in range(height):
		for k in range(width):
			dx = i - xc
			dy = k - yc
			#pdb.set_trace()
			ra = sqrt(dx**2 + dy**2)
			z = sqrt(abs(r_max**2 - ra**2))
			#pdb.set_trace()
			try:
				Bx = (1 - 1/p)*np.arcsin(dx/sqrt(dx**2+z**2))
				By = (1 - 1/p)*np.arcsin(dy/sqrt(dy**2+z**2))
			except Exception as e:
				pdb.set_trace()
				print(Bx, By, sqrt(dy**2+z**2),
				 sqrt(dx**2+z**2))
				print(e)
			if ra<r_max:
				x = int(i - z*np.tan(Bx))
				y = int(k - z*np.tan(By))
			else:
				x = i
				y = k
			z = map_coordinates(image, np.array([[x, y]]).T, 
				order=1)
			new_image[i,k] = z[0]
	return new_image


if __name__ == '__main__':
	image_path = sys.argv[1]
	image  = cv2.imread(image_path)
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	image_ripp = ripple_transform(gray)
	#image_sph = spherical_transform(gray)
	cv2.imshow('ripple', image_ripp.astype("uint8"))
	#cv2.imshow('spherical', image_sph.astype("uint8"))
	cv2.imwrite('ripple.jpg', image_ripp)
	cv2.waitKey(0)
	cv2.destroyAllWindows()