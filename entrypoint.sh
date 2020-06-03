cd /v2raybin

if [ "$VER" = "latest" ]; then
  URL="https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip"
else
  URL="https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip"
fi

wget -O v2ray.zip $URL
unzip v2ray.zip 

chmod +x v2ray
chmod +x v2ctl

#echo -e -n "$CONFIG_JSON1" > config.json
#echo -e -n "$PORT" >> config.json
#echo -e -n "$CONFIG_JSON2" >> config.json
#echo -e -n "$UUID" >> config.json
#echo -e -n "$CONFIG_JSON3" >> config.json

sed -i "s/66666/$PORT/g" config.json
sed -i "s/your_uuid/$UUID/g" config.json

./v2ray
