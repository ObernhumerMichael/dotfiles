#!/bin/sh

event_monitorremoved() {
    # MONITORNAME
    eww open bar
}

event_monitoradded() {
    # MONITORNAME
    sleep 1
    eww open bar
}

