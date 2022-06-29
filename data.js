const baseUrlArticles = 'http://localhost/TechnikBlog/databaseArticles.php';
const baseUrlInterests = 'http://localhost/TechnikBlog/databaseInterests.php';


async function getArticlesContentById(id) {
    // const response = await fetch(`${baseUrlArticles}?id=${id}`);
    const response = await fetch('' + baseUrlArticles + '?id=' + id + '&quantity&tags'); // equivalent
    const result = await response.json();
    return result;
}

async function getArticlesContentByTags(quantity, tag) {
    // const response = await fetch(`${baseUrlArticles}?id=${id}`);
    const response = await fetch('' + baseUrlArticles + '?id&quantity=' + quantity + '&tags=' + tag); // equivalent
    const result = await response.json();
    return result;
}

async function getInterestsContent() {
    const response = await fetch(baseUrlInterests);
    const result = await response.json();
    return result;
}