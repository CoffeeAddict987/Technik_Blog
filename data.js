const getDatabaseContent = () => {
    const content = [];
    for(let i = 0; i < 5; i++) {
        content.push({
            id: i,
            title: `Blogtitel ${i+1}`,
            text: 'Beispielinhalt Beispielinhalt Beispielinhalt Beispielinhalt Beispielinhalt Beispielinhalt Beispielinhalt ',
            hallo: 'hallo',
        });
    }  
    return content;
};