# Remote Internships — Monorepo Archive

This repository is an umbrella portfolio archive for remote internship and task projects, organized for recruiter-friendly navigation.

> **History Preservation:** Projects are intended to be imported with `git subtree add` **without squashing**, so each project keeps its original commit timeline and authorship history.

## Project Dashboard

| Organization | Project | Folder | Tech Stack | Deliverables |
|---|---|---|---|---|
| DevelopersHub | developerhub-task-1-dataset-visualization | [`DevelopersHub/developerhub-task-1-dataset-visualization`](./DevelopersHub/developerhub-task-1-dataset-visualization) | _TBD_ | _TBD_ |
| DevelopersHub | developerhub-task-2-pridictive-model-training | [`DevelopersHub/developerhub-task-2-pridictive-model-training`](./DevelopersHub/developerhub-task-2-pridictive-model-training) | _TBD_ | _TBD_ |
| DevelopersHub | developerhub-task-3-heart-disease-pridiction | [`DevelopersHub/developerhub-task-3-heart-disease-pridiction`](./DevelopersHub/developerhub-task-3-heart-disease-pridiction) | _TBD_ | _TBD_ |
| DevelopersHub | developerhub-task-4-general-health-query-chatbot | [`DevelopersHub/developerhub-task-4-general-health-query-chatbot`](./DevelopersHub/developerhub-task-4-general-health-query-chatbot) | _TBD_ | _TBD_ |
| ArchTechnologies | ArchTechnology-Internship-Projects | [`ArchTechnologies/ArchTechnology-Internship-Projects`](./ArchTechnologies/ArchTechnology-Internship-Projects) | _TBD_ | _TBD_ |

## Intended Structure

```text
.
├── DevelopersHub/
│   ├── developerhub-task-1-dataset-visualization/
│   ├── developerhub-task-2-pridictive-model-training/
│   ├── developerhub-task-3-heart-disease-pridiction/
│   └── developerhub-task-4-general-health-query-chatbot/
└── ArchTechnologies/
    └── ArchTechnology-Internship-Projects/
```

## Import Script

Use the root script to perform history-preserving imports locally:

```bash
chmod +x ./import-subtrees.sh
./import-subtrees.sh --yes
```

For a no-change preview:

```bash
./import-subtrees.sh --dry-run
```
