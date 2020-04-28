# import the necessary packages
from keras.models import Sequential
from keras.layers.convolutional import Conv2D
from keras.layers.convolutional import MaxPooling2D
from keras.layers.core import Activation
from keras.layers.core import Flatten
from keras.layers.core import Dense
from keras.optimizers import Adam
from sklearn.preprocessing import LabelBinarizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from PIL import Image
from imutils import paths
import numpy as np
import argparse
import os

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
#setting up the default dataset as our project dataset
ap.add_argument("-d", "--dataset", type=str, default="dataset_path",
	help="path to directory containing the 'dataset_path' dataset")
args = vars(ap.parse_args())

# grab all image paths in the input dataset directory, then initialize
# our list of images and corresponding class labels
print("[INFO] loading images...")
imagePaths = paths.list_images(args["dataset"])
data = []
labels = []

# loop over our input images
for imagePath in imagePaths:
	# load the input image from disk, resize it to 32x32 pixels, scale
	# the pixel intensities to the range [0, 1], and then update our
	# images list
	image = Image.open(imagePath)
	image = np.array(image.resize((32, 32))) / 255.0
	data.append(image)

	# extract the class label from the file path and update the
	# labels list
	label = imagePath.split(os.path.sep)[-2]
	labels.append(label)

# encode the labels, converting them from strings to integers
lb = LabelBinarizer()
labels = lb.fit_transform(labels)

# perform a training and testing split, using 75% of the data for
# training and 25% for evaluation
(trainX, testX, trainY, testY) = train_test_split(np.array(data),
	np.array(labels), test_size=0.25)

# define our Convolutional Neural Network architecture
# defining the model type as sequential
model = Sequential()
# FIRST CONVOLUTIONAL LAYER  
# output channels= 8,
# kernal size= 3X3
#imput_shape= ht 32 x br 32 X RGB 3
model.add(Conv2D(8, (3, 3), padding="same", input_shape=(32, 32, 3)))
# setting up acivation function as ReLU
model.add(Activation("relu"))
# Adding 2D Max pooling layer 
# define pool size 2X2, Strides 2X2
model.add(MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
# SECOND CONVOLUTIONAL LAYER + MAX POOLING WITH output channel 16 
model.add(Conv2D(16, (3, 3), padding="same"))
model.add(Activation("relu"))
model.add(MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
# THIRD CONVOLUTIONAL LAYER + MAX POOLING WITH output channels 32
model.add(Conv2D(32, (3, 3), padding="same"))
model.add(Activation("relu"))
model.add(MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
# Flatterning the output 
model.add(Flatten())
# FULLY CONNECTED LAYERS
# define the dense nodes as 3 with classification type as softmax
model.add(Dense(3))
model.add(Activation("softmax"))

# train the model using the Adam optimizer
print("[INFO] training network...")
opt = Adam(lr=1e-3, decay=1e-3 / 50)
model.compile(loss="categorical_crossentropy", optimizer=opt,
	metrics=["accuracy"])
# Training the dataset
# seperating the data- training- trainX, trainY
# 					 - validation - testX, testY
# define no. of epochs and batch size
H = model.fit(trainX, trainY, validation_data=(testX, testY),
	epochs=50, batch_size=32)

# evaluate the network
print("[INFO] evaluating network...")
predictions = model.predict(testX, batch_size=32)
print(classification_report(testY.argmax(axis=1),
	predictions.argmax(axis=1), target_names=lb.classes_))