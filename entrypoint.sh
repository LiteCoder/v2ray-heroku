cd /v2raybin

if [ "$VER" = "latest" ]; then
  V_VER=`wget -qO- "https://api.github.com/repos/v2ray/v2ray-core/releases/latest" | grep 'tag_name' | cut -d\" -f4`
else
  V_VER="v$VER"
fi

wget -O v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/$V_VER/v2ray-linux-64.zip
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
