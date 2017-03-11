for filename in 'ls .'
do
  if echo "$filename" | grep "xml"
  then
    echo "$filename"
  fi
done
