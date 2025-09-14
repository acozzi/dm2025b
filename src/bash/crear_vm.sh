!#/bin/bash

gcloud compute instances create temp-08vcpu-128ram-20250914-200010-boruta \
    --project=mcd-dm2025 \
    --zone=northamerica-northeast2-a \
    --machine-type=custom-8-131072-ext \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --no-restart-on-failure \
    --maintenance-policy=TERMINATE \
    --provisioning-model=STANDARD \
    --service-account=576639328805-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=temp-08vcpu-128ram,image=projects/mcd-dm2025/global/images/image-dm,mode=rw,size=256,type=pd-standard \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=none \
&& \
gcloud compute resource-policies create snapshot-schedule default-schedule-1 \
    --project=mcd-dm2025 \
    --region=northamerica-northeast2 \
    --max-retention-days=14 \
    --on-source-disk-delete=keep-auto-snapshots \
    --daily-schedule \
    --start-time=17:00 \
&& \
gcloud compute disks add-resource-policies temp-08vcpu-128ram \
    --project=mcd-dm2025 \
    --zone=northamerica-northeast2-a \
    --resource-policies=projects/mcd-dm2025/regions/northamerica-northeast2/resourcePolicies/default-schedule-1