import time
import os

def write_to(filename, file_content):
    file_handle = open(filename, 'w')
    file_handle.write(file_content)
    file_handle.close()