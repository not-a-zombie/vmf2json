const fs = require('fs');
const vmfparser = require('./vmfparser.js');
if(process.argv.length < 4){
	console.log("Usage: node vmf2json.js inputfile.vmf outputfile.json");
	process.exit();
}
const inputFileName = process.argv[2];
const inputFileText = fs.readFileSync(inputFileName,'utf8');
const parsed = vmfparser.parse(inputFileText);
const outputFileName = process.argv[3];
const outputFileText = JSON.stringify(parsed);
fs.writeFileSync(outputFileName,outputFileText);
