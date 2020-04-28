# python Final.py --image abcdefgh.jpg --model1 output/simple_nn.model --model2 output/simple_nn1.model --label-bin1 output/simple_nn_lb.pickle --label-bin2 output/simple_nn_lb1.pickle
# python .\Final1.py --image Test/brain_CT.jpg --model1 output/simple_body.model --model2 output/simple_image.model --label-bin1 output/simple_body_nn.pickle --label-bin2 output/simple_image_nn.pickle 
# python Test.py --image Test/Brain_CT.jpg --model1 output/simple_body.model --label-bin1 output/simple_body_nn.pickle --model2 output/simple_image.model --label-bin2 output/simple_image_nn.pickle
from keras.models import load_model
import argparse
import mysql.connector
from mysql.connector import Error
import pickle
import cv2
from PIL import Image
import numpy as np
from imutils.object_detection import non_max_suppression
import PIL.ImageOps 
import pytesseract
import re
from difflib import get_close_matches 

pytesseract.pytesseract.tesseract_cmd = 'C:\\Program Files (x86)\\Tesseract-OCR\\tesseract.exe'

print("-----------------------------------------------")
print("--Machine Learning Model and Text recognition--")
print("-----------------------------------------------")
def decode_predictions(scores, geometry):
	# grab the number of rows and columns from the scores volume, then
	# initialize our set of bounding box rectangles and corresponding
	# confidence scores
	(numRows, numCols) = scores.shape[2:4]
	rects = []
	confidences = []

	# loop over the number of rows
	for y in range(0, numRows):
		# extract the scores (probabilities), followed by the
		# geometrical data used to derive potential bounding box
		# coordinates that surround text
		scoresData = scores[0, 0, y]
		xData0 = geometry[0, 0, y]
		xData1 = geometry[0, 1, y]
		xData2 = geometry[0, 2, y]
		xData3 = geometry[0, 3, y]
		anglesData = geometry[0, 4, y]

		# loop over the number of columns
		for x in range(0, numCols):
			# if our score does not have sufficient probability,
			# ignore it
			if scoresData[x] < args["min_confidence"]:
				continue

			# compute the offset factor as our resulting feature
			# maps will be 4x smaller than the input image
			(offsetX, offsetY) = (x * 4.0, y * 4.0)

			# extract the rotation angle for the prediction and
			# then compute the sin and cosine
			angle = anglesData[x]
			cos = np.cos(angle)
			sin = np.sin(angle)

			# use the geometry volume to derive the width and height
			# of the bounding box
			h = xData0[x] + xData2[x]
			w = xData1[x] + xData3[x]

			# compute both the starting and ending (x, y)-coordinates
			# for the text prediction bounding box
			endX = int(offsetX + (cos * xData1[x]) + (sin * xData2[x]))
			endY = int(offsetY - (sin * xData1[x]) + (cos * xData2[x]))
			startX = int(endX - w)
			startY = int(endY - h)

			# add the bounding box coordinates and probability score
			# to our respective lists
			rects.append((startX, startY, endX, endY))
			confidences.append(scoresData[x])

	# return a tuple of the bounding boxes and associated confidences
	return (rects, confidences)

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
ap.add_argument("-east", "--east", type=str, default='frozen_east_text_detection.pb',
	help="path to input EAST text detector")
ap.add_argument("-c", "--min-confidence", type=float, default=0.5,
	help="minimum probability required to inspect a region")
ap.add_argument("-w", "--width", type=int, default=320,
	help="nearest multiple of 32 for resized width")
ap.add_argument("-e", "--height", type=int, default=320,
	help="nearest multiple of 32 for resized height")
ap.add_argument("-p", "--padding", type=float, default=0.08,
	help="amount of padding to add to each border of ROI")    
args = vars(ap.parse_args())

image = cv2.imread(args["image"])
orig = image.copy()

orig1 = Image.open(args["image"])
orig1.save('C:/Users/prathmesh/Desktop/Final_Project/example.jpg')

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
cv2.putText(orig, text1, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 0.7,
	(0, 0, 255), 2)
cv2.putText(orig, text2, (20, 220), cv2.FONT_HERSHEY_SIMPLEX, 0.7,
	(0, 0, 255), 2)

# set the new width and height and then determine the ratio in change
# for both the width and height
output = cv2.bitwise_not(orig)
(origH, origW) = output.shape[:2]
(newW, newH) = (args["width"], args["height"])
rW = origW / float(newW)
rH = origH / float(newH)

# resize the image and grab the new image dimensions
output = cv2.resize(output, (newW, newH))
(H, W) = output.shape[:2]

# define the two output layer names for the EAST detector model that
# we are interested -- the first is the output probabilities and the
# second can be used to derive the bounding box coordinates of text
layerNames = ["feature_fusion/Conv_7/Sigmoid",
	"feature_fusion/concat_3"]

# load the pre-trained EAST text detector
print("[INFO] loading EAST text detector...")
net = cv2.dnn.readNet(args["east"])

