#!/usr/bin/env bash

eksctl create cluster --name $1 --version 1.14 --region us-west-2 --nodegroup-name standard-workers --node-type t3.medium --nodes 1 --nodes-min 1 --nodes-max 2 --managed