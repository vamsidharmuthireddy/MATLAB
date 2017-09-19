import os
import argparse
from utils import convolution
from filters import gaussian_filter, median_filter, highboost_filter
import numpy as np
import cv2
import pdb
import sys
from skimage.exposure import rescale_intensity

argparser = argparse.ArgumentParser()
argparser.add_argument("--i", required=True, type=str)
argparser.add_argument("--sigma",  type=int, default =1)
argparser.add_argument("--filter", type=int, default =3)
argparser.add_argument("--out", required=True,type=str)
argparser.add_argument("--lamb", type=int)
#argparser.add_argument("--fil_type", required=True, type=str)
args = argparser.parse_args()
#path = sys.argv[1]

if __name__ == '__main__':

	image = cv2.imread(args.i)
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	#kernel = gaussian_filter(7,3)
	#output = gaussian_filter(gray,args.filter, args.sigma)
	#output = median_filter(gray,args.filter)
	output = highboost_filter(gray,args.filter, args.lamb)
	output = rescale_intensity(output, in_range=(0, 255))
	output = (output*255).astype("uint8")
	cv2.imshow("original", gray)
	cv2.imshow("filtered", output)
	cv2.imwrite('sp_orignal.png', gray)
	cv2.imwrite(args.out, output)
	cv2.waitKey(0)
	cv2.destroyAllWindows()