# 顯示當下目錄的 json 
for filename in `ls .`  # `ls .` 要用鍵整左上 esc 下的 `
do
  if echo "$filename" | grep "json"
  then
    echo "$filename"
  fi
done
