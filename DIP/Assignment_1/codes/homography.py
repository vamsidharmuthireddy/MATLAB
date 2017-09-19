import cv2
import sys
import numpy as np 
import pdb

refPt = []


def click(event, x, y, flags, param):
	global  cropping ,ix, iy, refPt 
	if event == cv2.EVENT_LBUTTONDOWN:
		ix, iy = x, y
		cv2.circle(image, (ix,iy),20, (0, 0, 255), 1)	
		cv2.imshow('image',image)
		refPt.append([x, y])
	elif event == cv2.EVENT_LBUTTONUP:
		ix, iy = x, y
		refPt.append([x, y])
		cv2.circle(image, (ix,iy),20, (0, 0, 255), 1)
		cv2.imshow('image',image)
image_path = sys.argv[1]
image = cv2.imread(image_path)

image = cv2.resize(image, (960, 540))
clone = image.copy()
cv2.namedWindow("image")
cv2.setMouseCallback("image", click)

while True:

	cv2.imshow("image", image)
	key = cv2.waitKey(1) & 0xFF
	if key == ord("r"):
		image = clone.copy()

	elif key == ord("a"):
		
		cv2.line(image,(refPt[0][0],refPt[0][1]),
			(refPt[1][0],refPt[1][1]), [255, 0, 0], 1)
		point1 = np.append(np.array(refPt[0]), np.array([1]))
		point2 = np.append(np.array((refPt[1][0]-475,refPt[1][0])),
			np.array([1]))
		product = np.outer(point1, 1./point2)
		refPt=[]
		print(product)
	elif key == ord("q"):
		break
cv2.imwrite('stereo.jpg', image)
cv2.destroyAllWindows()




