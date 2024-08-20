from os import listdir
import os
import cv2
import numpy as np
from tqdm import tqdm

data_path = "./enter/your/image_path/"
data_path_modified = "./enter/new/path/"


os.makedirs(data_path_modified, exist_ok = True)

list_img = os.listdir(data_path)
print(len(list_img))
for i in tqdm(list_img):

    img = cv2.imread(data_path + i)
    if img is None:
        print('Wrong path:', data_path)
    else:
        tmp = cv2.resize(img, (300, 300))

        cv2.waitKey(1)

        cv2.imwrite(data_path_modified + i, tmp)
