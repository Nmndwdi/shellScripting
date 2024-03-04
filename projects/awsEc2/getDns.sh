#!/bin/bash

function getDns()
{
	local instance_id=<your instance id>
        local publicDns=$(aws ec2 describe-instances --instance-ids "$instance_id" --query "Reservations[0].Instances[0].PublicDnsName" --output text)

        echo "publicDns is $publicDns"
}

getDns
