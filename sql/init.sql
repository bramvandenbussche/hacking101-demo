DROP DATABASE IF EXISTS test_db;
CREATE DATABASE IF NOT EXISTS test_db;
GRANT ALL PRIVILEGES ON *.* TO 'fqsqsfqsdfqsfqef'@'%' IDENTIFIED BY 'fqsdj56153maqsdqs854/83143sqdff' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE test_db;

CREATE TABLE users (
    id          int,
    description varchar(80),
    username    varchar(100),
    password    varchar(100),
    isAdmin     int
);

insert into users(id, description, username, password, isAdmin) VALUES
    (1, 'Mega Admin', 'Bram Smith', 'ThisIsAnInvalidMD5HashAndSoItIsUnCrackable-No-https://crackstation.net/-ForYou', 1),
    (2, 'Normal User', 'John Doe', '2c103f2c4ed1e59c0b4e2e01821770fa', 0);

CREATE TABLE articles (
    id          int,
    title       varchar(100),
    excerpt     varchar(500),
    thumbnail   varchar(100),
    article     text
);

INSERT INTO articles (id, title, thumbnail, excerpt, article) VALUES
(-1, "Search functionality is a must", "search.jpg",
    "Any decent blog should have a search function",
    "
    <p>You’ve been there…you’re on a website, you can’t find what you need and there’s no search bar. 
    It’s very annoying and most likely, you’re quickly on your way back to Google to find another site within a few seconds. 
    Whether you’re a nonprofit or a small business, your website needs a search bar.</p>

    <p>So let’s talk about why your website should have a search bar and a fun way to display that search bar on your website.</p>

    <p>// TODO Bram: Search page proved to be unsafe and has been taken offline for the time being</p>
    "),
(1, "IDOR is holding the door", "idor.jpg",
    "IDOR is short 'for Insecure direct object references'",    
    "
        <p>
            Insecure direct object references (IDOR) are a type of access control vulnerability that arises when an 
            application uses user-supplied input to access objects directly. 
            The term IDOR was popularized by its appearance in the OWASP 2007 Top Ten. 
            However, it is just one example of many access control implementation mistakes that can lead to access controls being circumvented. 
            IDOR vulnerabilities are most commonly associated with horizontal privilege escalation, 
            but they can also arise in relation to vertical privilege escalation.
        </p>
        <h2>IDOR examples</h2>
        <p>
            There are many examples of access control vulnerabilities where user-controlled parameter values are used to access resources or functions directly.
        </p>
        <h3>IDOR vulnerability with direct reference to database objects</h3>
        <p>
            Consider a website that uses the following URL to access the customer account page, by retrieving information from the back-end database:
        </p>
        <pre><code>https://insecure-website.com/customer_account?customer_number=132355</code></pre>
        <p>
            Here, the customer number is used directly as a record index in queries that are performed on the back-end database.
            If no other controls are in place, an attacker can simply modify the <code>customer_number</code> value, 
            bypassing access controls to view the records of other customers.
            This is an example of an IDOR vulnerability leading to horizontal privilege escalation.
        </p>
        <p>
            An attacker might be able to perform horizontal and vertical privilege
            escalation by altering the user to one with additional privileges while bypassing access controls. 
            Other possibilities include exploiting password leakage or modifying parameters once the attacker has landed in the user's accounts page, for example.
        </p>
        <h3>IDOR vulnerability with direct reference to static files</h3>
        <p>
            IDOR vulnerabilities often arise when sensitive resources are located in static files on the server-side filesystem. 
            For example, a website might save chat message transcripts to disk using an incrementing filename, 
            and allow users to retrieve these by visiting a URL like the following:
        </p>
        <pre><code>https://insecure-website.com/static/12144.txt</code></pre>
        <p>
            In this situation, an attacker can simply modify the filename to retrieve a transcript created by another user
            and potentially obtain user credentials and other sensitive data.
        </p>
    "),
(2, "SQL Injection", "sqlinjection.png", 
    "SQL injection (SQLi) is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database.",
    "
        <h2>What is SQL injection (SQLi)?</h2>
        <div>
            <div>
                <p cms-metadescription>
                    SQL injection (SQLi) is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database.
                    It generally allows an attacker to view data that they are not normally able to retrieve. This might include data belonging to other users, 
                    or any other data that the application itself is able to access. In many cases, an attacker can modify or delete this data, 
                    causing persistent changes to the application's content or behavior.
                </p>
                <p>
                    In some situations, an attacker can escalate an SQL injection attack to compromise the underlying server or other back-end infrastructure, 
                    or perform a denial-of-service attack.
                </p>
            </div>
        </div>
        <h2>What is the impact of a successful SQL injection attack?</h2>
		<p>
		    A successful SQL injection attack can result in unauthorized access to sensitive data, such as passwords, credit card details, or personal user information. Many high-profile data breaches in recent years have been the result of SQL injection attacks, leading to reputational damage and regulatory fines. In some cases, an attacker can obtain a persistent backdoor into an organization's systems, leading to a long-term compromise that can go unnoticed for an extended period.
	    </p>
		<h2>SQL injection examples</h2>
        <p>
            There are a wide variety of SQL injection vulnerabilities, attacks, and techniques, which arise in different situations. Some common SQL injection examples include:
        </p>
        <ul>
            <li>Retrieving hidden data, where you can modify an SQL query to return additional results.</li>
            <li>Subverting application logic, where you can change a query to interfere with the application's logic.</li>
            <li>UNION attacks, where you can retrieve data from different database tables.</li>
            <li>Examining the database, where you can extract information about the version and structure of the database.</li>
            <li>Blind SQL injection, where the results of a query you control are not returned in the application's responses.</li>
        </ul>
        <h2>Retrieving hidden data</h2>
        <p>
            Consider a shopping application that displays products in different categories. When the user clicks on the Gifts category, their browser requests the URL:
        </p>
        <pre><code>https://insecure-website.com/products?category=Gifts</code></pre>
        <p>
            This causes the application to make an SQL query to retrieve details of the relevant products from the database:
        </p>
        <pre><code>SELECT * FROM products WHERE category = 'Gifts' AND released = 1</code></pre>
        <p>
            This SQL query asks the database to return:
        </p>
        <ul>
            <li>
                all details (*)
            </li>
            <li>
                from the products table
            </li>
            <li>
                where the category is Gifts
            </li>
            <li>
                and released is 1.
            </li>
        </ul>
        <p>
            The restriction <code>released = 1</code> is being used to hide products that are not released. For unreleased products, presumably <code>released = 0</code>.
        </p>
        <p>
            The application doesn't implement any defenses against SQL injection attacks, so an attacker can construct an attack like:
        </p>
        <pre><code>https://insecure-website.com/products?category=Gifts'--</code></pre>
        <p>
            This results in the SQL query:
        </p>
        <pre><code>SELECT * FROM products WHERE category = 'Gifts'--' AND released = 1</code></pre>
        <p>
            The key thing here is that the double-dash sequence <code>--</code> is a comment indicator in SQL, and means that the rest of the query is interpreted as a comment. This effectively removes the remainder of the query, so it no longer includes <code>AND released = 1</code>. This means that all products are displayed, including unreleased products.
        </p>
        <p>
            Going further, an attacker can cause the application to display all the products in any category, including categories that they don't know about:
        </p>
        <pre><code>https://insecure-website.com/products?category=Gifts'+OR+1=1--</code></pre>
        <p>
            This results in the SQL query:
        </p>
        <pre><code>SELECT * FROM products WHERE category = 'Gifts' OR 1=1--' AND released = 1</code></pre>
        <p>
            The modified query will return all items where either the category is Gifts, or 1 is equal to 1. Since <code>1=1</code> is always true, the query will return all items.
        </p>
    "),
(3, "Cookie manipulation", "cookie.jpg", 
    "Cookie manipulation excerpt",
    "You can change cookies using the browser developer tools, if the backend trusts the cookie to be true, this can be abused by an attacker");