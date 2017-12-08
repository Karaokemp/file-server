import sys
from pytube import YouTube


address = sys.argv[1]

YouTube(address).streams.filter(progressive=True, file_extension='mp4').first().download()
