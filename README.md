This is a very quick and dirty tool to convert vmf files to very ugly json (at the moment)

There is one main  problems with the vmf format that I have yet to address - duplicate keys are allowed.  Because json does not allow duplicate keys, the tool instead makes each value an array of one or more values.

Usage:  I dunno how to properly do node projects.  Just cd into the directory and do

    node vmf2json.js inputfile.vmf outputfile.json


License:  do whatever you want with this tool.  Maybe improve it or something
