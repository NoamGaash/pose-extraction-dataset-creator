import { readFileSync, writeFileSync } from 'fs';
let getJson = filename => JSON.parse(readFileSync(filename, 'utf-8'))


var pose = getJson('./alphapose-results.json')

var result = pose.reduce((obj, newData) => {
	obj[newData.image_id] = [{
		score: newData.score,
		keypoints: newData.keypoints,
		idx: 1
	}];
	return obj;
}, {})

console.log(result)

result = JSON.stringify(result)

writeFileSync('keypoints.json', result);





