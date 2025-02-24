count=0
total=$(wc -l < resolve.txt) #you can change the name to you subdomain file

while read sub; do 
  count=$((count + 1))
  echo "[$count/$total] Checking: $sub" | tee -a result_ip.txt #you can change the name of you output file instead of resolved.txt
  nslookup $sub | tee -a result_ip.txt #you can change the name of you output file instead of resolved.txt #Only if you changed it above
  dig $sub +short | tee -a result_ip.txt #you can change the name of you output file instead of resolved.txt #Only if you changed it above
  host $sub | tee -a result_ip.txt #you can change the name of you output file instead of resolved.txt #Only if you changed it above
  echo "------------------" | tee -a result_ip.txt #you can change the name of you output file instead of resolved.txt #Only if you changed it above
done < resolved.txt #you have to change the subdomain file name here also
