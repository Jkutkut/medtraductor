#!/bin/bash

askPassword() {
	concept="$1"
	while true; do
		read -s -p "Password for $concept: " PASSWD;
		echo;
		if [ "$PASSWD" = "" ]; then
			echo "The password must not be empty";
			continue;
		fi
		read -s -p "Confirm password : " PASSWD_CONFIRM;
		echo;
		if [ "$PASSWD" = "$PASSWD_CONFIRM" ]; then
			break;
		fi
		echo "Passwords do not match";
		echo;
	done
}

SECRET_FILE="$1"

askData() {
	question="$1"
	default="$2"

	if [ ! "$default" = "" ]; then
		question="$question [$default]: ";
	else
		question="$question: ";
	fi

	read -p "$question" data

	if [ "$data" = "" ]; then
		data="$default"
	fi
}

currentDirName=${PWD##*/}

echo "Google auth credentials:";
askData "CLIENT_ID"; CLIENT_ID="$data";

echo "#!/bin/bash
# Google auth credentials
VITE_GOOGLE_AUTH_CLIENT_ID='$CLIENT_ID'
" > $SECRET_FILE
