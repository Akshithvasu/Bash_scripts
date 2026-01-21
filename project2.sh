#!/bin/bash

echo "All open and listening ports"
ss -ln

read -p "Enter the file : " file

while read -r site; do
    code=$(curl -o /dev/null -s -w "%{http_code}" "http://$site")
    echo "$site -> HTTP $code"

    if [[ "$code" -eq 200 ]]; then
        avg_latency=$(ping -c 5 "$site" | tail -1 | awk -F'/' '{print $5}')
        echo "Average latency to $site: ${avg_latency} ms"
    fi

done < "$file"

