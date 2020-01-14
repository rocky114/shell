#!/bin/bash

current_time=$(date +"%Y%m%d")

nginx_log_migrate()
{
	target_dir=/wwwroot/logs/nginx

	cd ${target_dir}

	for var in $(ls); do
		cd ${target_dir}
		if [[ -d $var ]]; then
			cd $var
			for item in $(ls); do
				if [[ -d $item ]]; then
					gzip -r $item
				fi
			done	
		fi			
	done

	cd /wwwroot/logs

	aws s3 mv nginx s3://heavengifts-logs/hg/$(uname -n)/nginx --recursive --exclude "*" --include "*.gz"
}

business_log_migrate()
{
	target_dir=/wwwroot/beta.heavengifts.com/configs/logs

	cd ${target_dir}

	for var in $(ls); do
		if [[ -f ${var} ]]; then
			temp=$(echo $var | tr -cd "[0-9]")
			if [[ temp -lt current_time ]]; then
				sudo gzip ${var}
			fi
		fi			
	done

	for var in $(ls); do
		cd ${target_dir}
		if [[ -d ${var} ]]; then
			cd ${var}
			for item in $(ls); do
				if [[ -f ${item} ]]; then
					temp=$(echo $item | tr -cd "[0-9]")
					if [[ temp -lt current_time ]]; then
						sudo gzip $item
					fi
				fi
			done
		fi
	done

	cd /wwwroot/beta.heavengifts.com/configs

	aws s3 mv logs s3://heavengifts-logs/hg/$(uname -n)/business --recursive --exclude "*" --include "*.gz"
}

nginx_log_migrate

business_log_migrate

