fetch('popup.html')
    .then(response => response.text())
    .then(content => {
        document.getElementById('displayText').innerText = document.getElementById('moveToIndex');
    })
    .catch(error => console.error('Error fetching content:', error));