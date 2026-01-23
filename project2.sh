#!/bin/bash

echo "All open and listening ports"
ss -ln

read -p "Enter the file : " file

while read -r site; do
    code=$(curl -o /dev/null -s -w "%{http_code}" "$site")
    echo "$site -> HTTP $code"

    if [[ "$code" -eq 200 ]]; then
        host=$(echo "$site" | sed 's~https\?://~~; s~/.*~~')
        avg_latency=$(ping -c 2 "$host" | tail -1 | awk -F'/' '{print $5}')
        echo "Average latency to $host: ${avg_latency} ms"
    fi

done < "$file"
