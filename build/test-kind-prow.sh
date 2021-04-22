#!/bin/bash

KEY="$SHARED_DIR/private.pem"
chmod 400 "$KEY"

IP="$(cat "$SHARED_DIR/public_ip")"
HOST="ec2-user@$IP"
OPT=(-q -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i "$KEY")

scp "${OPT[@]}" build/test-kind-remote.sh "$HOST:/tmp/test.sh"
ssh "${OPT[@]}" "$HOST" /tmp/test.sh > >(tee "$ARTIFACT_DIR/test.log") 2>&1
