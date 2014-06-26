import time
import os



def write_to(FILE_BOX, filename, file_content):
    filename = str(len(FILE_BOX)) + "_"+ filename
    FILE_BOX.append(filename)
    file_handle = open(filename, 'w')
    file_handle.write(file_content)
    file_handle.close()
    print FILE_BOX
