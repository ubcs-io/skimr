# File for customizing implementation
source config.sh

# Settings for pre-processing and OCR language used
lang="eng"
exposure="100"
saturation="0"
hue="0"

# Presuming scans are 300 DPI
density="300"

# Edit IM format if you want, TIFF is good default
cleaned_format="tiff"

# Find file names in the input dir, pipe out ls noise
file_names=$(ls -l1 ${skimr_root}/in/ 2> /dev/null)

echo "Begin extraction using the ${lang} model"

for file in ${file_names}; do

	# The original file input
	input_filepath="${skimr_root}/in/${file}"

	# Extract the file name so we can write a new file with that name
	splitfilename=(${file//./ })
	filename=${splitfilename[0]}

	# Specify output file destination for pre-process
	cleaned_image_path="${skimr_root}/tmp/${filename}.${cleaned_format}"

	echo "Cleaning up image ${file}, converting to .${cleaned_format}"

	# Image cleanup increases exposure, improves extraction
	convert -modulate "${exposure},${saturation},${hue}" -density "${density}" "${input_filepath}" -depth 8 -strip -background white -alpha off "${cleaned_image_path}"

	# Set the destination for the output TXT file
	single_output="${skimr_root}/out/${filename}"

	# Pass the file to be extracted and the destination
	tesseract "${cleaned_image_path}" "${single_output}" -l "${lang}"

done

echo "Extraction complete"




