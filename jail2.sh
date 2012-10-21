#!/bin/sh

# PROVIDE: jail
# REQUIRE: LOGIN cleanvar
# BEFORE: securelevel
# KEYWORD: shutdown

. /etc/rc.subr

name="jail2"
rcvar=jail2_enable

start_cmd="jail_start"
stop_cmd="jail_stop"

jail_start()
{
	echo -n "Starting jails: "

	for _j in ${jail2_list}; do
		echo -n "${_j} "

		if [ -e /var/run/jail_${_j}.id ]; then
			echo "${_j} already exists"
			continue
		fi

		jail -c -q -J /var/run/jail_${_j}.id ${_j} > /dev/null 2>&1
	done

	echo
}

jail_stop()
{
	echo -n "Stopping jails: "

	for _j in ${jail2_list}; do
     	echo -n "${_j} "

		if [ ! -e /var/run/jail_${_j}.id ]; then
			echo "${_j} doesn't exists"
			continue
		fi

		jail -r -q ${_j} > /dev/null 2>&1
		rm /var/run/jail_${_j}.id
	done

	echo
}

load_rc_config $name
: ${jailrc_enable="NO"}

cmd="$1"
if [ $# -gt 0 ]; then
	shift
fi
if [ -n "$*" ]; then
	jail2_list="$*"
fi

run_rc_command "${cmd}"
