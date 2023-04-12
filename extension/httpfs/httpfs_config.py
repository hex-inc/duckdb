
import os
# list all include directories
include_directories = [os.path.sep.join(x.split('/')) for x in ['extension/httpfs/include']]
# source files
source_files = [os.path.sep.join(x.split('/')) for x in ['extension/httpfs/httpfs-extension.cpp', 'extension/httpfs/httpfs.cpp', 'extension/httpfs/s3fs.cpp', 'extension/httpfs/crypto.cpp']]

