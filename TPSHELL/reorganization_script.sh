#!/bin/bash

# Retrieving arguments

repo=repo_$1

mkdir -p "root/"$repo

for file in "$repo"/*.txt; do

# Retrieving the complete path and the name of the file
filepath=$(realpath "$file")
filename=$(basename "$file")

# in cut, -d is the delimiter, -f n is the placement of the value to retrieve
# Example of a file name : git_2023-06-29-12-42-19-64.txt

prefix=$(echo "$filename" | cut -d '_' -f 1)
year=$(echo "$filename" | cut -d '-' -f 1 | cut -d '_' -f 2)
month=$(echo "$filename" | cut -d '-' -f 2)
day=$(echo "$filename" | cut -d '-' -f 3)
hour=$(echo "$filename" | cut -d '-' -f 4)
minute=$(echo "$filename" | cut -d '-' -f 5)
seconds=$(echo "$filename" | cut -d '-' -f 6)
milliseconds=$(echo "$filename" | cut -d '-' -f 7 | cut -d '.' -f 1)

# Path to the new directory where to stock the files
newpath_dir=root/$repo/$prefix/$year/$month/$day/$hour

#Complete new path of the file
newpath_file=$newpath_dir/$minute$seconds$milliseconds.dat

# Creating all the directories
mkdir -p $newpath_dir

# Moving the file to a new location and renaming it
mv $file $newpath_file
echo $file" successfully moved to "$newpath_file

# Filling the file with its old name, its old path and the name of the script that created it
echo "$filename" > $newpath_file
echo "$filepath" >> $newpath_file
echo "creation_script.sh" >>$newpath_file

# Giving reading and writing rights to owner only
chmod 600 $newpath_file
done

# Delete empty directory
rmdir $repo
echo "Success"
exit
