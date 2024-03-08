#!/bin/bash

function connectInstance()
{
	local instance_id= #<your instance id>
	local publicDns=$(aws ec2 describe-instances --instance-ids "$instance_id" --query "Reservations[0].Instances[0].PublicDnsName" --output text)
	
	echo "<------------ Connecting ------------>"
	
	ssh -i path/to/private-key.pem ec2-user@$publicDns
	
	#ec2-user : mostly is ubuntu if you are using linux

	echo "<------------ Connected ------------->"
}

connectInstance

