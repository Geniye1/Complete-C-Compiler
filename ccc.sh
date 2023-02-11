#!/bin/sh

echo "Compiling files..."

# DEFAULT VALUESssss
path="."
object_name="output"

function usage {
  echo "Usage: $(basename $0) [-o] [-p] "
}

while getopts o:p: OPTION;
do
  case "$OPTION" in
    o)
      object_name=$OPTARG
      ;;
    p)
      path=$OPTARG
      ;;
    *)
      echo "Invalid flag!"
      usage
      exit -1
      ;;
  esac
done

# Get files and append them to the command string
files_2_cumpile=""
for entry in "$path"/*
do
  echo "FILE: $entry"

  if [[ "$entry" = *.c ]]
  then
    filename="${entry:2}"
    files_2_cumpile+="${filename} "
  fi
done

# !!! CUMPILE TIME !!!
gcc -o ${object_name} ${files_2_cumpile}
echo "Compilation finished with name ${object_name}!"
