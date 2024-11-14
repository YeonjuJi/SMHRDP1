// JavaScript for additional functionality can be added here
document.addEventListener('DOMContentLoaded', function() {
    console.log("Community board loaded successfully.");
});
// Function to search posts
function searchPosts() {
    // Declare variables
    let input = document.getElementById('searchInput');
    let filter = input.value.toLowerCase();
    let table = document.getElementById('postsTable');
    let tr = table.getElementsByTagName('tr');

    // Loop through all table rows, and hide those that don't match the search query
    for (let i = 1; i < tr.length; i++) { // start from 1 to skip the header row
        let td = tr[i].getElementsByTagName('td')[1]; // we're searching within the second column (Title)
        if (td) {
            let txtValue = td.textContent || td.innerText;
            if (txtValue.toLowerCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }       
    }
}

