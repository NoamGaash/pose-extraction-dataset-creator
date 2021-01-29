import numpy as np
import cv2
from skimage import data, filters
import sys 

if len(sys.argv) < 3:
	print('usage: python background-extraction.py <video> <output>')
	exit()


video = sys.argv[1]
output = sys.argv[2]

# Open Video
cap = cv2.VideoCapture(video)

# Randomly select 25 frames
frameIds = cap.get(cv2.CAP_PROP_FRAME_COUNT) * np.random.uniform(size=50)

# Store selected frames in an array
frames = []
for fid in frameIds:
    cap.set(cv2.CAP_PROP_POS_FRAMES, fid)
    ret, frame = cap.read()
    frames.append(frame)

# Calculate the median along the time axis
medianFrame = np.median(frames, axis=0).astype(dtype=np.uint8)    

# Display median frame
cv2.imwrite(output, medianFrame)
