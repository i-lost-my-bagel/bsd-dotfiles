#!/usr/bin/env bash

complete -W "get set" powerctl

_powerctl_completions()
{
	if [ "${COMP_WORDS[1]}" == "set" ]; then
		COMPREPLY=($(compgen -W "power-saver balanced performance" -- "${COMP_WORDS[2]}"))
		return
	elif [ "${COMP_WORDS[1]}" == "get" ]; then
		return
	fi

	COMPREPLY=($(compgen -W "get set" -- "${COMP_WORDS[1]}"))
}

complete -F _powerctl_completions powerctl
