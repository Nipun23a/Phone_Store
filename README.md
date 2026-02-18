# Phone Store (Java E‑Commerce)

This repository contains a Java web application for a **Phone Store / E‑Commerce** system.
The main application is in the `E-COMMERCE/` folder and is built with **Maven**, **Servlet/JSP**, **JPA (EclipseLink)**, and **MySQL**.

---

## Project Structure

```text
Phone_Store/
├── README.md                     # This guide
└── E-COMMERCE/
    ├── pom.xml                   # Maven build + dependencies
    ├── src/main/java/            # Java source (Servlets, DAO, Service, Model)
    ├── src/main/resources/       # JPA persistence config
    ├── src/main/webapp/          # JSP views, images, web.xml
    └── Database/                 # SQL files and project reference assets
```

---

## Features

### Customer features
- Register a new account.
- Log in / log out.
- Browse products (mobile phones and accessories).
- View product information.
- Add items to cart.
- Remove items from cart.
- Checkout and place an order.

### Admin features
- Admin login and dashboard access.
- Add new items/products.
- Update item details.
- Remove items.
- Add admin users.

---

## Tech Stack

- **Java 11**
- **Jakarta Servlet + JSP/JSTL**
- **JPA (EclipseLink)**
- **MySQL**
- **Maven** (WAR packaging)
- **Bootstrap 4** for frontend styling

---

## Important Endpoints (Servlet Mappings)

- `/login` – user login
- `/register` – user registration
- `/logout` – end user session
- `/add-to-cart` – add product to cart
- `/remove-from-cart` – remove product from cart
- `/cart-check-out` – checkout process
- `/item` – add item (admin)
- `/UpdateTheServlet` – update item (admin)
- `/RemoveItemServlet` – remove item (admin)
- `/add-admin` – create admin user

> The application welcome page is `index.jsp`.

---

## Database Setup

Database scripts are available in:

- `E-COMMERCE/Database/ECOMM1.sql`
- `E-COMMERCE/Database/Ecomm.sql`

Default JPA connection settings are currently configured in:

`E-COMMERCE/src/main/resources/META-INF/persistence.xml`

```xml
<property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/ecommerce"/>
<property name="jakarta.persistence.jdbc.user" value="root"/>
<property name="jakarta.persistence.jdbc.password" value="1234"/>
```

Update these values to match your local MySQL environment.

---

## How to Run

### 1) Prerequisites
- JDK 11+
- Maven 3.8+
- MySQL Server
- Servlet container (for WAR deployment), e.g. Tomcat 10+

### 2) Configure database
1. Create a MySQL database (for example: `ecommerce`).
2. Import one of the SQL files from `E-COMMERCE/Database/`.
3. Update `persistence.xml` with your DB URL, username, and password.

### 3) Build the project
From `E-COMMERCE/`:

```bash
./mvnw clean package
```

Or, if Maven wrapper is not executable:

```bash
mvn clean package
```

### 4) Deploy
- Deploy generated WAR file (from `target/`) to your servlet container.
- Start the server and open the application URL in your browser.

---

## Main Code Areas

- `src/main/java/com/mycompany/ecommerce/servlet/` – request handling and routing.
- `src/main/java/com/mycompany/ecommerce/dao/` – database access.
- `src/main/java/com/mycompany/ecommerce/service/` – business logic.
- `src/main/java/com/mycompany/ecommerce/model/` – entity/domain models.
- `src/main/webapp/` – JSP pages and static resources.

---

## Notes

- Session timeout is configured to **30 minutes** in `web.xml`.
- Admin access to `admin-dashboard.jsp` is protected with `AdminAccessFilter`.
- This project mixes `javax.servlet` and `jakarta.servlet` dependencies; keep app server and dependencies aligned when deploying.

---

## Future Improvements (Suggested)

- Move DB credentials to environment variables.
- Add unit/integration tests.
- Use a logging framework instead of `System.out.println`.
- Add pagination/search for products.
- Improve error handling and validation.

