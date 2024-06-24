# i3-wm Notes

add below to i3status.conf

```i3status.conf
...
order += "read_file uptime"

read_file uptime {
    path = "/tmp/uptime"
}
...
```

Schedule cron or below systemd uptime-monitor.service

```uptime-monitor.service
[Unit]
Description=Uptime Monitor

[Service]
Type=simple
ExecStart=/bin/bash -c 'while true; do uptime --pretty > /tmp/uptime; sleep 1; done'

[Install]
WantedBy=default.target
```