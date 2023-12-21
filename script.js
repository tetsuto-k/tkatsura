// script.js

function showPopup(htmlFileName) {
    // Get the popup container
    const popupContainer = document.getElementById("popupContainer");
    const overlayBackground = document.getElementById("overlayBackground");

    // Load content from the external HTML file
    fetch(htmlFileName)
        .then(response => response.text())
        .then(content => {
            // Set the content inside the popup container
            popupContainer.innerHTML = content;

            // Show the popup
            popupContainer.classList.add("active");
        
            // Block everything in the main website
            overlayElement.classList.add("active");
        });
}

function hidePopup() {
    // Hide the popup
    document.getElementById("popupContainer").classList.remove("active");
    document.getElementById("overlayBackground").classList.remove("active");
}
