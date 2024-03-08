#!/bin/bash

function startInstance()
{
	local instance_id=<your instance id>
	aws ec2 start-instances --instance-ids $instance_id
}

function checkInstance()
{
	local instance_id=<your instance id>
	echo "Waiting for instance $instance_id to in running state..."

	while true;
	do
		state=$(aws ec2 describe-instances --instance-ids "$instance_id"  --query 'Reservations[0].Instances[0].State.Name' --output text)
		if [[ "$state" == "running" ]]; then
			echo "Instance $instance_id is now running."
			break
		fi
		sleep 10
	done	
}

startInstance

checkInstance
