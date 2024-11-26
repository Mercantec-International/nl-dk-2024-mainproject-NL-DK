// script.js

document.addEventListener("DOMContentLoaded", () => {
    const elements = {
        wifi: document.getElementById("wifi-data"),
        rcCar: document.getElementById("rc-car-data"),
        distance: document.getElementById("distance-data"),
        rpm: document.getElementById("rpm-data"),
        temperature: document.getElementById("temperature-data"), // New element for temperature
        humidity: document.getElementById("humidity-data")        // New element for humidity
    };

    async function fetchData() {
        try {
            const response = await fetch("fetch_data.php");
            const data = await response.json();

            elements.wifi.textContent = data.wifiStatus || "No data";
            elements.rcCar.textContent = data.rcCarStatus || "No data";
            elements.distance.textContent = `${data.distance || 0} cm`;
            elements.rpm.textContent = `${data.rpm || 0} RPM`;
            elements.temperature.textContent = `${data.temperature || 0} °C`; // Display temperature
            elements.humidity.textContent = `${data.humidity || 0} %`;         // Display humidity

            const cameraFeed = document.getElementById("camera-feed");
            if (data.cameraFeedUrl) {
                cameraFeed.innerHTML = `<img src="${data.cameraFeedUrl}" alt="Live Camera Feed" />`;
            } else {
                cameraFeed.textContent = "Live feed not available";
            }
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }

    fetchData();
    setInterval(fetchData, 5000);
});
