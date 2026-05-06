# Portfolio 01 — Security Operations · Service & Server Ops (English)

**DemoLab** is a **fictional** company. IPs, tickets, and metrics are **dummy** data. See [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md).

## What this repo demonstrates

| Area | Artifacts |
|------|-----------|
| Service ops | Health checks, deployment checklist, rollback framing |
| Server ops | Disk/log scripts, Ansible baseline sample |
| Security / SOC | Governance docs, mock SOC tabletop, ethical lab ROE template |
| Monitoring | **Docker Lab**: Prometheus, **Alertmanager**, Grafana, Blackbox; optional smoke script |
| API contract | [examples/api-contract/openapi.yaml](examples/api-contract/openapi.yaml) — **DL-BFF** dummy OpenAPI (no server impl.) |
| Vuln & patch (series) | [Portfolio 11](https://github.com/yunsunghun/portfolio-11-vulnerability-patch-ops) — patch windows, SLA tracker, SBOM how-to |

## Quick start

```bash
cd examples/demo-stack && docker compose up -d
curl -sf http://localhost:8080/health
```

```bash
cd examples/monitoring-lab && docker compose up -d
# Grafana http://localhost:3000  user/pass: demolab / demolab-grafana
# Prometheus http://localhost:9090   Alertmanager http://localhost:9093
```

```bash
sh examples/monitoring-lab/scripts/smoke.sh
# Optional: PROM_URL / GRAFANA_URL / ALERTMANAGER_URL override ports
```

## Docs

- Korean README: [README.md](README.md)
- Monitoring lab: [docs/08-MONITORING-LAB.md](docs/08-MONITORING-LAB.md)
- Changelog: [CHANGELOG.md](CHANGELOG.md)
- Contributing: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Fictional** narrative sample (replace before interviews): [docs/ABOUT-ME-FILLED-SAMPLE.md](docs/ABOUT-ME-FILLED-SAMPLE.md)
- Screenshots / mockups: [docs/assets/README.md](docs/assets/README.md)

## CI

Copy `docs/reference-github-actions-ci.yml` to `.github/workflows/ci.yml` after `gh auth refresh -s workflow` (see Korean README).

## License

[LICENSE](LICENSE) (MIT) · [SECURITY.md](SECURITY.md)
