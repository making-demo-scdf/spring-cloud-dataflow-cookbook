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
echo "stream create --name $dir --definition \"time | log\"" > $dir/$dir.log
echo "stream deploy --name $dir" >> $dir/$dir.log

echo "create $dir/README.md"
echo "# $title" > $dir/README.md
echo "" >> $dir/README.md
echo "## Deploy stream" >> $dir/README.md
echo "" >> $dir/README.md
echo "\`\`\` shell" >> $dir/README.md
echo "../deploy-stream.sh $dir.log" >> $dir/README.md
echo "\`\`\`" >> $dir/README.md
echo "" >> $dir/README.md
echo "## Test stream" >> $dir/README.md
echo "" >> $dir/README.md
echo "\`\`\`" >> $dir/README.md
echo "\`\`\`" >> $dir/README.md
echo "" >> $dir/README.md
echo "## Destroy stream" >> $dir/README.md
echo "" >> $dir/README.md
echo "\`\`\` shell" >> $dir/README.md
echo "../destroy-stream.sh $dir" >> $dir/README.md
echo "\`\`\`" >> $dir/README.md
echo "Done!"
