#!/bin/sh
printf "Enter Title > "
read title

if [ "$title" = "" ];then
  echo "title is empty!"
  exit 1
fi

dir=`echo $title | tr  A-Z a-z | tr ' ' '-' | tr -d ',!/'`

echo "create $dir"
mkdir -p $dir
echo "create $dir/$dir.log"
touch $dir/$dir.log
echo "create $dir/README.md"
echo "# $title" > $dir/README.md
echo "Done!"
