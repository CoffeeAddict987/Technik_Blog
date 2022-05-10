const getDatabaseContent = () => {
    const content = [];
    for(let i = 0; i < 15; i++) {
        content.push({
            id: i,
            title: `Element ${i}`,
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum nunc enim, in placerat dui finibus sed. Pellentesque eleifend orci quis feugiat ultricies. Sed congue, ex nec posuere luctus, purus diam elementum lacus, et consectetur mauris neque eu nisl. Sed sapien nisl, feugiat et dictum eu, commodo sit amet ante. Suspendisse accumsan tincidunt sapien, id ullamcorper lacus ullamcorper vitae. Cras iaculis lectus massa, eget porttitor lectus placerat eget. Suspendisse sollicitudin nulla a felis luctus varius. Mauris laoreet mi nisl, a scelerisque ipsum condimentum et. Ut sagittis diam id nisi dictum blandit. Suspendisse potenti. Nulla laoreet blandit laoreet. Quisque molestie a turpis id egestas. Sed accumsan ultricies dictum. Sed interdum non neque id aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc posuere placerat sapien vel gravida.',
        });
    }  
    return content;
};