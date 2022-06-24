const baseUrl = 'http://localhost/TechnikBlog/databaseInterests.php';


async function getDatabaseContent() {
    const response = await fetch(baseUrl);
    const result = await response.json();
    return result;
}