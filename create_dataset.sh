conda activate pytorch

for video in data/videos/*.mp4
do
	FILENAME=$(basename $video)
	mkdir -p output/$FILENAME/frames
	mkdir -p output/$FILENAME/alphapose
	echo $video
	echo $FILENAME

	if [ ! -f "output/$FILENAME/frames/001.png" ]; then
		# ffmpeg -i "$video" -r 1/1 "output/frames/$video%03d.png"
		ffmpeg -i "$video" -vf scale=w=480:h=270:force_original_aspect_ratio=decrease "output/$FILENAME/frames/%03d.png"
	fi

	if [ ! -f "output/$FILENAME/alphapose/alphapose-results.json" ]; then
		cd libs/AlphaPose
			python scripts/demo_inference.py \
			    --cfg pretrained_models/256x192_res152_lr1e-3_1x-duc.yaml \
			    --checkpoint pretrained_models/fast_421_res152_256x192.pth \
			    --indir ../../output/$FILENAME/frames/ \
			    --outdir ../../output/$FILENAME/alphapose/ \
			    --save_img  --pose_track
		cd ../..
	fi

	if [ ! -f "output/$FILENAME/alphapose/keypoints.json" ]; then
		cd output/$FILENAME/alphapose/
			node ../../../convert.js 
		cd ../../..
	fi

	if [ ! -f "output/$FILENAME/alphapose/iuv/01/001.png" ]; then
		cp metadata.json output/$FILENAME/alphapose/metadata.json
		cd libs/retiming/
		bash datasets/prepare_iuv.sh ../../output/$FILENAME/alphapose
		cd ../../
	fi
done







