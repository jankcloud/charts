# qui Helm Chart

This chart deploys `ghcr.io/autobrr/qui`.

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
			storageClass: s45-nfs
			volumeName: ""
```
