// script.js

function showPopup(htmlFileName) {
    // Get the popup container
    const popupContainer = document.getElementById("popupContainer");
    var overlayElement = document.querySelector('.overlay');

    // Load content from the external HTML file
    fetch(htmlFileName)
        .then(response => response.text())
        .then(content => {
            // Set the content inside the popup container
            popupContainer.innerHTML = content;

            // Show the popup
            popupContainer.classList.add("active");
        
            // Block everyything in the main website
            overlayElement.style.display = 'block';
        });
}

function hidePopup() {
    // Hide the popup
    document.getElementById("popupContainer").classList.remove("active");
    var overlayElement = document.querySelector('.overlay');
    overlayElement.style.display = 'none';
}
