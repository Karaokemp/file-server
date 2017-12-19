import subprocess

import sys
from pytube import YouTube

address = sys.argv[1]

print "Downloading from youtube Link: " +address
YouTube(address).streams.filter(progressive=True, file_extension='mp4').first().download()

print "aploading to Mega..."
subprocess.call('sh toMega.sh', shell=True)
