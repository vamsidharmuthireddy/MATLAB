import matplotlib.pyplot as plt
import numpy as np
from math import *

#change image with path fr required hist equalisation
image = plt.imread('hist_equal.jpg')
flattened_image = image.flatten()

frequencies = {}
probs = []
cumm_probs = []
s = []

L = 2**8 
n = len(flattened_image)
value = []

for i in range(len(flattened_image)):
	if frequencies.get(flattened_image[i], None):
		frequencies[flattened_image[i]] += 1
	else:
		frequencies[flattened_image[i]] = 1

for i in range(L):
	value.append(frequencies[i])

# print(len(value))
# print(value)

for i in range(len(value)):
	probs.append(round((value[i])/n,6))

#uncomment for probs
# print(probs)

start = 0
for i in range(len(probs)):
	cumm_probs.append(round(start + probs[i],6))
	start = round(cumm_probs[i],6)  	

# uncomment for cummulative probs
# print(cumm_probs)

for i in range(len(cumm_probs)):
	s.append(floor(round((((L-1)*cumm_probs[i]) + 0.5),6)))

# uncomment to see transformed values
# print(s) 

## uncomment the following two lines to view the hist plot before equalization

# plt.bar(list(range(L)), value, width=1.0, color='b')
# plt.show()

##uncomment the following 2 lines to view the hist plot after equalisation

# plt.bar(list(range(L)), s, width=2.0, color='r')
# plt.show()

hist_image = []

for i in range(len(flattened_image)):
	hist_image.append(s[flattened_image[i]])

hist_image = np.array((hist_image)).astype(np.uint8)

hist_image = hist_image.reshape(image.shape)
	  	    	  
plt.imshow(hist_image)
plt.figure()
plt.imshow(image)
plt.show()