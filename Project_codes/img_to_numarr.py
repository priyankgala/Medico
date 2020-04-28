from PIL import Image
import numpy
im = Image.open("image_path")
np_im = numpy.array(im)
print (np_im.shape)