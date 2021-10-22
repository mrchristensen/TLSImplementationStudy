#! /bin/bash

mkdir -p ./tls_results

echo "Establishing TLS connection with..."

for site in "google.com" "gmail.com" "instagram.com" "chase.com" "byu.edu" "youtube.com" "app.clickup.com" "clickup.com" "ksl.com" "facebook.com" "store.steampowered.com" "steampowered.com" "mastercard.com" "unity3d.com" "wikipedia.org"; do
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