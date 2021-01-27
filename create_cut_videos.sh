cd data/videos

ffmpeg -i AVSS_AB_Easy_Divx.avi  -vf "select=between(n\,1151\,1698),setpts=PTS-STARTPTS" "AVSS_AB_Easy_Divx_1151_1698.mp4"
ffmpeg -i AVSS_AB_Easy_Divx.avi  -vf "select=between(n\,1814\,2217),setpts=PTS-STARTPTS" "AVSS_AB_Easy_Divx_1814_2217.mp4"
ffmpeg -i AVSS_AB_Easy_Divx.avi  -vf "select=between(n\,2200\,2412),setpts=PTS-STARTPTS" "AVSS_AB_Easy_Divx_2200_2412.mp4"
ffmpeg -i AVSS_AB_Easy_Divx.avi  -vf "select=between(n\,2700\,3006),setpts=PTS-STARTPTS" "AVSS_AB_Easy_Divx_2700_.mp4"


