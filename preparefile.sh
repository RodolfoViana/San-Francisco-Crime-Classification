#!/bin/bash

# Example

# bash preparefile.sh path name
# bash preparefile.sh /home/rodolfo/glm1 glm1submitt

Rscript firstscript.r $1

echo "Ziping file"
zip $2.zip $1.csv

echo "Done"
