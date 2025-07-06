# 🦖 Jurassic World Inventory Management System

> A robust, multi-module Java EE application for managing dinosaur inventory, with security, business logic, and a rich web interface.

---

## 📑 Table of Contents

1. [✨ Project Overview](#-project-overview)
2. [📂 Multi-Module Structure](#-multi-module-structure)
3. [🚧 Prerequisites](#-prerequisites)
4. [🛠️ Database Setup & JDBC Pool](#️-database-setup--jdbc-pool)
5. [⚙️ Persistence Configuration (`persistence.xml`)](#-persistence-configuration-persistencexml)
6. [🔍 Theory: JPA, Transactions & Security](#-theory-jpa-transactions--security)
7. [🏗️ Build & Deployment](#️-build--deployment)
8. [🌐 Web Interface & Screenshots](#-web-interface--screenshots)
9. [🤝 Contributing](#-contributing)
10. [📜 License](#-license)

---

## ✨ Project Overview

This **Jurassic World Inventory System** provides:

* **Dinosaur Management**: Add, update, delete, and view dinosaur records
* **Role-Based Access**: Admin consoles vs. user views
* **Secure Authentication**: Session-based login and registration
* **Modular Design**: Separates concerns into authentication, core services, product logic, and web UI

---

## 📂 Multi-Module Structure

```
/ (root)
├── AUTH/               # Security module (login, registration servlets)
├── CORE/               # Business entities & EJB services
├── Product/            # Inventory logic (DAOs, services)
├── WEB/                # Web-tier (JSF/JSP pages, controllers)
├── EAR/                # Deployment descriptor & EAR packaging
├── lib/                # Third-party libraries
├── pom.xml             # Parent Maven POM
└── README.md           # (this file)
```

> Each module is a Maven subproject; `EAR` assembles all into an enterprise archive.

---

## 🚧 Prerequisites

* **Java JDK 11+**
* **Maven 3.6+**
* **Application Server**: WildFly, GlassFish, or Payara with Java EE support
* **MySQL** (or equivalent RDBMS)

---

## 🛠️ Database Setup & JDBC Pool

1. **Create Database**:

   ```sql
   CREATE DATABASE jwd_inventory;
   ```
2. **Create Tables** (simplified example):

   ```sql
   CREATE TABLE dinosaurs (
     id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(100),
     species VARCHAR(100),
     acquisition_date DATE
   );
   ```
3. **Configure DataSource** in your server:

   * **WildFly** (`standalone.xml`):

     ```xml
     <datasource jndi-name="java:/jdbc/JWInventoryDS" pool-name="JWPool">
       <connection-url>jdbc:mysql://localhost:3306/jwd_inventory</connection-url>
       <driver>mysql</driver>
       <security><user-name>dbuser</user-name><password>dbpass</password></security>
     </datasource>
     ```
   * **Tomcat** (`context.xml`):

     ```xml
     <Resource name="jdbc/JWInventoryDS" auth="Container"
               type="javax.sql.DataSource" driverClassName="com.mysql.cj.jdbc.Driver"
               url="jdbc:mysql://localhost:3306/jwd_inventory"
               username="dbuser" password="dbpass" maxTotal="20"/>
     ```

---

## ⚙️ Persistence Configuration (`persistence.xml`)

Place under `CORE/src/main/resources/META-INF/persistence.xml`:

```xml
<persistence-unit name="JWInventoryPU" transaction-type="JTA">
  <jta-data-source>java:/jdbc/JWInventoryDS</jta-data-source>
  <class>com.jw.core.entity.Dinosaur</class>
  <!-- other entities -->
  <properties>
    <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL8Dialect"/>
    <property name="hibernate.hbm2ddl.auto" value="validate"/>
    <property name="hibernate.show_sql" value="false"/>
  </properties>
</persistence-unit>
```

---

## 🔍 Theory: JPA, Transactions & Security

* **JPA Entities** map Java classes (`Dinosaur`, `User`) to DB tables, enabling ORM.
* **Container-Managed Transactions** ensure ACID properties; annotate EJB methods with `@Transactional` or use deployment descriptor.
* **DataSource & Connection Pooling** reuse DB connections, improving performance and scalability.
* **Authentication Flow** (AUTH module):

  1. User submits credentials via `LoginServlet`.
  2. Credentials verified against `User` table via `UserService`.
  3. On success, user session is created; roles (ADMIN/USER) determine UI access.

---

## 🏗️ Build & Deployment

```bash
# Build all modules and assemble EAR
mvn clean install

# Deploy to WildFly
deploy EAR/target/jw-inventory.ear
```

> The EAR contains your EJB JARs and WAR for the `WEB` module.

---

![welcome](https://github.com/user-attachments/assets/c9d028cb-5a0b-4ea3-be58-62359a5fa495)

## 🌐 Web Interface & Screenshots

### 1️⃣ Login Page

> *Insert `WEB` module's login screenshot here*

![Login](https://github.com/user-attachments/assets/18c3e4fa-9f23-4218-b024-b6aeca25387d)

### 2️⃣ Register Page

> *Insert `WEB` module's Register screenshot here*

![Register](https://github.com/user-attachments/assets/6b53d496-c83d-4539-997f-0dffb2745c2d)

### 3️⃣ Home Dashboard

> *Insert screenshot of main dashboard*

![Home](https://github.com/user-attachments/assets/079cee34-1013-48da-9357-44814e3fa2bb)

### 4️⃣ Admin Console

> *Insert `WEB`/admin page screenshot*

![admin](https://github.com/user-attachments/assets/0c7b790a-5e21-4a41-9a34-b6a683bca238)

### 5️⃣ Add Dinosaur

> *Insert screenshot for adding inventory*

![add](https://github.com/user-attachments/assets/cf605ccd-3be6-4d1e-a19c-16c8fbb76d4f)

### 5️⃣ Profile Page

> *Insert screenshots of user profile page*

![profile](https://github.com/user-attachments/assets/859fbf65-e43c-49c3-b612-8765c5005fd4)

### 6️⃣ Removal Confirmation

> *Insert screenshot "when you remove"*

![when you remove](https://github.com/user-attachments/assets/89783b3e-f12c-4681-ba70-74d7835ee400)


---

## 🤝 Contributing

Fork the repo, create feature branches, and submit pull requests. Please follow Java EE best practices and include tests for new functionality.

---

## 📜 License

MIT © 2025 Tharindu714

---

> Roar into efficient inventory management with Java EE and dinosaur-scale performance! 🦖

