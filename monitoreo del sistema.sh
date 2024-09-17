#!/bin/bash

#alerta
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9]*\)%* id.*/\1/" | awk '{print 100 -$1}')
    echo "uso del cpu: $cpu_usage%"
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -1) )); the
    	echo "ALERTA: Uso del cpu por encima del $CPU_THRESOLD%!"
    fi
}
check_memory() {
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0} ')
    echo "Uso de la memoria: $memory_usage%"
    if (( $(echo"memory_usage > $MEMORY_THRESHOLD" | bc -1) )); then
    	echo "ALERTA: uso de la memoria por encima del "MEMORY_THRESHOLD%!"
    fi
}
check_disk() {
    disk_usage=$(df / | grep / | awk ' { prit $5}' | sed 's/%//g')
    echo "Uso del disco: $disk_usage%"
    if [ $disk_usage -gt $DISK_THRESHOLD ]; then 
    	echo "ALERTA: Uso del disco por encima del "$DISK_THRESHOLD%!"
    fi
}

check_vmstat() {
    vmstat 1 5 
}
check_iostat() {
    iostat -dx 1 5
}
check_cpu
check_memory
check_disk
check_vmstat
check iostat
