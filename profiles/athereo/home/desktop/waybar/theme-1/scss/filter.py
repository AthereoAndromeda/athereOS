# This is a utility that simply copies all the folders in the
# current dir, except for the filtered values, to the build dir
#
# This skirts arounds the read-only nature of the Nix Store

import os
import shutil

def get_all_files(directory):
  """Returns a list of all files and directories within a given directory, including subdirectories.

  Args:
    directory: The path to the directory to search.

  Returns:
    A list of file and directory paths.
  """

  file_list = []
  for root, _, files in os.walk(directory):
    for file in files:
      file_list.append(os.path.join(root, file))
  return file_list


print("start filter")

# Example usage:
filter_vals = ["./_base16.scss", "./filter.py"]
directory_path = "."

all_files = get_all_files(directory_path)
filtered = list(filter(lambda s: all(s != x for x in filter_vals), all_files))

# print(filtered)

pros = list(map(lambda p: "../build/" + p[2:], filtered))
# print(pros)

zipped = zip(filtered, pros)
# print(zipped)

for src, dest in zipped:
  os.makedirs(os.path.dirname(dest), exist_ok=True)
  shutil.copy(src, dest)
