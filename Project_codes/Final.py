# python Final.py --image abcdefgh.jpg --model1 output/simple_nn.model --model2 output/simple_nn1.model --label-bin1 output/simple_nn_lb.pickle --label-bin2 output/simple_nn_lb1.pickle
from keras.models import load_model
import argparse
import pickle
import cv2
from PIL import Image
import numpy as np
 
# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True,
	help="path to input image we are going to classify")
ap.add_argument("-m1", "--model1", required=True,
	help="path to trained Keras model")
ap.add_argument("-m2", "--model2", required=True,
	help="path to trained Keras model")
ap.add_argument("-l1", "--label-bin1", required=True,
	help="path to label binarizer")
ap.add_argument("-l2", "--label-bin2", required=True,
	help="path to label binarizer")
ap.add_argument("-f", "--flatten", type=int, default=0,
	help="whether or not we should flatten the image")
args = vars(ap.parse_args())

# load the input image and resize it to the target spatial dimensions
#image = cv2.imread(args["image"])
#output = image.copy()
#image = cv2.resize(image, (32,32))
# load the image
image = cv2.imread(args["image"])
output = image.copy()
 
# pre-process the image for classification
image = cv2.resize(image, (32, 32))
image = image.astype("float") / 255.0

# check to see if we should flatten the image and add a batch
# dimension
if args["flatten"] > 0:
	image = image.flatten()
	image = image.reshape((1, image.shape[0]))
 
# otherwise, we must be working with a CNN -- don't flatten the
# image, simply add the batch dimension
else:
	image = image.reshape((1, image.shape[0], image.shape[1],
		image.shape[2]))

# load the model and label binarizer
print("[INFO] loading network and label binarizer...")
model1 = load_model(args["model1"])
model2 = load_model(args["model2"])
lb1 = pickle.loads(open(args["label_bin1"], "rb").read())
lb2 = pickle.loads(open(args["label_bin2"], "rb").read())
 
# make a prediction on the image
preds1 = model1.predict(image)
preds2 = model2.predict(image)
 
# find the class label index with the largest corresponding
# probability
i1 = preds1.argmax(axis=1)[0]
i2 = preds2.argmax(axis=1)[0]
label1 = lb1.classes_[i1]  
label2 = lb2.classes_[i2]   

# draw the class label + probability on the output image
text1 = "{}: {:.2f}%".format(label1, preds1[0][i1] * 100)
text2 = "{}: {:.2f}%".format(label2, preds2[0][i2] * 100)
cv2.putText(output, text1, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 0.7,
	(0, 0, 255), 2)
cv2.putText(output, text2, (20, 220), cv2.FONT_HERSHEY_SIMPLEX, 0.7,
	(0, 0, 255), 2)
 
# show the output image
cv2.imshow("Image", output)
cv2.imshow("Image", output)
cv2.waitKey(0)