document.addEventListener('DOMContentLoaded', function() {
    // Get the query parameter 'id' from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const postId = urlParams.get('id');

    // Check if a postId was provided
    if (postId) {
        // Fetch post details based on postId (for simplicity, we're using static data here)
        // In a real application, you might fetch this data from a server
        const postDetails = {
            1: {
                title: 'Post Title 1',
                author: 'User1',
                date: '08-13',
                views: 3333,
                content: 'Detailed content for Post Title 1.'
            },
            2: {
                title: 'Post Title 2',
                author: 'User2',
                date: '08-13',
                views: 1563,
                content: 'Detailed content for Post Title 2.'
            }
            // Add more post details as needed
        };

        const post = postDetails[postId];
        if (post) {
            document.getElementById('postDetail').innerHTML = `
                <h1>${post.title}</h1>
                <p><strong>Author:</strong> ${post.author}</p>
                <p><strong>Date:</strong> ${post.date}</p>
                <p><strong>Views:</strong> ${post.views}</p>
                <p>${post.content}</p>
            `;
        } else {
            document.getElementById('postDetail').innerHTML = '<p>Post not found.</p>';
        }
    } else {
        document.getElementById('postDetail').innerHTML = '<p>No post ID provided.</p>';
    }
});

