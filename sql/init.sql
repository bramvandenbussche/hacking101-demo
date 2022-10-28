DROP DATABASE IF EXISTS test_db;
CREATE DATABASE IF NOT EXISTS test_db;
GRANT ALL PRIVILEGES ON *.* TO 'fqsqsfqsdfqsfqef'@'%' IDENTIFIED BY 'fqsdj56153maqsdqs854/83143sqdff' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE test_db;

CREATE TABLE articles (
    id          int,
    title       varchar(100),
    thumbnail   varchar(100),
    article     text
);

INSERT INTO articles (id, title, thumbnail, article) VALUES
(1, "IDOR is holding the door", "idor.jpg", "<p>IDOR is short 'for Insecure direct object references'.</p><p>Insecure direct object references (IDOR) are a type of access control vulnerability that arises when an application uses user-supplied input to access objects directly. The term IDOR was popularized by its appearance in the OWASP 2007 Top Ten. However, it is just one example of many access control implementation mistakes that can lead to access controls being circumvented. IDOR vulnerabilities are most commonly associated with horizontal privilege escalation, but they can also arise in relation to vertical privilege escalation.</p>");