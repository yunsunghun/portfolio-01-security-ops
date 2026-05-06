# Portfolio 01 — Security Operations · Service & Server Ops (English)

This repository is structured so you can demonstrate **operations capability through docs, runnable samples, and CI** without a cloud account.  
**DemoLab** is **fictional**: organization names, IPs, and ticket IDs follow [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md) and `examples/sample-data/`.

## One-line summary

**Availability checks, server baselines, security governance, and incident runbooks** live alongside **Docker demos, Terraform/Ansible samples, and GitHub Actions** ([`.github/workflows/ci.yml`](.github/workflows/ci.yml)) for reproducibility.

## What this repo demonstrates

| Area | Artifacts |
|------|-----------|
| Service ops | Health checks, deployment checklist, rollback framing |
| Server ops | Disk/log scripts, Ansible baseline sample |
| Security / SOC | Governance docs, CVE templates, CI static checks, **mock SOC / ethical lab notes** |
| Monitoring | **Docker lab**: Prometheus, **Alertmanager**, Grafana, Blackbox; optional [smoke script](examples/monitoring-lab/scripts/smoke.sh) |
| API contract | [examples/api-contract/openapi.yaml](examples/api-contract/openapi.yaml) — **DL-BFF** dummy OpenAPI (no server code) |
| Related portfolios | [Portfolio 11](https://github.com/yunsunghun/portfolio-11-vulnerability-patch-ops) — patch windows, SLA, SBOM, [supply chain policy](https://github.com/yunsunghun/portfolio-11-vulnerability-patch-ops/blob/master/docs/SUPPLY-CHAIN-POLICY.md) |
| Security program (fictional) | Risk register, data classification, access lifecycle, ISO Annex A mapping, awareness metrics, breach scenario — `docs/10`–`15` |

## Quick start (under ~15 minutes)

1. **Demo service (Docker)**

   ```bash
   cd examples/demo-stack
   docker compose up -d
   curl -sf http://localhost:8080/health
   ```

2. **Ops scripts**

   ```bash
   chmod +x automation/scripts/*.sh
   ./automation/scripts/healthcheck.sh
   ./automation/scripts/disk_check.sh
   ./automation/scripts/log_watchdog.sh
   ```

   `log_watchdog.sh` defaults to `examples/sample-data/app.log` (dummy BFF log).

3. **Terraform (no cloud resources)**

   ```bash
   cd infra/terraform
   terraform init
   terraform apply -auto-approve
   ```

   `fmt` / `validate` also run in GitHub Actions on push/PR.

4. **Monitoring lab**

   ```bash
   cd examples/monitoring-lab
   docker compose up -d
   ```

   - Grafana: http://localhost:3000 (`demolab` / `demolab-grafana`)
   - Prometheus: http://localhost:9090
   - Alertmanager: http://localhost:9093

   Details: [examples/monitoring-lab/README.md](examples/monitoring-lab/README.md) · [docs/08-MONITORING-LAB.md](docs/08-MONITORING-LAB.md)

See also [`.env.example`](.env.example).

## Doc map (planning → operations)

| Doc | Purpose |
|-----|---------|
| [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md) | Dummy naming rules |
| [docs/00-PORTFOLIO-BRIEF.md](docs/00-PORTFOLIO-BRIEF.md) | Scope, success metrics |
| [docs/01-ARCHITECTURE.md](docs/01-ARCHITECTURE.md) | Logical architecture |
| [docs/02-SECURITY-GOVERNANCE.md](docs/02-SECURITY-GOVERNANCE.md) | Security governance |
| [docs/03-RUNBOOKS.md](docs/03-RUNBOOKS.md) | Runbooks + simulation prompts |
| [docs/04-DEPLOYMENT-CHECKLIST.md](docs/04-DEPLOYMENT-CHECKLIST.md) | Release / rollback |
| [docs/05-LAB-VIRTUAL-ENVIRONMENT.md](docs/05-LAB-VIRTUAL-ENVIRONMENT.md) | Lab topology (example) |
| [docs/06-MOCK-SOC-EXERCISE.md](docs/06-MOCK-SOC-EXERCISE.md) | Mock SOC tabletop |
| [docs/07-ETHICAL-RED-TEAM-LAB-NOTES.md](docs/07-ETHICAL-RED-TEAM-LAB-NOTES.md) | Ethical red-team ROE template |
| [docs/08-MONITORING-LAB.md](docs/08-MONITORING-LAB.md) | Monitoring lab narrative |
| [docs/09-TABLETOP-SESSION-AGENDA.md](docs/09-TABLETOP-SESSION-AGENDA.md) | 15-minute tabletop agenda |
| [docs/10-RISK-REGISTER.md](docs/10-RISK-REGISTER.md) – [docs/15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md](docs/15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md) | Risk, data, access, ISO mapping, awareness, breach scenario (fictional) |
| [docs/16-CI-SECURITY-SCANNING.md](docs/16-CI-SECURITY-SCANNING.md) | Gitleaks · Trivy notes |
| [docs/ABOUT-ME-TEMPLATE.md](docs/ABOUT-ME-TEMPLATE.md) | Narrative template (real vs fictional) |
| [docs/ABOUT-ME-FILLED-SAMPLE.md](docs/ABOUT-ME-FILLED-SAMPLE.md) | **Fictional** filled sample — replace before interviews |
| [docs/assets/README.md](docs/assets/README.md) | Screenshot / mockup guide |
| [docs/adr/README.md](docs/adr/README.md) | ADRs |
| [CHANGELOG.md](CHANGELOG.md) | Changelog |
| [security/access-review-quarterly-sample.md](security/access-review-quarterly-sample.md) | Quarterly access review (dummy) |
| [examples/api-contract/README.md](examples/api-contract/README.md) | OpenAPI dummy |

## Directory layout

```text
01/
├── docs/
├── examples/demo-stack/
├── examples/monitoring-lab/
├── examples/api-contract/
├── examples/sample-data/
├── automation/scripts/
├── infra/terraform/
├── infra/ansible/
├── monitoring/examples/
├── security/
└── .github/workflows/ci.yml
```

## GitHub Actions

- Workflow: [`.github/workflows/ci.yml`](.github/workflows/ci.yml) (runs on push/PR to `main` or `master`).
- Jobs include: ShellCheck, Terraform, Gitleaks, Trivy (`fs`, `vuln` scanner gate), `docker compose config`, demo stack smoke (`/health`), ops scripts smoke, Ansible syntax check, OpenAPI YAML parse.
- If `gh` cannot push workflow files, refresh the **workflow** OAuth scope: `gh auth refresh -h github.com -s workflow` — see [docs/16-CI-SECURITY-SCANNING.md](docs/16-CI-SECURITY-SCANNING.md).
- Optional local hooks: [CONTRIBUTING.md](CONTRIBUTING.md) (pre-commit, branch protection tips).

## Suggested reading order

- **Hiring / non-technical**: this README → `docs/00-PORTFOLIO-BRIEF.md` → start of `docs/03-RUNBOOKS.md`.
- **SRE / infra**: `docs/01-ARCHITECTURE.md` → `examples/demo-stack` → `examples/monitoring-lab` → `automation/scripts` → `infra/*`.
- **Security / SOC**: `docs/02-SECURITY-GOVERNANCE.md` → `docs/10`–`15` → `security/` → `monitoring/examples` → `docs/08-MONITORING-LAB.md`.

## How this relates to portfolios 02, 03, and 11

Portfolio **01** is the **integrated ops reference**; **02** observability/SLO, **03** incidents/postmortems, **11** vulnerability & patch operations. See [docs/00-PORTFOLIO-BRIEF.md](docs/00-PORTFOLIO-BRIEF.md).

## Contributing · screenshots · narrative

- [CONTRIBUTING.md](CONTRIBUTING.md)
- Screenshots: [docs/assets/README.md](docs/assets/README.md) (`grafana-dashboard-mockup.png` is an **AI mockup** — replace with real captures when possible)

## License · security

- [LICENSE](LICENSE) (MIT)
- [SECURITY.md](SECURITY.md) — replace contacts with your own.

---

Korean README: [README.md](README.md)
