## Project: Automated Azure SQL Schema Migration Pipeline

### 📌 Project Overview

This project demonstrates a fully automated CI/CD approach to database schema management. By treating the database schema as code, this pipeline ensures that manual database updates are eliminated, reducing human error and ensuring environment consistency across the development lifecycle.

### 🏗️ System Architecture

The architecture follows a modern DevOps pattern where the repository acts as the single source of truth for both infrastructure configuration and database state.

1. **Source Control (GitHub/Azure Repos):** Stores the T-SQL migration scripts and the YAML pipeline definition.
2. **Continuous Integration (Build Stage):** Validates the repository structure and packages the SQL scripts as a versioned build artifact.
3. **Continuous Deployment (Release Stage):** * Retrieves the build artifacts.
* Dynamically manages firewall access to the cloud database.
* Executes the schema changes against the target Azure SQL instance.


4. **Target Infrastructure:** A serverless Azure SQL Database instance.

### 🛠️ Tech Stack & Tooling

* **Cloud Provider:** Microsoft Azure
* **Database Engine:** Azure SQL (Logical Server & Serverless Database)
* **Orchestration:** Azure Pipelines (YAML Multi-stage)
* **Security:** Azure DevOps Library (Secret Variable Groups)
* **Database Language:** T-SQL (Idempotent scripting)

### 🚀 Key DevOps Features Implemented

#### 1. Idempotent Migrations

The pipeline utilizes "Smart Scripts" that check the state of the database before execution. This ensures that the pipeline can be run repeatedly without causing errors or duplicate objects, a critical requirement for automated recovery and scaling.

#### 2. Automated Firewall Management

To maintain a high security posture, the pipeline utilizes dynamic IP detection. It temporarily whitelists the hosted runner's IP address only for the duration of the deployment task, closing the connection immediately after completion.

#### 3. Secure Secret Management

Zero-trust security principles are applied by offloading sensitive credentials (SQL Admin passwords) to encrypted Variable Groups. This ensures that production secrets are never stored in plain text within the source code or visible in execution logs.

#### 4. Artifact Traceability

By using a multi-stage approach, the project separates the "Build" (packaging the scripts) from the "Deploy" (executing them). This creates a clear audit trail, allowing teams to see exactly which version of the code was deployed to the database at any given time.

### 📈 Real-World Application

In a production environment, this workflow allows DevOps engineers to:

* Perform "Dry Runs" of database changes before they hit production.
* Synchronize database changes with application code deployments.
* Maintain a history of all schema modifications for compliance and debugging.

