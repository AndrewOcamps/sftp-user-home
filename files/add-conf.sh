#!/bin/bash

# gerardo ocampos

sed -i 's/if $startSshd; then/if $startSshd; then \n    # reconfigire \n    chmod +x \/reconfigure-sftp.sh \n    sh \/reconfigure-sftp.sh/g' /entrypoint



