#cloud-config

runcmd:
  # Configure vrrp
- |
  cat << EOF > /tmp/vrrp-setup.sh
  #!/bin/bash

  HOSTNAME=\$(hostname)

  if [ "\$HOSTNAME" == "andr-exp-instance1" ]; then
      KEEPALIVED_STATE='MASTER'
      KEEPALIVED_PRIORITY=100
  elif [ "\$HOSTNAME" == "andr-exp-instance2" ]; then
      KEEPALIVED_STATE='BACKUP'
      KEEPALIVED_PRIORITY=50
  else
      echo "invalid hostname \$HOSTNAME for install script \$0";
      exit 1;
  fi

  IP=\$(ip addr | grep inet | grep eth0 | grep -v secondary | awk '{ print \$2 }' | awk -F'/' '{ print \$1 }')

  echo "\$IP $HOSTNAME" >> /etc/hosts

  apt-get update
  apt-get -y install keepalived

  echo "vrrp_instance vrrp_group_1 {
      state \$KEEPALIVED_STATE
      interface eth0
      virtual_router_id 1
      priority \$KEEPALIVED_PRIORITY
      authentication {
          auth_type PASS
          auth_pass password
      }
      virtual_ipaddress {
          ${network_short}.20/24 brd ${network_short}.255 dev eth0
      }
  }" > /etc/keepalived/keepalived.conf

  apt-get -y install apache2
  echo "\$HOSTNAME" > /var/www/html/index.html
  service keepalived restart

  EOF

- chmod +x /tmp/vrrp-setup.sh
- /tmp/vrrp-setup.sh
