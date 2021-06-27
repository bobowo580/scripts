# private
curl -ks https://jldc.me/anubis/subdomains/jd.com | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | tee -i -a jd.txt;cat jd.txt| parallel -j50 -q curl -w '%{url_effective}\t Status:%{http_code}\t IP:%{remote_ip}\n' -o /dev/null -sk | tee -i -a jd-http.txt
