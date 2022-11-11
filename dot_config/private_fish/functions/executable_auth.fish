#!/usr/bin/env bash
set account_id $argv
echo $account_id
### https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/
set creds (aws sts assume-role --role-arn arn:aws:iam::$argv:role/EKS-AllAccess --role-session-name test | jq '.Credentials')
set key_id (echo $creds | jq -r '.AccessKeyId')
set secret (echo $creds | jq -r '.SecretAccessKey')
set session_token (echo $creds | jq -r '.SessionToken')
echo $key_id
echo $secret
echo $session_token
set -x AWS_ACCESS_KEY_ID $key_id
set -x AWS_SESSION_TOKEN $session_token
set -x AWS_SECRET_ACCESS_KEY $secret
