#! /bin/sh

# Create client_crt client_key
echo "$LDAP_CLIENT_CRT" > /etc/stunnel/ldap-client.crt
echo "$LDAP_CLIENT_KEY" > /etc/stunnel/ldap-client.key

# Create configulation
cat <<EOF > /etc/stunnel/google-ldap.conf
foreground = yes
[ldap]
client = yes
accept = $ACCEPT_IP_ADDR:$ACCEPT_PORT
connect = $LDAP_CONNECT_URL:$LDAP_CONNECT_PORT
cert = /etc/stunnel/ldap-client.crt
key = /etc/stunnel/ldap-client.key
EOF

# enable stunnel
echo ENABLED=1 >> /etc/default/stunnel4

# start stunnel4
/usr/bin/stunnel4 /etc/stunnel/google-ldap.conf

