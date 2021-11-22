import cv2
import numpy
import sys
import os

if len(sys.argv) != 2:
    print("Usage: blur.py path-to-image")
    sys.exit(0)

img = os.path.abspath(sys.argv[1])
src_path = os.path.abspath(img)
src_dir = os.path.dirname(src_path)
img_name, img_ext = os.path.splitext(os.path.basename(src_path))
src = cv2.imread(src_path, cv2.IMREAD_UNCHANGED)

dst = cv2.blur(src, (50, 50), cv2.BORDER_DEFAULT)

dst_path = os.path.join(src_dir, img_name + "-blurred" + img_ext)

cv2.imwrite(dst_path, dst)
