# qui Helm Chart

This chart deploys `ghcr.io/autobrr/qui`.

## Metrics

Qui exposes Prometheus metrics on a dedicated endpoint when enabled.

- Set `metrics.enabled=true` to configure and expose metrics.
- The chart sets `QUI__METRICS_ENABLED` automatically and, when enabled, also sets `QUI__METRICS_HOST` and `QUI__METRICS_PORT`.
- Enable `prometheus.scrapeAnnotations.enabled=true` to add scrape annotations to the Service.
- Enable `serviceMonitor.enabled=true` (with metrics enabled) to create a `ServiceMonitor` resource.

Example:

```yaml
metrics:
	enabled: true
	host: 0.0.0.0
	port: 9074
	path: /metrics

prometheus:
	scrapeAnnotations:
		enabled: true

serviceMonitor:
	enabled: true
	interval: 30s
	scrapeTimeout: 10s
```

## Storage

- `persistence` contains only the `/config` PVC configuration.
- Use `additionalVolumes` for any number of extra mounts.
- Each `additionalVolumes` item supports either:
	- `existingClaim`: mount an existing PVC, or
	- `pvc`: create a new PVC automatically.

Example:

```yaml
persistence:
	config:
		enabled: true

additionalVolumes:
	- name: torrents
		mountPath: /torrents
		existingClaim: qbittorrent-torrents
	- name: media
		mountPath: /media
		pvc:
			size: 2Ti
			accessMode: ReadWriteMany
			storageClass: nfs-csi-driver
			volumeName: ""
```
