# https://stackoverflow.com/questions/50951955/pytesseract-tesseractnotfound-error-tesseract-is-not-installed-or-its-not-i
import cv2
import pytesseract
import numpy as np
import os

home = os.path.expanduser('~')
img_location = home + '\\Pictures\\OCR.jpg'
#img = cv2.imread('/Users/ply/Pictures/OCR.png')
img = cv2.imread(img_location)
#Alternatively: can be skipped if you have a Blackwhite image
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
gray, img_bin = cv2.threshold(gray,128,255,cv2.THRESH_BINARY | cv2.THRESH_OTSU)
gray = cv2.bitwise_not(img_bin)

kernel = np.ones((2, 1), np.uint8)
img = cv2.erode(gray, kernel, iterations=1)
img = cv2.dilate(img, kernel, iterations=1)
out_below = pytesseract.image_to_string(img)
print('<-- pytesseract: ' + img_location + ' ------------>')
print(out_below)
print('<-- pytesseract: ' + img_location + ' ------------>')
