#!/bin/bash
        /usr/sbin/useradd ansibletest
        echo "ansibletest        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/ansibletest
        /usr/bin/mkdir /home/ansibletest/.ssh
        /usr/bin/chown ansibletest:ansibletest /home/ansibletest/.ssh
        /usr/bin/chmod 700 /home/ansibletest/.ssh
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKFHALTNbd+vTsTgFzWvHmOxvmrusndVjBvxH60meDVK+E62mB7CBN3c3lDHt1Y2K5rT0c61CoSlGrNp8F2DbLN3Tq17CHTsvDgBSniYIFF0BfgKbNjyXmRLwPeJ/YxH74ZEdNsHzqx9pp7svqnDMAI8sPZ3D67SjvgWcn0Vin8N7vq124SZbYaCqlelr77vZxydJQ9bZgLCVGBoucPAZsjll6O5tKa//J9d+PkuAFKJwkke7tjn3QFAmD9zhewiv9sUjdooBspZjj/mRdiViLE83WBnehY7/BIzF3wjS/yXvCVTNntLgJ1CiVUbt2vP1a9i53DrJZOzDIiNKh3mYTpxkjq203RNot38BQxn3nMqbaMd58jzUIhbuCk1amCZQeDyhG52vPPUHhRD58onNs2wIJbct6PK11Esl2/0QOcwZeeANICDyjlz4Xdkr171ZfstJK79fevC+lZVAuvQLZAtf/JRv6d/gUpJd1qNQvEvIjXSUgKBeLu2bhbKg7Dms= root@cloudEc2.technix.com" >> /home/ansibletest/.ssh/authorized_keys
        /usr/bin/chmod 600 /home/ansibletest/.ssh/authorized_keys
        /usr/bin/chown ansibletest:ansibletest /home/ansibletest/.ssh/authorized_keys
