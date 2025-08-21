# payment_demo



https://github.com/user-attachments/assets/d98c28c0-f04c-4c8b-88fc-def3b02687ac

## Directory Structure

The following diagram outlines the project's main directories and feature modules.

```mermaid
flowchart TD
    A[Project Root]
    A --> lib
    A --> protos

    lib --> common
    lib --> core
    lib --> environment
    lib --> screen/feature
    lib --> main.dart

    common --> commonData
    common --> commonDomain
    common --> commonPresentation

    environment --> config
    environment --> flavor

    core --> util
    core --> constant
    core --> router
    core --> theme
    core --> extension

    screen/feature --> signIn
    screen/feature --> card
    screen/feature --> payment
    screen/feature --> splash

    signIn --> presentation
    signIn --> domain
    signIn --> data

    data --> datasource
    data --> repository
    data --> models

    domain --> repository-interface
    domain --> usecase
    domain --> entities

    presentation --> widget
    presentation --> providers

    


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
        Entities[Entities]
        RepositoryInterface[Repository Interface]
    end
    subgraph Data
        RepositoryImpl[Repository Implementation]
        Models[Models]
        gRPCMapper[gRPC Mapper]
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

