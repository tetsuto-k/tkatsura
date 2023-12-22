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
            popupContainer.style.visibility = "visible";
            setTimeout(function () {
                popupContainer.classList.add("active");
              }, 100);

            // Block everything in the main website
            overlayBackground.style.visibility = "visible";
            setTimeout(function () {
                overlayBackground.classList.add("active");
              }, 100);
        });
}

function hidePopup() {
    // Hide the popup
    document.getElementById("popupContainer").classList.remove("active");
    document.getElementById("overlayBackground").classList.remove("active");
    
    setTimeout(function () {
        document.getElementById("popupContainer").style.visibility = "hidden";
      }, 900);
    setTimeout(function () {
        document.getElementById("overlayBackground").style.visibility = "hidden";
      }, 900);
}
