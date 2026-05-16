# Remote Internships

A collection of internship tasks and projects organized for clean navigation.

## Contents

- [DevelopersHub](#developershub)
- [ArchTechnologies](#archtechnologies)
- [Importing projects (subtrees)](#importing-projects-subtrees)

## DevelopersHub

- **Task 1**
  - [M1: Iris dataset visualization](./developerhub-task-1-dataset-visualization/README.md)
  - [M2: News classifier](./developerhub-task-1-m2-news-classifier/README.md)
- **Task 2**
  - [M1: Predictive model training (stock prices)](./developerhub-task-2-pridictive-model-training/README.md)
  - [M2: End-to-End ML Pipeline](./developerhub-task-2-m2-End-to-End-ML-Pipieline/README.md)
- [Task 3: Heart disease prediction](./developerhub-task-3-heart-disease-pridiction/README.md)
- [Task 4: General health query chatbot](./developerhub-task-4-general-health-query-chatbot/README.md)

## ArchTechnologies

- [ArchTechnology internship projects](./ArchTechnology-Internship-Projects/README.md)
- [ArchTechnologies Task 3](./ArchTechnology-Internship-Task-3/Readme.md) 

## Importing projects (subtrees)

This File is intended to take given repo remotes (ssh) and merge their working tree, so that the repos are cleanly organized and stored with the git working tree preserved in orginal state. 

This Script Can be reused, just replace the URLs for the remotes you want to add. 

Projects in this repository are intended to be imported using `git subtree add` without squashing so each project preserves its original commit history.

```bash
chmod +x ./import-subtrees.sh
./import-subtrees.sh --yes
```

Preview without making changes:

```bash
./import-subtrees.sh --dry-run
```
