# servarr-stack Helm Chart

This chart installs a Servarr umbrella stack using the published JankCloud charts for:

- Radarr
- Sonarr

## Usage

Install with defaults (both subcharts enabled):

```bash
helm install servarr-stack jankcloud/servarr-stack
```

Disable a subchart:

```bash
helm install servarr-stack jankcloud/servarr-stack \
  --set radarr.enabled=false
```

## Values

Top-level values are passed through to each dependency chart under:

- `radarr.*`
- `sonarr.*`

Example:

```yaml
radarr:
  ingress:
    enabled: true

sonarr:
  ingress:
    enabled: true
```
