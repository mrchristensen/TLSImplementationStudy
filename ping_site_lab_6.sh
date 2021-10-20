#! /bin/bash

mkdir -p ./tls_results

echo "Establishing TLS connection with..."

# Replace these sites with your list of ten sites. 
# The top-level domain (com, edu, gov, net, etc.) should be 3 characters long b/c I'm lazy with formatting
for site in "example.com" "google.com" "usa.gov"; do
echo ${site}
timeout 30 openssl s_client -connect ${site}:443 &> ./tls_results/tls_details_for_${site:0:-4}.txt &
done

echo ""

secs=30
while [ $secs -gt 0 ]; do
   echo -ne "$secs secs before timeout \033[0K\r"
   sleep 1
   : $((secs--))
done

echo "Results saved in ./tls_results"