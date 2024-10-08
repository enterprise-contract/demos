#!/bin/bash

. ../demo-magic.sh

DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
TYPE_SPEED=30

pe "ec validate image --image quay.io/konflux-ci/ec-golden-image:latest --public-key public.key --ignore-rekor"
pe "cat public.key"
pe "cosign tree quay.io/konflux-ci/ec-golden-image:latest"
pe "cosign verify --key public.key --insecure-ignore-tlog=true quay.io/konflux-ci/ec-golden-image:latest"
pe "cosign verify-attestation --key public.key --type slsaprovenance02 --insecure-ignore-tlog=true quay.io/konflux-ci/ec-golden-image:latest 2>&1 | cut -c 1-200"
