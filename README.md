# payment_demo



https://github.com/user-attachments/assets/d98c28c0-f04c-4c8b-88fc-def3b02687ac

## Directory Structure

The following diagram outlines the project's main directories and feature modules.

```mermaid
flowchart TD
    A[Project Root]
    A --> lib
    A --> assets
    A --> pubspec.yaml

    lib --> common
    lib --> core
    lib --> environment
    lib --> feature
    lib --> main.dart

    feature --> auth
    feature --> card_scan
    feature --> home
    feature --> native
    feature --> payment
    feature --> splash

    auth --> presentation
    auth --> domain
    auth --> data

    card_scan --> presentation
    card_scan --> domain
    card_scan --> data

    home --> presentation
    payment --> presentation
    splash --> presentation
```

## Architecture Overview

This diagram illustrates communication between layers and how state is managed with Riverpod and GetIt.

```mermaid
flowchart LR
    subgraph Presentation
        UI[Widget / UI]
        Provider[Riverpod Provider]
    end
    subgraph Domain
        Usecase[Usecase]
        RepositoryInterface[Repository Interface]
    end
    subgraph Data
        RepositoryImpl[Repository Implementation]
        DataSource[(Data Source)]
    end

    UI --> Provider
    Provider --> |GetIt| Usecase
    Usecase --> RepositoryInterface
    RepositoryInterface --> RepositoryImpl
    RepositoryImpl --> DataSource
    DataSource --> RepositoryImpl
    RepositoryImpl --> Usecase
    Usecase --> Provider
    Provider --> |State Updates| UI
```

