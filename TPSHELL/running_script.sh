#!/bin/bash

declare -A repos

repos[devops]="linux git aws"
repos[data]="python scala spark"
repos[fonctionel]="spec sql postman"

repo_names=("devops" "data" "fonctionel")

for repo_name in ${repo_names[@]}; do
echo "repo name : "$repo_name
for tool in ${repos[$repo_name]}; do
echo $tool
./creation_script.sh $repo_name 3 $tool 300
./reorganization_script.sh $repo_name
done
done

echo "Success"
exit