# construct a blob from the image and then perform a forward pass of
# the model to obtain the two output layer sets
blob = cv2.dnn.blobFromImage(output, 1.0, (W, H), (123.68, 116.78, 103.94), swapRB=True, crop=True)
net.setInput(blob)
(scores, geometry) = net.forward(layerNames)

# decode the predictions, then  apply non-maxima suppression to
# suppress weak, overlapping bounding boxes
(rects, confidences) = decode_predictions(scores, geometry)
boxes = non_max_suppression(np.array(rects), probs=confidences)

print("-----------------------------------------------")
print("-------------Text Recognition Results----------")
print("-----------------------------------------------")
# initialize the list of results
results = []

# loop over the bounding boxes
for (startX, startY, endX, endY) in boxes:
	# scale the bounding box coordinates based on the respective
	# ratios
	startX = int(startX * rW)
	startY = int(startY * rH)
	endX = int(endX * rW)
	endY = int(endY * rH)

	# in order to obtain a better OCR of the text we can potentially
	# apply a bit of padding surrounding the bounding box -- here we
	# are computing the deltas in both the x and y directions
	dX = int((endX - startX) * args["padding"])
	dY = int((endY - startY) * args["padding"])

	# apply padding to each side of the bounding box, respectively
	startX = max(0, startX - dX)
	startY = max(0, startY - dY)
	endX = min(origW, endX + (dX * 2))
	endY = min(origH, endY + (dY * 2))

	# extract the actual padded ROI
	roi = orig[startY:endY, startX:endX]

	# in order to apply Tesseract v4 to OCR text we must supply
	# (1) a language, (2) an OEM flag of 4, indicating that the we
	# wish to use the LSTM neural net model for OCR, and finally
	# (3) an OEM value, in this case, 7 which implies that we are
	# treating the ROI as a single line of text
	config = ("-l eng --oem 1 --psm 7")
	text = pytesseract.image_to_string(roi, config=config)
	# add the bounding box coordinates and OCR'd text to the list
	# of results
	results.append(text)
# sort the results bounding box coordinates from top to bottom
# sorting is based on the y coordinates
#results = sorted(results, key=lambda r:r[0][1])
print(results)
# pre-process the image for classification

print("-----------------------------------------------")
print("-------Inserting Results into Database---------")
print("-----------------------------------------------")

def convertToBinaryData(filename):
    # Convert digital data to binary format
    with open(filename, 'rb') as file:
        binaryData = file.read()
    return binaryData

def insertBLOB(path, label3, label4, text3, text4):
    print("Inserting BLOB into result table")
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='Medical_Imaging',
                                             user='root',
                                             password='')

        cursor = connection.cursor()
        
        empPicture = convertToBinaryData(path)
        #file = convertToBinaryData(biodataFile)
        sql_insert_blob_query = "INSERT INTO result (Image, Body_Part_Name, Imaging_Technique_Name, Accuracy_By_Body_Part, Accuracy_By_Technique) VALUES  (%s,%s,%s,%s, %s)"
        # Convert data into tuple format
        insert_blob_tuple = (empPicture, label3, label4,text3,text4)
        result = cursor.execute(sql_insert_blob_query, insert_blob_tuple)
        connection.commit()
        print("Image and file inserted successfully as a BLOB into mri_image table", result)

    except mysql.connector.Error as error:
        print("Failed inserting BLOB data into MySQL table {}".format(error))

    finally:
        if (connection.is_connected()):
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

insertBLOB("C://Users//prathmesh//Desktop//Final_Project//example.jpg",""+label1, ""+label2, ""+str(text1), ""+str(text2))

connection1 = mysql.connector.connect(host='localhost',
                                             database='Medical_Imaging',
                                             user='root',
                                             password='')

# prepare a cursor object using cursor() method
cursor1 = connection1.cursor()

# execute the SQL query using execute() method.
desc_sql = "select Description from description where (Body_Part = %s) AND (Technique_Name = %s)"
#print(desc_sql)
desc_val = (""+label1 , ""+label2,)
cursor1.execute(desc_sql, desc_val)

# fetch all of the rows from the query
data = cursor1.fetchall ()
print("-----------------------------------------------")
print("----------------Description--------------------")
print("-----------------------------------------------")
print(data)


# print the rows

# close the cursor object
cursor1.close ()

# close the connection
connection1.close ()
print("-----------------------------------------------")
print("-----------------Results-----------------------")
print("-----------------------------------------------")
# show the output image
cv2.imshow("Image", orig)
cv2.imshow("Image", orig)
cv2.waitKey(0)


# sort the results bounding box coordinates from top to bottom
#results = sorted(results, key=lambda r:r[0][1])

#print("After for loop")
#for ((startX, startY, endX, endY), text) in results:
 #   text = "".join([c if ord(c) < 128 else "" for c in text]).strip()
    #print(results)
  #  print("{}\n".format(text))

# loop over the results
