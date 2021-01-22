conda activate alphapose
mkdir -p output/frames

for video in data/videos/*.mp4
do
	echo $video
	ffmpeg -i "$video" -r 1/1 "output/frames/$filename%03d.png"
done
