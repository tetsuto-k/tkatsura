// script.js

function showPopup() {
    // Get the popup container
    const popupContainer = document.getElementById("popupContainer");

    // Load content from the external HTML file
    fetch("popup_content.html")
        .then(response => response.text())
        .then(content => {
            // Set the content inside the popup container
            popupContainer.innerHTML = content;

            // Show the popup
            popupContainer.classList.add("active");
        });
}

function hidePopup() {
    // Hide the popup
    document.getElementById("popupContainer").classList.remove("active");
}
