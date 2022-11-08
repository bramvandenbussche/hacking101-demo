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
(1, "IDOR is holding the door", "idor.jpg",
    " Insecure direct object references (IDOR) are a type of access control vulnerability that arises when an 
        application uses user-supplied input to access objects directly.",    
    "
        <p>IDOR is short 'for Insecure direct object references'.</p>
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
        <code>https://insecure-website.com/customer_account?customer_number=132355</code>
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
        <code>https://insecure-website.com/static/12144.txt</code>
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
                    SQL injection (SQLi) is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database. It generally allows an attacker to view data that they are not normally able to retrieve. This might include data belonging to other users, or any other data that the application itself is able to access. In many cases, an attacker can modify or delete this data, causing persistent changes to the application's content or behavior.
                </p>
                <p>
                    In some situations, an attacker can escalate an SQL injection attack to compromise the underlying server or other back-end infrastructure, or perform a denial-of-service attack.
                </p>
            </div>
        </div>
    ");